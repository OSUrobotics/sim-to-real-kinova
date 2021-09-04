"""
Compares simulator to real world trials
"""

import os
import argparse
import glob
from pathlib import Path

import numpy as np
import pandas as pd

# i know... its a sin to use two plotting libraries.
import matplotlib.pyplot as plt
import seaborn as sns

import imageio

from utils import state_dim_setup

# TODO: add this helper fn to utils
import operator


def cropND(img, bounding):  # taken from https://stackoverflow.com/a/50322574
    start = tuple(map(lambda a, da: a // 2 - da // 2, img.shape, bounding))
    end = tuple(map(operator.add, start, bounding))
    slices = tuple(map(slice, start, end))
    return img[slices]


class ExperimentAnalysis:
    """
    TODO: eventually replace visualize_irl.py with this object!
    """

    def __init__(self, log_dir, base_location=np.array([0, 0, 0]),
                 ideal_grasp_quat=np.array([np.pi / 2, 0, 0, np.pi / 2])):
        # make results directory first...
        assert Path(log_dir).exists(), 'Check that the log directory ' + log_dir + ' exists.'

        episode_dir = os.path.join(log_dir, 'episodes/')

        # get filepaths from episodes directory.
        reward_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'reward*.npy')))
        obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'obs*.npy')))
        next_obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'next_obs*.npy')))
        action_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'action*.npy')))

        # trans_err_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'translation_err*.npy')))
        # quat_dist_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'quat_dist*.npy')))

        start_pose_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'start_pose*.npy')))
        noise_arr_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'noise_arr*.npy')))

        success_arr = np.array([np.load(filepath)[-1] for filepath in reward_filepaths])
        noise_arr = np.array([np.load(filepath) for filepath in noise_arr_filepaths])

        x_noise_arr = noise_arr[:, 0]
        y_noise_arr = noise_arr[:, 1]
        z_noise_arr = noise_arr[:, 2]
        roll_noise_arr = noise_arr[:, 3]
        pitch_noise_arr = noise_arr[:, 4]
        yaw_noise_arr = noise_arr[:, 5]

        start_pose_arr = np.array([np.load(filepath) for filepath in start_pose_filepaths])
        hand_orientation_quat_arr = start_pose_arr[:, -4:]  # last 4 elems are x,y,z,w quaternion...

        # the dataframe
        self.df = pd.DataFrame(
            {'x_noise': x_noise_arr, 'y_noise': y_noise_arr, 'z_noise': z_noise_arr, 'roll_noise': roll_noise_arr,
             'pitch_noise': pitch_noise_arr, 'yaw_noise': yaw_noise_arr, 'Success': success_arr == True})

        # calculation stuff: do this after defining dataframe

        # step 1: get translation_err. flips to neg value if x is negative
        # note: we add 0.00001 cuz otherwise, np.sign(0) is just 0.
        self.df['trans_err'] = self.df[['x_noise', 'y_noise', 'z_noise']].apply(
            lambda x: np.sign(x[0] + 0.00001) * np.sqrt(np.sum((x.to_numpy() - base_location) ** 2)), axis=1)

        # step 2: get quat distance
        quaternion_dot_prod = np.dot(hand_orientation_quat_arr, ideal_grasp_quat)
        angle_difference = np.arccos(quaternion_dot_prod)  # in degrees
        quat_distance = np.rad2deg(angle_difference)  # in radians
        quat_distance = np.nan_to_num(quat_distance, nan=0, posinf=0,
                                      neginf=0)  # for now just set values of positive infinity and negative infinity to also round to 0
        self.df['quat_dist'] = quat_distance

        """
        replay buffer stuff
        """
        self.reward_buffer = np.array([np.load(filepath) for filepath in reward_filepaths])
        self.obs_buffer = np.array([np.load(filepath) for filepath in obs_filepaths])
        self.action_buffer = np.array([np.load(filepath, allow_pickle=True) for filepath in action_filepaths])
        self.next_obs_buffer = np.array([np.load(filepath) for filepath in next_obs_filepaths])

    def __len__(self):
        """
        Returns
        -------
        size of the episode memory

        """
        return len(self.df)

    def get_episode_data(self, episode_idx):
        """
        get the episode data

        Parameters
        ----------
        episode_idx

        Returns
        -------

        """
        assert 0 <= episode_idx < len(self.df), "Requested an episode index that doesn't exist: " + episode_idx

        buffer_res = {
            'reward': self.reward_buffer[episode_idx],
            'obs': self.obs_buffer[episode_idx],
            'action': self.action_buffer[episode_idx],
            'next_obs': self.next_obs_buffer[episode_idx]
        }

        res = {
            'df': self.df.iloc[episode_idx],
            'buffer': buffer_res
        }

        return res


