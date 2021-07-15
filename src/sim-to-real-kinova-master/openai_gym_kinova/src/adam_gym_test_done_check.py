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
from kinova_msgs.msg import FingerPosition
from std_msgs.msg import String, Float32, Float32MultiArray, Int32, MultiArrayDimension
from std_msgs.msg import Bool

# data science packages
import numpy as np

# the actual openai gym
from kinova_gripper_env import KinovaGripper_Env


class Controller:
    """
    I have no fucking clue what this does. Look at earlier versions of this in grasp_classifier_test.py
    """

    def __init__(self):
        self.test_done = False
        self.route_done = False
        self.errors = []

    def route(self, msg):
        self.route_done = msg.data

    def test(self, msg):
        # print('test_finished')
        self.test_done = msg.data

    def update(self, msg):
        self.errors = msg


if __name__ == '__main__':
    rospy.init_node('openai_gym_kinova')

    try:
        # TODO: instead of sleeping, listen to a "ready" channel or service.
        rospy.sleep(5.0)

        # TODO Note: if some shit breaks, add stuff here
        print('Starting file: adam_gym_test.py')

        # load OpenAI Gym env
        env = KinovaGripper_Env()

        # this parameter keeps the kinova_gripper_env running in ROS wrapper code
        rospy.set_param('exec_done', 'false')

        cont = Controller()  # init controller object.

        rospy.Subscriber('/route_finish', Bool, cont.route)
        done = rospy.Subscriber('/test_finish', Bool, cont.test)
        hand = rospy.Publisher('/hand_control', String, queue_size=1)
        collector = rospy.Publisher('/data_to_save', Float32MultiArray, queue_size=10)
        err_checker = rospy.Subscriber('/total_errors', Float32MultiArray, cont.update)

        # finger positions. this is poopy
        finger_pos = FingerPosition()
        finger_pos.finger1 = 0
        finger_pos.finger2 = 0
        finger_pos.finger3 = 0
        count = 0
        reset_mechanism = rospy.Publisher('reset_start', Int32, queue_size=1)


        # New stuff - related to velocity controller. NOTE: The queue size is only 1!
        finish_pub = rospy.Publisher('/finish_velocity_controller', Bool, queue_size=1)


        # TRY SOME SHIT OUT HERE
        # TODO: REMOVE THIS TESTBED

        input('Press enter to continue...')

        # try to get the env observations
        obs = env.get_obs()
        print('TEST OUTPUT!')
        print(obs)
        print('END TEST OUTPUT!')


        def lerp(action_arr, old_min=-1, old_max=1, new_min=-6800, new_max=6800):
            # first: scale to proper min max
            np_arr = np.array(action_arr)
            scale_factor = (new_max - new_min) / (old_max - old_min)
            scaled_arr = (np_arr - old_min) * scale_factor + new_min
            return scaled_arr

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

        done = False

        for i in range(100):
            obs, reward, done, info = env.step(scaled_vel)
            rospy.sleep(0.25)

            if done:
                break

        # first, open the thing up to open hand
        env.step_pos(np.array([0, 0, 0]))

        rospy.sleep(5)

        # """
        # OSCILLATE BETWEEN OPENING AND CLOSING FINGERS!!!
        # """
        #
        # # desired velocities - recreate finger movement
        # finger1_vel = 0.25
        # finger2_vel = 0.25
        # finger3_vel = 0.25
        #
        # desired_vel = np.array([finger1_vel, finger2_vel, finger3_vel])
        # # need to scale to between 0-6800 for kinova gripper
        # scaled_vel = lerp(desired_vel)
        #
        # print('scaled vel:', scaled_vel)
        #
        # for i in range(5): # ~8 seconds of commands
        #     obs, reward, done, info = env.step(scaled_vel)
        #     rospy.sleep(3)
        #     # note: change to ros timer???
        #
        #     # flip hehe
        #     scaled_vel = -scaled_vel
        #
        # print('End of testbed.')

        rospy.spin()


    except rospy.ROSInterruptExeception:
        print('ERROR: Program interrupted before completion')


    print('adam_gym_test.py finished.')