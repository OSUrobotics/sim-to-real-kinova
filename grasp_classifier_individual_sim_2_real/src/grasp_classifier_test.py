#!/usr/bin/env python

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import rospy
from kinova_msgs.msg import FingerPosition
from kinova_gripper_env import KinovaGripper_Env


if __name__ == '__main__':

    rospy.init_node('grasp_classifier_test')
    try:
        rospy.sleep(2.0)
        print("Starting Testing of Grasp Classifier")
        
        env = KinovaGripper_Env()
        rospy.set_param('exec_done', "false")
        finger_close_percent = rospy.get_param('close_percent')
        
        finger_pos = FingerPosition()
        finger_pos.finger1 = 0
        finger_pos.finger2 = 0
        finger_pos.finger3 = 0
        count = 0
        while not rospy.is_shutdown():
            
            if finger_pos.finger1 < (64*finger_close_percent)-10:
                finger_pos.finger1 = finger_pos.finger1 + 10
                finger_pos.finger2 = finger_pos.finger2 + 10
                finger_pos.finger3 = finger_pos.finger3 + 10               
                _, reward, _, _ = env.step(finger_pos)                
            elif count == 0:
                count = 1
                env.go_to_goal()
            else:
                print("Goal Reached Terminate execution")        

    except rospy.ROSInterruptException:
        print('program interrupted before completion')

