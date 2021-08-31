"""
Script to visualize: success over x and y noise, success over

Also outputs a results.csv with x,y,z noise, success, translation error from ideal grasp, quaternion rotation distance

Adam Lee - jimzersml@gmail.com
"""

import os
import argparse
import glob
from pathlib import Path

import numpy as np
import pandas as pd
import seaborn as sns


"""
Example usage:

python visualize_irl.py --log_dir sim_rl_v2_cone && python visualize_irl.py --log_dir sim_rl_v2_vase && python visualize_irl.py --log_dir sim_rl_v2
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--log_dir", type=str, required=True)  # log directory
    parser.add_argument("--results_dir", type=str, default='results')  # results directory

    args = parser.parse_args()

    # hardcoded params. TODO: change the values of these bad boys with argparse.
    base_location = np.array([0, 0, 0])
    ideal_grasp_quat = np.array([np.pi / 2, 0, 0, np.pi / 2])

    # make results directory first...
    log_dir = args.log_dir
    assert Path(log_dir).exists(), 'Check that the log directory ' + log_dir + ' exists.'

    episode_dir = os.path.join(log_dir, 'episodes/')

    results_dir = os.path.join(log_dir, args.results_dir)
    results_path = Path(results_dir)
    results_path.mkdir(parents=True, exist_ok=True)

    # get filepaths from episodes directory.
    reward_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'reward*.npy')))
    obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'obs*.npy')))
    next_obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'next_obs*.npy')))
    action_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'action*.npy')))

    trans_err_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'translation_err*.npy')))
    quat_dist_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'quat_dist*.npy')))

    start_pose_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'start_pose*.npy')))
    noise_arr_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'noise_arr*.npy')))

    success_arr = np.array([np.load(filepath)[-1] for filepath in reward_filepaths])
    noise_arr = np.array([np.load(filepath) for filepath in noise_arr_filepaths])


    x_noise_arr = noise_arr[:, 0]
    y_noise_arr = noise_arr[:, 1]
    z_noise_arr = noise_arr[:, 2]

    start_pose_arr = np.array([np.load(filepath) for filepath in start_pose_filepaths])
    hand_orientation_quat_arr = start_pose_arr[:, -4:]  # last 4 elems are x,y,z,w quaternion...

    # # todo: both of these need to be changed after bug fix. remove [-1]
    # trans_err_arr = np.array([np.load(filepath) for filepath in trans_err_filepaths])
    # quat_dist_arr = np.array([np.load(filepath) for filepath in quat_dist_filepaths])

    df = pd.DataFrame(
        {'x_noise': x_noise_arr, 'y_noise': y_noise_arr, 'z_noise': z_noise_arr, 'Success': success_arr == True})

    # calculation stuff: do this after defining dataframe

    # step 1: get translation_err. flips to neg value if x is negative
    df['trans_err'] = df[['x_noise', 'y_noise', 'z_noise']].apply(
        lambda x: np.sign(x[0]) * np.sqrt(np.sum((x.to_numpy() - base_location) ** 2)), axis=1)

    # step 2: get quat distance
    quaternion_dot_prod = np.dot(hand_orientation_quat_arr, ideal_grasp_quat)
    angle_difference = np.arccos(quaternion_dot_prod)  # in degrees
    quat_distance = np.rad2deg(angle_difference)  # in radians
    quat_distance = np.nan_to_num(quat_distance, nan=0, posinf=0,
                                  neginf=0)  # for now just set values of positive infinity and negative infinity to also round to 0
    df['quat_dist'] = quat_distance

    # draw visualization: x and y noise to success rate
    xy_noise_success_plot = sns.scatterplot(data=df, x='x_noise', y='y_noise', hue='Success')
    xy_noise_success_plot.set(title='Grasp Success over X and Y noise from ideal object position', xlabel='X Noise (m)',
                              ylabel='Y Noise (m)')

    xy_noise_success_plot.get_figure().savefig(os.path.join(results_dir, 'xy_noise_success' + '.png'))
    xy_noise_success_plot.get_figure().clf()

    # draw visualization: translation error and quaternion distance to success rate
    trans_err_quat_dist_success_plot = sns.scatterplot(data=df, x='trans_err', y='quat_dist', hue='Success')
    trans_err_quat_dist_success_plot.set(
        title='Grasp Success over Translation Error (object position to ideal position) and Quaternion Distance (from ideal hand grasp)',
        xlabel='Translation Error (m)', ylabel='Quaternion Distance (rad)')

    trans_err_quat_dist_success_plot.get_figure().savefig(os.path.join(results_dir, 'trans_err_quat_dist_success' + '.png'))
    trans_err_quat_dist_success_plot.get_figure().clf()

    # save data to a csv
    df.to_csv(os.path.join(results_dir, 'results' + '.csv'))

    print('Finished creating visualizations.')
