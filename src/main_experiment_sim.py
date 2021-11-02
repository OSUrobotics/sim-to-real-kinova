#!/usr/bin/env python3

# above: look at the shebang. it's in python 3.

"""
Author: Adam Lee (or... run git blame to find the latest edits)


"""

# standard packages
import argparse
from pathlib import Path
import time
import os
import yaml

# data science packages
import numpy as np

# our packages
from logger import Logger
from agents import RandomAgent, ContinuousRandomAgent, ConstantAgent, RLAgent
from utils import Noiser, state_dim_setup
from buffer import ReplayBuffer_Queue

# the actual openai gym
import gym

# os.environ.get("LD_LIBRARY_PATH", "")

"""
Example usage:
python main_experiment_sim.py --config_name sim_rl_v2_cone.yaml && python main_experiment_sim.py --config_name sim_rl_v2_vase.yaml && python main_experiment_sim.py --config_name sim_rl_v2_cylinder.yaml
"""

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--config_name", type=str, required=True)  # real directory
    parser.add_argument("--config_folder", type=str, default='experiment_configs/')

    args = parser.parse_args()

    # print(os.environ['MUJOCO_GL'])
    rel_dirname = os.path.dirname(__file__)
    print('relative path:', rel_dirname)

    """
    Loading parameters from YAML file
    """
    config_path = 'experiment_configs/'
    config_path = args.config_folder
    assert Path(config_path).exists(), 'Check that the config folder ' + config_path + ' exists.'

    filename = 'sim_combined_test_v6.yaml'
    filename = 'sim_playground_test.yaml'
    filename = 'sim_rl_v2.yaml'
    filename = args.config_name
    config_filepath = os.path.join(rel_dirname, config_path, filename)

    stream = open(config_filepath, 'r')

    config_dict = yaml.load(stream, Loader=yaml.FullLoader)

    experiment_name = config_dict['experiment_name']
    experiment_params = config_dict['params']

    controller_params = experiment_params['controller']
    logger_params = experiment_params['logger']
    noise_params = experiment_params['noise']
    max_timesteps = experiment_params['max_timesteps']
    shape = experiment_params['shape']

    assert shape in ['CubeM', 'CylinderM', 'Vase1M', 'Cone1M'], 'make sure you are using a shape name that actually exists...'

    controller_type = controller_params['type']
    live_training = False

    if controller_type == 'constant':
        agent = ConstantAgent(speed=controller_params['speed'])
    elif controller_type == 'discrete_random':
        agent = RandomAgent(options=controller_params)
    elif controller_type == 'rl':
        live_training = controller_params['live_training']
        assert type(live_training) == bool, 'make sure your live_training parameter is a boolean (true or false)'

        if live_training:
            # TODO: init replay buffer if live training
            # TODO: configify len(state_idx_arr) by adding state_dim_setup param. hardcode for now
            live_replay_buffer = ReplayBuffer_Queue(state_dim=26, action_dim=3, max_episode=100, n_steps=5)
            state_idx_arr = state_dim_setup(controller_params['state_dim_setup'])

        agent = RLAgent(trained_policy_path=os.path.join(rel_dirname, controller_params['policy_filepath']),
                        real_world=False)
    else:
        # NOOOOOOOOOOOOOO
        raise AssertionError('YOU DIDNT GIVE A VALID CONTROLLER TYPE (TURN THIS INTO AN ASSERTION)')

    logger = None
    if logger_params['use_logger']:
        log_dir = os.path.join(rel_dirname, experiment_name)
        logger = Logger(log_dir=log_dir, use_video=logger_params['use_video'],
                        start_episode_num=noise_params['start_index'] + 1)

    noiser = Noiser(noise_params['x_noise'], noise_params['y_noise'], noise_params['z_noise'],
                    noise_params['roll_noise'], noise_params['pitch_noise'], noise_params['yaw_noise'],
                    noise_range=noise_params['noise_range'], noise_distribution=noise_params['noise_distribution'],
                    start_index=noise_params['start_index'], fixed_list=noise_params['fixed_list'])

    print('There are ' + str(len(noiser.noise_permutation_arr)) + ' trials to be conducted')
    print('Starting at trial: ' + str(noise_params['start_index']))
    input('Press enter to start trials...')

    for trial_idx in range(noise_params['start_index'], len(noiser.noise_permutation_arr)):

        print('Trial ' + str(trial_idx) + ' | ' + 'Press enter to move to noisy position...')

        # _ = env.reset(x_noise=0.03, y_noise=-0.02, z_noise=0, roll_noise=0, pitch_noise=0,
        #               yaw_noise=-np.pi / 12)  # NOTE: THE OBSERVATION FROM HERE DOESN'T CONTAIN THE OBJECT LOL

        x_noise, y_noise, z_noise, roll_noise, pitch_noise, yaw_noise = [0.0] * 6

        if noiser.noise_range in ['fixed', 'fixed_list']:
            noise_arr, noise_counter, reset_counter = noiser.sample_noise()
            x_noise, y_noise, z_noise, roll_noise, pitch_noise, yaw_noise = noise_arr

            # flip y noise
            y_noise *= -1

            # flip x noise
            x_noise *= -1

        print('Noise parameters:\n', 'x_noise:', str(x_noise), '| y_noise:', str(y_noise), '| z_noise:',
              str(z_noise), '| roll_noise:', str(roll_noise), '| pitch_noise:', str(pitch_noise), '| yaw_noise:',
              str(yaw_noise))

        done = False

        print('=================starting grabbing stage')

        logger.record_current_episode(True)  # set recording on

        start = time.perf_counter()


        env = gym.make('gym_kinova_gripper:kinovagripper-v0')

        start_hand_rotation = [-1.57 + roll_noise, 0 + pitch_noise, -1.57 + yaw_noise]

        obs = env.reset(shape_keys=[shape], hand_orientation='normal',
                        start_pos=[x_noise, y_noise, z_noise],
                        hand_rotation=start_hand_rotation)  # TODO: make sure this is NO OBJECT

        # DANGER: i notice that the normal hand position for the kinovaa grasper is 0.7071, 0, 0, 0.7071 => pi/4, 0, 0, pi/4
        # but something something idc about curr pose acutally being euler angle of -np.pi/2, 0, -np.pi/2
        info = {
            'curr_pose': np.array([0, 0, 0, 0.7071, 0, 0, 0.7071]),
            'start_pose': np.array([0, 0, 0, 0.7071, 0, 0, 0.7071])
        }

        info['curr_image'] = env.just_render_img()

        noise_info = {
            'x_noise': -x_noise,  # flip x noise back
            'y_noise': -y_noise,  # flip y noise back
            'z_noise': z_noise,
            'roll_noise': roll_noise,
            'pitch_noise': pitch_noise,
            'yaw_noise': yaw_noise
        }

        logger.record_starting_position(obs, info, noise_info=noise_info, simulator=True)

        if live_training:  # for the live training of RL algorithm
            replay_buffer_recorded_ts = 0  # Number of RL time steps recorded by the replay buffer
            live_replay_buffer.add_episode(1)  # Start recording the episode within the replay buffer

        for timestep_idx in range(max_timesteps):  # or turn this into for loop
            # print('timestep:', timestep_idx)
            # print('observation size: ', obs.shape)
            action = agent.act(obs)
            print('THE ACTION IS:', action)
            # action = np.array([3400, 0, 0])
            next_obs, reward, done, info = env.step(np.concatenate(([0], action)))

            # grab the image from subscriber
            info['curr_image'] = env.just_render_img()
            # call the logger here

            logger.log_single_step(action, np.array(obs), np.array(next_obs), reward, done, info)

            if done or timestep_idx == max_timesteps - 1:
                print('=== stopping the closing of fingers...')
                break

            if live_training:
                # Record the transition within the replay buffer
                live_replay_buffer.add(obs, action, next_obs, reward, float(done))
                replay_buffer_recorded_ts += 1

            obs = next_obs

        # once set as done, check reward

        done = False
        # Lifting stage
        wrist_lift_velocity = 0.6
        min_velocity = 0.5  # Minimum velocity value for fingers or wrist
        finger_lift_velocity = min_velocity
        episode_reward = 0  # Cumulative reward over a single episode
        lift_timestep = 0

        while lift_timestep < 15 and not done:
            # Lift the hand with the pre-determined lifting velocities
            action = np.array(
                [wrist_lift_velocity, finger_lift_velocity, finger_lift_velocity, finger_lift_velocity])
            next_obs, reward, done, info = env.step(action)

            info['curr_image'] = env.just_render_img()

            # Done in the lifting stage is determined by whether we reach the target lifting height of the object
            if done:
                if live_training:
                    # Replace the final recorded reward within the replay buffer
                    old_reward = live_replay_buffer.replace(reward, done)

                # Replace the final reward value with the lift reward
                episode_reward = episode_reward + reward

                # Determine success of the episode based on the final lift reward
                if reward == 50:
                    print('lets goooooo')
                    lift_success = 1
                else:
                    print('NOOOOO')
                    print(reward)
                # Cumulative reward per reward type
                # ep_finger_reward += info["finger_reward"]
                # ep_grasp_reward += info["grasp_reward"]
                # ep_lift_reward += info["lift_reward"]
                final_success = reward

                break

            logger.log_single_step(np.array([0, 0, 0]), np.array(obs), np.array(next_obs), reward, done, info)

            obs = next_obs
            lift_timestep += 1

        reward = 1 if final_success != 0 else 0

        if live_training:
            # Remove any invalid episodes (episodes shorter than n-step length for policy training)
            episode_len = replay_buffer_recorded_ts  # Number of timesteps within the episode recorded by replay buffer
            if episode_len == 0 or episode_len < live_replay_buffer.n_steps:
                live_replay_buffer.remove_episode(-1)  # If episode is invalid length (less that n-steps), remove it

            # okay now run a training loop
            agent.policy.train_batch(max_episode_num='doesnt really matter lol', episode_num=trial_idx, update_count=trial_idx, expert_replay_buffer=None, replay_buffer=live_replay_buffer, mod_state_idx=state_idx_arr)

        logger.log_single_step(action, np.array(obs), np.array(next_obs), reward, done, info)

        # while not rospy.get_param('finish_reward_check'):
        #     print('waiting for reward...')
        #     rospy.sleep(1)

        print("trial:", trial_idx, "reward:", reward)

        end = time.perf_counter()
        print('time this bruh:', end - start)

        # TODO: Add "is successful" param
        logger.finish_recording()  # log the episode and save video'

        env.close()

    print('End of testbed.')
