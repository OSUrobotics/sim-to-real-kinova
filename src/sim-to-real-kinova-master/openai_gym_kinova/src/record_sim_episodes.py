

import os
import yaml

# our packages
from logger import Logger
from agents import RandomAgent, ContinuousRandomAgent, ConstantAgent, RLAgent
from utils import Noiser

# the actual openai gym
import gym

rel_dirname = os.path.dirname(__file__)
print('relative path:', rel_dirname)

"""
Loading parameters from YAML file
"""

# TODO: actually change this config path
config_path = 'experiment_configs/'
filename = 'record_sims.yaml'
config_filepath = os.path.join(rel_dirname, config_path, filename)

stream = open(config_filepath, 'r')

config_dict = yaml.load(stream, Loader=yaml.FullLoader)

experiment_name = config_dict['experiment_name']
experiment_params = config_dict['params']

controller_params = experiment_params['controller']
logger_params = experiment_params['logger']
noise_params = experiment_params['noise']
max_timesteps = experiment_params['max_timesteps']

controller_type = controller_params['type']
if controller_type == 'constant':
    agent = ConstantAgent(speed=controller_params['speed'])
elif controller_type == 'discrete_random':
    agent = RandomAgent(options=controller_params)
elif controller_type == 'rl':
    agent = RLAgent(trained_policy_path=controller_params['policy_filepath'])
else:
    # NOOOOOOOOOOOOOO
    raise Exception('lol')
    # rospy.error('YOU DIDNT GIVE A VALID CONTROLLER TYPE (TURN THIS INTO AN ASSERTION)')

logger = None
if logger_params['use_logger']:
    log_dir = os.path.join(rel_dirname, logger_params['log_dir'])
    logger = Logger(log_dir=log_dir, use_video=logger_params['use_video'])

noiser = Noiser(noise_params['x_noise'], noise_params['y_noise'], noise_params['z_noise'],
                noise_params['roll_noise'], noise_params['pitch_noise'], noise_params['yaw_noise'],
                noise_range=noise_params['noise_range'], noise_distribution=noise_params['noise_distribution'])

input('Press enter to start trials...')



for noise_permutation_idx, noise_arr in enumerate(noiser.noise_permutation_arr):
    print('permutation', noise_permutation_idx, ' of noise arr:', noise_arr)

    # step 1: factor in the noise
    x_pos, y_pos, z_pos, roll, pitch, yaw = 0, 0, 0, 0, 0, 0

    x_noise, y_noise, z_noise, roll_noise, pitch_noise, yaw_noise = noise_arr

    x_pos += x_noise
    y_pos += y_noise
    z_pos += z_noise
    roll += roll_noise
    pitch += pitch_noise
    yaw += yaw_noise

    # now reset the environemtn
    start_hand_rotation = [-1.57 + roll_noise, 0 + pitch_noise, -1.57 + yaw_noise]

    sim_env = gym.make('gym_kinova_gripper:kinovagripper-v0')

    obs = sim_env.reset(shape_keys=['CylinderM'], hand_orientation='normal',
                start_pos=[0.0, 0.0, 0.0], hand_rotation=start_hand_rotation)  # TODO: make sure this is NO OBJECT
    sim_env.render()

    # reset the logger as well, set everything up here


    timestep_idx = 0
    done = False
    # for max amount of time steps, step through
    while not done:
        print('timestep:', timestep_idx)
        action = agent.act(obs)
        print('THE ACTION IS:', action)
        next_obs, reward, done, info = sim_env.step(action)

        if done:
            break

        # grab the image from subscriber
        # call the logger here

        logger.log_single_step(action, obs, next_obs, reward, done, info)

        rate.sleep()

        obs = next_obs