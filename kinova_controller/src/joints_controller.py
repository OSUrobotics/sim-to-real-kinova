#! /usr/bin/env python2
"""A helper program to test cartesian goals for the JACO and MICO arms."""

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
# Refrence: Kinova_demo joints_action_client.py
###############

import roslib; roslib.load_manifest('kinova_demo')
import rospy
import actionlib
import kinova_msgs.msg
from sensor_msgs.msg import JointState


""" Global variable """
arm_joint_number = 0
finger_number = 0
prefix = 'NO_ROBOT_TYPE_DEFINED_'
finger_maxDist = 18.9/2/1000  # max distance for one finger
finger_maxTurn = 6800  # max thread rotation for one finger


def joint_angle_client(msg):
    """Send a joint angle goal to the action server."""
    action_address = '/' + prefix + 'driver/joints_action/joint_angles'
    client = actionlib.SimpleActionClient(action_address,
                                          kinova_msgs.msg.ArmJointAnglesAction)
    client.wait_for_server()

    goal = kinova_msgs.msg.ArmJointAnglesGoal()
    angle_set = list(msg.position)
    goal.angles.joint1 = angle_set[0]
    goal.angles.joint2 = angle_set[1]
    goal.angles.joint3 = angle_set[2]
    goal.angles.joint4 = angle_set[3]
    goal.angles.joint5 = angle_set[4]
    goal.angles.joint6 = angle_set[5]
    goal.angles.joint7 = angle_set[6]

    client.send_goal(goal)
    if client.wait_for_result(rospy.Duration(10.0)):
        rospy.set_param('exec_done', "true")
        return client.get_result()
    else:
        print('        the joint angle action timed-out')
        client.cancel_all_goals()
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
    rospy.init_node(prefix + 'arm_movement')
    rospy.Subscriber('/sim2real/joint_angle_command', JointState, joint_angle_client, queue_size=1)
    try:
        rospy.spin()
    except rospy.ROSInterruptException:
        print('program interrupted before completion')

