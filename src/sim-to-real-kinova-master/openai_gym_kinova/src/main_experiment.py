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

from logger import Logger

# the actual openai gym
from kinova_gripper_env import KinovaGripper_Env


def lerp(action_arr, old_min=0, old_max=3, new_min=0, new_max=6800):
    # first: scale to proper min max
    np_arr = np.array(action_arr)
    scale_factor = (new_max - new_min) / (old_max - old_min)
    scaled_arr = (np_arr - old_min) * scale_factor + new_min
    return scaled_arr


class Agent:
    """
    base action class
    """

    def __init__(self):
        return

    def act(self, obs):
        return


class RandomAgent(Agent):
    """
    shitty action class
    """

    def __init__(self, options: List):
        super(Agent, self).__init__()

        self.options = options

    def act(self, obs):
        """
        lmao pick some random shit
        """
        action = np.array(list([np.random.choice(self.options)]) * 3)
        return action


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

        # load agent
        agent = RandomAgent([0, 1700, 3400])

        # load logger
        logger = Logger('/home/mechagodzilla/sim-to-real-kinova/noise_testing_log_dir/', use_video=True)

        input('Press enter to start trials...')

        rate = rospy.Rate(1)

        for trial_idx in range(10):

            _ = env.reset()  # NOTE: THE OBSERVATION FROM HERE DOESN'T CONTAIN THE OBJECT LOL

            done = False

            input('Trial ' + str(trial_idx) + ' | ' + 'Press enter to add positional noise...')

            env.add_positional_noise(0.1, -0.1, 0)

            # TODO: add orientation noise

            input('Press enter to add orientation noise')

            env.add_orientational_noise(0, 0, np.pi/12)  # wrt to the base i believe

            input('Press enter to start grasp attempt')

            rospy.loginfo('=================starting grabbing stage')

            logger.record_current_episode(True)  # set recording on

            obs = env.get_obs()  # get the most recent observation

            while not done:  # or turn this into for loop
                action = agent.act(obs)
                next_obs, reward, done, info = env.step(action)

                if done:
                    rospy.loginfo('=== stopping the closing of fingers...')
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
