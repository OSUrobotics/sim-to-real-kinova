#!/usr/bin/env python3

# above: look at the shebang. it's in python 3.

"""
Author: Adam Lee (or... run git blame to find the latest edits)


"""

# standard packages
import time
import os

# ros and kinova stuff
import rospy
from std_msgs.msg import Bool

# data science packages
import numpy as np

# the actual openai gym
from kinova_gripper_env import KinovaGripper_Env

from video import VideoRecorder
from logger import Logger

finish_velocity_controller_pub = rospy.Publisher('/finish_velocity_controller', Bool, queue_size=1)


def lerp(action_arr, old_min=0, old_max=3, new_min=0, new_max=6800):
    # first: scale to proper min max
    np_arr = np.array(action_arr)
    scale_factor = (new_max - new_min) / (old_max - old_min)
    scaled_arr = (np_arr - old_min) * scale_factor + new_min
    return scaled_arr

if __name__ == '__main__':
    rospy.init_node('openai_gym_kinova')

    try:
        # TODO: instead of sleeping, listen to a "ready" channel or service.
        rospy.sleep(5.0)

        # TODO Note: if some shit breaks, add stuff here
        print('Starting file: state buffer test.py')

        # load OpenAI Gym env
        env = KinovaGripper_Env()

        # this parameter keeps the kinova_gripper_env running in ROS wrapper code
        rospy.set_param('exec_done', 'false')


        # TRY SOME SHIT OUT HERE
        # TODO: REMOVE THIS TESTBED

        input('Press enter to continue...')

        # try to get the env observations
        obs = env.get_obs()
        print('TEST OUTPUT!')
        print(obs)
        print('END TEST OUTPUT!')




        # first, open the thing up to open hand
        env.step_pos(np.array([0, 0, 0]))
        rospy.sleep(5)

        # desired velocities - recreate finger movement
        finger1_vel = 0.25
        finger2_vel = 0.25
        finger3_vel = 0.25

        desired_vel = np.array([finger1_vel, finger2_vel, finger3_vel])
        # need to scale to between 0-6800 for kinova gripper
        scaled_vel = lerp(desired_vel)

        print('scaled vel:', scaled_vel)

        rate = rospy.Rate(1)

        counter = 0
        # while not rospy.is_shutdown():  # or turn this into for loop

        logger = Logger('/home/mechagodzilla/sim-to-real-kinova/adams_log_directory/', use_video=True)
        logger.record_current_episode(True)  # set recording on
        for i in range(10):
            # scaled_vel = np.array(list([np.random.choice([0, 1700, 3400])]) * 3)
            scaled_vel = np.array(list([np.random.choice([0])]) * 3)

            next_obs, reward, done, info = env.step(scaled_vel)
            # rospy.sleep(0.5)
            # if done:
            #     rospy.loginfo('=== stopping the closing of fingers...')

            print('counter: ', counter)
            print(obs)

            # img = info['curr_image']  # should be (1080, 1920, 3)
            # print(img.shape)
            logger.log_single_step(scaled_vel, obs, next_obs, reward, done, info)

            rate.sleep()

            obs = next_obs
            counter += 1

        # TODO: TESTING LOGGER
        logger.finish_recording()

        print('BUEHRHRH')
        # MAKE SURE WE CAN'T LOG UNTIL WE TURN RECORD_CURR_EPISODE ON AGAIN

        # for trial_idx in range(10):
        #
        #     env.step_pos(np.array([0, 0, 0]))
        #     rospy.sleep(5)
        #     finish_velocity_controller_pub.publish(False)
        #
        #     input('Press enter to continue...')
        #
        #
        #     rospy.loginfo('=================starting grabbing stage')
        #
        #     done = False
        #
        #     while not done:  # or turn this into for loop
        #
        #         # scaled_vel = np.array(list([np.random.choice([0, 1700, 3400])]) * 3)
        #         scaled_vel = np.array(list([np.random.choice([0])]) * 3)
        #
        #         obs, reward, done, info = env.step(scaled_vel)
        #         rospy.sleep(0.25)
        #         if done:
        #             rospy.loginfo('=== stopping the closing of fingers...')
        #
        #         print(obs)
        #
        #     # once set as done, check reward
        #     # reward = env.check_reward()
        #
        #     # while not rospy.get_param('finish_reward_check'):
        #     #     rospy.loginfo('waiting for reward...')
        #     #     rospy.sleep(1)
        #
        #     print("trial:", trial_idx, "reward:", reward)
        #
        #     rospy.sleep(2)



        print('End of testbed.')

        # rospy.spin()


    except rospy.ROSInterruptException:
        print('ERROR: Program interrupted before completion')


    print('adam_gym_test.py finished.')