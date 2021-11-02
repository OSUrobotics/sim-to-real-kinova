#! /usr/bin/env python
"""A helper program to test gripper goals for the JACO and MICO arms."""

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
# Refrence: Kinova_demo fingers_action_client.py
###############

import roslib; roslib.load_manifest('kinova_demo')
import rospy

import actionlib
import kinova_msgs.msg
from kinova_msgs.msg import FingerPosition

""" Global variable """
arm_joint_number = 0
finger_number = 0
prefix = 'NO_ROBOT_TYPE_DEFINED_'
finger_maxDist = 18.9/2/1000  # max distance for one finger
finger_maxTurn = 6800  # max thread rotation for one finger
currentFingerPosition = [0.0, 0.0, 0.0]


def gripper_client(msg):
    """Send a gripper goal to the action server."""
    action_address = '/' + prefix + 'driver/fingers_action/finger_positions'

    client = actionlib.SimpleActionClient(action_address,
                                          kinova_msgs.msg.SetFingersPositionAction)
    client.wait_for_server()
    finger_positions = [msg.finger1, msg.finger2, msg.finger3]
    # print('DAMN IT HERE ARE THE POSITIONS')
    # print(finger_positions)
    # print(action_address)
    print("Calling on fingers_controller.py - Going to position:", finger_positions)

    goal = kinova_msgs.msg.SetFingersPositionGoal()
    goal.fingers.finger1 = float(finger_positions[0])
    goal.fingers.finger2 = float(finger_positions[1])
    goal.fingers.finger3 = float(finger_positions[2])
    client.send_goal(goal)
    if client.wait_for_result(rospy.Duration(3.0)):
        rospy.set_param('exec_done', "true")
        return client.get_result()
    else:
        client.cancel_all_goals()
        rospy.logwarn('        the gripper action timed-out')
        rospy.set_param('exec_done', "false")
        return None


def kinova_robotTypeParser(kinova_robotType_):
    """ Argument kinova_robotType """
    global robot_category, robot_category_version, wrist_type, arm_joint_number, robot_mode, finger_number, prefix, finger_maxDist, finger_maxTurn 
    robot_category = kinova_robotType_[0]
    robot_category_version = int(kinova_robotType_[1])
    wrist_type = kinova_robotType_[2]
    arm_joint_number = int(kinova_robotType_[3])
    robot_mode = kinova_robotType_[4]
    finger_number = int(kinova_robotType_[5])
    prefix = kinova_robotType_ + "_"
    finger_maxDist = 18.9/2/1000  # max distance for one finger in meter
    finger_maxTurn = 6800  # max thread turn for one finger


if __name__ == '__main__':
    kinova_robotType = rospy.get_param('kinova_robotType')
    kinova_robotTypeParser(kinova_robotType)
    rospy.init_node(prefix + 'finger_movement')
    rospy.Subscriber('/sim2real/finger_command', FingerPosition, gripper_client, queue_size=1)
    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        print('program interrupted before completion')