class SimRealCompare:
    """
    class to compare simulation to reality
    
    should consist of two buffers...
    """

    def __init__(self, real_dir, sim_dir, base_location=np.array([0, 0, 0]),
                 ideal_grasp_quat=np.array([np.pi / 2, 0, 0, np.pi / 2])):
        self.real_anal = ExperimentAnalysis(real_dir, base_location=base_location, ideal_grasp_quat=ideal_grasp_quat)
        self.sim_anal = ExperimentAnalysis(sim_dir, base_location=base_location, ideal_grasp_quat=ideal_grasp_quat)

        print('real analysis length: ', len(self.real_anal))
        print('sim analysis length: ', len(self.sim_anal))

    def __len__(self):
        return min(len(self.real_anal), len(self.sim_anal))

    def get_episode_data(self, episode_idx):
        real_anal_data = self.real_anal.get_episode_data(episode_idx)
        sim_anal_data = self.sim_anal.get_episode_data(episode_idx)

        # get actions
        real_action = real_anal_data['buffer']['action']
        sim_action = sim_anal_data['buffer']['action']

        # get observations
        real_obs = real_anal_data['buffer']['obs']
        sim_obs = sim_anal_data['buffer']['obs']

        # get rewards
        real_success = real_anal_data['df']['Success']
        sim_success = sim_anal_data['df']['Success']

        # for sanity check
        # TODO: include roll pitch yaw
        real_noise = real_anal_data['df'][['x_noise', 'y_noise', 'z_noise']].to_numpy()
        sim_noise = sim_anal_data['df'][['x_noise', 'y_noise', 'z_noise']].to_numpy()

        noise_equal = np.all(real_noise == sim_noise)
        print('Check for equality between noises: ', noise_equal)
        if not noise_equal:
            print('Difference detected (real / sim): ', real_noise, sim_noise)

        res = {
            'noise': (real_noise, sim_noise),
            'action': (real_action, sim_action),
            'obs': (real_obs, sim_obs),
            'success': (real_success, sim_success)
        }

        return res


