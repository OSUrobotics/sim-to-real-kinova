#!/usr/bin/env python3

# above: look at the shebang. it's in python 3.

"""
Author: Adam Lee (or... run git blame to find the latest edits)


"""

# standard packages
import time
import os
from typing import List

# ros and kinova stuff
import rospy
from kinova_msgs.msg import FingerPosition
from std_msgs.msg import String, Float32, Float32MultiArray, Int32, MultiArrayDimension
from std_msgs.msg import Bool

# data science packages
import numpy as np

# our packages
from logger import Logger
from agents import RandomAgent, ContinuousRandomAgent, ConstantAgent, RLAgent

# the actual openai gym
from kinova_gripper_env import KinovaGripper_Env

# the DDPGfD thingy
from DDPGfD import DDPGfD

if __name__ == '__main__':
    rospy.init_node('openai_gym_kinova')

    try:
        # TODO: instead of sleeping, listen to a "ready" channel or service.
        rospy.sleep(5.0)

        # TODO Note: if some shit breaks, add stuff here
        print('Starting file: main_experiment.py')

        # load OpenAI Gym env
        env = KinovaGripper_Env()

        # this parameter keeps the kinova_gripper_env running in ROS wrapper code
        rospy.set_param('exec_done', 'false')

        # this controller lets us manually set off the joint velocity controller
        finish_velocity_controller_pub = rospy.Publisher('/finish_velocity_controller', Bool, queue_size=1)

        # load agent
        trained_policy_path = 'policies/state_dim_full_train_v01/_07_22_21_0544/policy/train_DDPGfD_kinovaGrip'

        rel_dirname = os.path.dirname(__file__)
        print('relative path:', rel_dirname)

        # agent = RandomAgent([0, 1700, 3400])
        # agent = RLAgent(trained_policy_path=os.path.join(rel_dirname, trained_policy_path))
        agent = ConstantAgent(6800)

        # load logger
        # log_dir = '/home/mechagodzilla/sim-to-real-kinova/rl_agent_v1_logs/'
        log_dir = os.path.join(rel_dirname, 'constant_agent_logs/')
        logger = Logger(log_dir=log_dir, use_video=True)

        max_timesteps = 100

        input('Press enter to start trials...')

        rate = rospy.Rate(30)

        for trial_idx in range(10):

            _ = env.reset(x_noise=0.03, y_noise=-0.02, z_noise=0, roll_noise=0, pitch_noise=0,
                          yaw_noise=-np.pi / 12)  # NOTE: THE OBSERVATION FROM HERE DOESN'T CONTAIN THE OBJECT LOL

            done = False

            # input('Trial ' + str(trial_idx) + ' | ' + 'Press enter to add positional noise...')
            #
            # env.add_positional_noise(0.025, -0.025, 0)
            #
            # input('Press enter to add orientation noise')
            #
            # env.add_orientational_noise(0, 0, np.pi / 12)  # wrt to the base i believe

            input('Press enter to start grasp attempt')

            rospy.loginfo('=================starting grabbing stage')

            logger.record_current_episode(True)  # set recording on

            obs = env.get_obs()  # get the most recent observation
            info = env.get_info()

            logger.record_starting_position(obs, info)

            for timestep_idx in range(max_timesteps):  # or turn this into for loop
                print('timestep:', timestep_idx)
                action = agent.act(obs)
                print('THE ACTION IS:', action)
                next_obs, reward, done, info = env.step(action)

                if done or timestep_idx == max_timesteps - 1:
                    rospy.loginfo('=== stopping the closing of fingers...')
                    finish_velocity_controller_pub.publish(True)
                    break

                # grab the image from subscriber
                # call the logger here

                logger.log_single_step(action, obs, next_obs, reward, done, info)

                rate.sleep()

                obs = next_obs

            # once set as done, check reward
            reward = env.check_reward()

            logger.log_single_step(action, obs, next_obs, reward, done, info)

            # while not rospy.get_param('finish_reward_check'):
            #     rospy.loginfo('waiting for reward...')
            #     rospy.sleep(1)

            print("trial:", trial_idx, "reward:", reward)
            logger.finish_recording()  # log the episode and save video

        print('End of testbed.')

        rospy.spin()


    except rospy.ROSInterruptException:
        print('ERROR: Program interrupted before completion')

    print('adam_gym_test.py finished.')
