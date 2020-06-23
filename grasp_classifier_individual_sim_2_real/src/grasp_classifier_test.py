#!/usr/bin/env python

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import numpy as np

import rospy
from sensor_msgs.msg import JointState
from kinova_msgs.msg import FingerPosition, KinovaPose
from geometry_msgs.msg import PoseStamped
from kinova_gripper_env import KinovaGripper_Env


if __name__ == '__main__':

    rospy.init_node('grasp_classifier_test_node')
    try:
        env = KinovaGripper_Env()
        rospy.set_param('exec_done', "false")
        finger_close_percent = rospy.get_param('close_percent')
        finger_pos = FingerPosition()
        finger_pos.finger1 = 0
        finger_pos.finger2 = 0
        finger_pos.finger3 = 0
        while not rospy.is_shutdown():
            if finger_pos.finger1 < (64*finger_close_percent)-10:
                finger_pos.finger1 = finger_pos.finger1 + 10
                finger_pos.finger2 = finger_pos.finger2 + 10
                finger_pos.finger3 = finger_pos.finger3 + 10
                
                _, reward, _, _ = env.step(finger_pos)                
                
            else:
                print("Goal Reached Terminate execution")        
        
            
        
    except rospy.ROSInterruptException:
        print('program interrupted before completion')