"""
Example usage:
python3 compare_sim_to_real_analysis.py --real_dir real_positional_test_v3_constant --sim_dir sim_positional_test_v3_constant --results_dir compare_positional_test_v3_constant --compare_gifs

python visualize_irl.py --log_dir real_positional_test_v4_constant/ && python visualize_irl.py --log_dir sim_positional_test_v4_constant/
python3 compare_sim_to_real_analysis.py --real_dir real_positional_test_v4_constant --sim_dir sim_positional_test_v4_constant --results_dir compare_positional_test_v4_constant --compare_gifs

python3 compare_sim_to_real_analysis.py --real_dir real_positional_test_v6_constant --sim_dir sim_positional_test_v6_constant --results_dir compare_positional_test_v6_constant --compare_gifs

python3 compare_sim_to_real_analysis.py --real_dir real_positional_test_v6_constant --sim_dir sim_positional_test_v6_constant --results_dir test_compare_positional_test_v6_constant --compare_gifs
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--real_dir", type=str, required=True)  # real directory
    parser.add_argument("--sim_dir", type=str, required=True)  # sim directory
    parser.add_argument("--results_dir", type=str, required=True)  # results directory
    parser.add_argument("--state_dim", type=str, default="adam_sim2real_v02")
    parser.add_argument("--compare_gifs", action='store_true', default=False)

    args = parser.parse_args()

    # hardcoded params. TODO: change the values of these bad boys with argparse.
    base_location = np.array([0, 0, 0])
    ideal_grasp_quat = np.array([np.pi / 2, 0, 0, np.pi / 2])

    reduced_state_space_idx = state_dim_setup(args.state_dim)

    real_dir = args.real_dir
    # TODO: Add relative directory
    assert Path(real_dir).exists(), 'Check that the real log directory ' + real_dir + ' exists.'

    sim_dir = args.sim_dir
    # TODO: Add relative directory
    assert Path(sim_dir).exists(), 'Check that the sim log directory ' + sim_dir + ' exists.'

    # create the results directory
    results_dir = args.results_dir
    results_path = Path(results_dir)
    results_path.mkdir(parents=True, exist_ok=True)

    # create the observation subdirectory
    results_obs_dir = os.path.join(results_dir, 'obs/')
    results_obs_path = Path(results_obs_dir)
    results_obs_path.mkdir(parents=True, exist_ok=True)

    if args.compare_gifs:
        real_results_dir = os.path.join(real_dir, 'video/')
        assert Path(real_results_dir).exists(), 'Check that the real results directory ' + real_results_dir + ' exists.'

        sim_results_dir = os.path.join(sim_dir, 'video/')
        assert Path(sim_results_dir).exists(), 'Check that the sim results directory ' + sim_results_dir + ' exists.'

        # create the video comparison subdirectory
        compare_video_dir = os.path.join(results_dir, 'compare_video/')
        compare_video_path = Path(compare_video_dir)
        compare_video_path.mkdir(parents=True, exist_ok=True)

    sim_real_compare = SimRealCompare(real_dir, sim_dir, base_location=base_location, ideal_grasp_quat=ideal_grasp_quat)

    # keep all the arrays out here, and append. we will create df at the end.
    # why? because if you append to a df, new arrays are copied over every single time.
    x_noise_arr = []
    y_noise_arr = []
    outcome_arr = []  # will either be 'both succeed', 'both fail', 'real succeed sim fails', 'sim succeed real fails'
    obs_arr = []
    action_arr = []
    env_arr = []

    for episode_idx in range(len(sim_real_compare)):
        comparison_dict = sim_real_compare.get_episode_data(episode_idx)
        noise_arr = comparison_dict['noise'][0]

        x_noise = noise_arr[0]
        y_noise = noise_arr[1]
        # z_noise = noise_arr[2]

        # Success processing

        real_success = comparison_dict['success'][0]
        sim_success = comparison_dict['success'][1]

        # if real_success and sim_success:
        #     outcome_arr.append('both succeed')
        # elif not real_success and not sim_success:
        #     outcome_arr.append('both fail')
        # elif real_success and not sim_success:
        #     outcome_arr.append('real succeed sim fails')
        # elif not real_success and sim_success:
        #     outcome_arr.append('sim succeed real fails')

        # appending everything, but twice - representing the same point from sim and real side as different
        x_noise_arr.append(x_noise)
        y_noise_arr.append(y_noise)
        env_arr.append('real')
        outcome_arr.append(real_success)

        # append twice for the simulation side
        x_noise_arr.append(x_noise + 0.002)
        y_noise_arr.append(y_noise)
        env_arr.append('sim')
        outcome_arr.append(sim_success)

        # Observation processing

        real_obs = comparison_dict['obs'][0]
        sim_obs = comparison_dict['obs'][1]

        reduced_sim_obs = sim_obs[:, reduced_state_space_idx]

        print('observation size: ', real_obs.shape)

        assert real_obs.shape[-1] == reduced_sim_obs.shape[
            -1], 'make sure your real observation and sim observation match in shapes: ' + str(
            real_obs.shape[-1]) + ' and ' + str(reduced_sim_obs.shape[-1])

        fig, axs = plt.subplots(real_obs.shape[-1], figsize=(8, 5 * real_obs.shape[-1]))
        fig.suptitle('Sim to Real comparison')

        # draw the comparison for each observation variable in one big loop
        for obs_var_idx in range(real_obs.shape[-1]):
            print('figure: ', 'Obs variable with index: ' + str(obs_var_idx))
            axs[obs_var_idx].set_title('Obs variable with index: ' + str(obs_var_idx))
            axs[obs_var_idx].plot(np.arange(real_obs.shape[0]), real_obs[:, obs_var_idx], label='real', marker='o')
            axs[obs_var_idx].plot(np.arange(45), reduced_sim_obs[:45, obs_var_idx], marker='x',
                                  label='sim')  # we truncate at 30, the max timesteps for the grasping stage in simulation. this is HARDCODED
            axs[obs_var_idx].legend()

        obs_compare_filename = 'obs_compare_' + str(episode_idx).zfill(3) + '_x_' + "{:05d}".format(
            int(x_noise * 1000)) + '_y_' + "{:05d}".format(
            int(y_noise * 1000)) + '.png'

        fig.savefig(os.path.join(results_obs_dir, obs_compare_filename))

        # plt.show(fig)
        # fig.show()

        fig.clear()

        # HARDCODED SECTION: ASSUMES CERTAIN OBSERVATION INDICES IN PLACE

        # object trajectory
        # x path: obs[12]
        # y path: obs[13]
        x_path_real = real_obs[:, 12]
        y_path_real = real_obs[:, 13]

        x_path_sim = sim_obs[:, 12]
        y_path_sim = sim_obs[:, 13]

        plt.figure(figsize=(8, 5))

        print(np.diff(x_path_sim))

        plt.quiver(x_path_real[:-1], y_path_real[:-1], np.diff(x_path_real), np.diff(y_path_real), angles='xy',
                   scale_units='xy', scale=1,
                   label='real', color='C1')  # C1: matplotlib orange
        plt.quiver(x_path_sim[:-1], y_path_sim[:-1], np.diff(x_path_sim), np.diff(y_path_sim), angles='xy',
                   scale_units='xy', scale=1, label='sim', color='C0')  # C0: matplotlib blue
        plt.legend()
        plt.title('object path traveled wrt original palm position (m)')
        plt.xlabel('x / horizontal distance from palm (m)')
        plt.ylabel('y / parallel distance from palm (m)')
        plt.xlim(-0.1, 0.1)
        plt.ylim(0, 0.1)
        plt.savefig(os.path.join(results_obs_dir, 'object_path_' + str(episode_idx).zfill(3) + '_x_' + "{:05d}".format(
            int(x_noise * 1000)) + '_y_' + "{:05d}".format(
            int(y_noise * 1000)) + '.png'))
        plt.clf()

    reward_df = pd.DataFrame({
        'x_noise': x_noise_arr,
        'y_noise': y_noise_arr,
        'outcome': outcome_arr,
        'env': env_arr
    })

    """
    Reward visualizations
    """

    # draw visualization: x and y noise to success rate
    # sns.set(rc={'figure.figsize': (11.75, 8.25)})
    fig, axs = plt.subplots(figsize=(8, 5))
    xy_noise_success_plot = sns.scatterplot(data=reward_df, x='x_noise', y='y_noise', hue='outcome', style='env',
                                            markers={'real': 'o', 'sim': '^'})
    xy_noise_success_plot.set(title='Grasp Success over X and Y noise from ideal object position', xlabel='X Noise (m)',
                              ylabel='Y Noise (m)')

    xy_noise_success_plot.get_figure().savefig(os.path.join(results_dir, 'xy_noise_success' + '.png'))
    xy_noise_success_plot.get_figure().clf()
    # xy_noise_success_plot.show()

    # # draw visualization: translation error and quaternion distance to success rate
    # trans_err_quat_dist_success_plot = sns.scatterplot(data=reward_df, x='trans_err', y='quat_dist', hue='outcome')
    # trans_err_quat_dist_success_plot.set(
    #     # title='Grasp Success over Translation Error (object position to ideal position) and Quaternion Distance (from ideal hand grasp)',
    #     xlabel='Translation Error (m)', ylabel='Quaternion Distance (rad)')
    # trans_err_quat_dist_success_plot.get_figure().clf()

    """
    Observation comparisons
    """

    if args.compare_gifs:
        print('comparing gifs...')
        print(os.path.join(real_results_dir, 'video*.gif'))
        real_gif_filepaths = sorted(glob.glob(os.path.join(real_results_dir, 'video*.gif')))
        real_debug_gif_filepaths = sorted(glob.glob(os.path.join(real_results_dir, 'debug_video*.gif')))

        sim_gif_filepaths = sorted(glob.glob(os.path.join(sim_results_dir, 'video*.gif')))
        sim_debug_gif_filepaths = sorted(glob.glob(os.path.join(sim_results_dir, 'debug_video*.gif')))

        for episode_idx in range(min(len(real_gif_filepaths), len(sim_gif_filepaths))):
            print('on episode: ', episode_idx)
            comparison_dict = sim_real_compare.get_episode_data(episode_idx)
            noise_arr = comparison_dict['noise'][0]

            x_noise = noise_arr[0]
            y_noise = noise_arr[1]

            real_gif_filepath = real_gif_filepaths[episode_idx]
            real_debug_gif_filepath = real_debug_gif_filepaths[episode_idx]

            sim_gif_filepath = sim_gif_filepaths[episode_idx]
            sim_debug_gif_filepath = sim_debug_gif_filepaths[episode_idx]

            real_gif = imageio.get_reader(real_gif_filepath)
            real_debug_gif = imageio.get_reader(real_debug_gif_filepath)

            sim_gif = imageio.get_reader(sim_gif_filepath)
            sim_debug_gif = imageio.get_reader(sim_debug_gif_filepath)

            # get shorter gif for num of frames
            number_of_frames = min(real_gif.get_length(), sim_gif.get_length())

            # Create writer object
            compare_video_filename = 'compare_video_' + str(episode_idx).zfill(3) + '_x_' + "{:05d}".format(
                int(x_noise * 1000)) + '_y_' + "{:05d}".format(int(y_noise * 1000)) + '.gif'
            compare_debug_video_filename = 'compare_debug_video_' + str(episode_idx).zfill(3) + '_x_' + "{:05d}".format(
                int(x_noise * 1000)) + '_y_' + "{:05d}".format(int(y_noise * 1000)) + '.gif'
            video_save_path = os.path.join(compare_video_dir, compare_video_filename)
            debug_video_save_path = os.path.join(compare_video_dir, compare_debug_video_filename)

            # delete existing gifs (because we append to a gif later):
            if os.path.exists(video_save_path):
                os.remove(video_save_path)
            if os.path.exists(debug_video_save_path):
                os.remove(debug_video_save_path)

            # create gif objects
            print('writing to ', video_save_path)
            new_gif = imageio.get_writer(video_save_path, fps=30)
            new_debug_gif = imageio.get_writer(debug_video_save_path, fps=30)

            for frame_number in range(number_of_frames):
                print('frame number: ', frame_number)
                # get next frame
                real_img = real_gif.get_next_data()
                sim_img = sim_gif.get_next_data()

                real_debug_img = real_debug_gif.get_next_data()
                sim_debug_img = sim_debug_gif.get_next_data()

                # need to make sure all the images are the same shape!
                crop_real = cropND(real_img, (550, 550, 4))
                crop_sim = cropND(sim_img, (550, 550, 4))

                crop_debug_real = cropND(real_debug_img, (550, 550, 4))
                crop_debug_sim = cropND(sim_debug_img, (550, 550, 4))

                # here is the stacking magic
                new_image = np.hstack((crop_real, crop_sim))
                new_gif.append_data(new_image)

                new_debug_image = np.hstack((crop_debug_real, crop_debug_sim))
                new_debug_gif.append_data(new_debug_image)

            # stop writing to the files

            real_gif.close()
            sim_gif.close()
            real_debug_gif.close()
            sim_debug_gif.close()

            new_gif.close()
            new_debug_gif.close()
