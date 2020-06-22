#! /usr/bin/env python

# Author: Nuha Nishat
# Date: 1/30/20

import rospy
import sys, os
import math
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
from sensor_msgs.msg import JointState
import tf, math
import tf.transformations
import pdb
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from math import pi 
from std_msgs.msg import String

from moveit_commander.conversions import pose_to_list
from moveit_msgs.msg import RobotState, PlanningScene, PlanningSceneComponents, AllowedCollisionEntry, AllowedCollisionMatrix
from moveit_msgs.srv import GetPlanningScene, ApplyPlanningScene
import time




# move_group_python_interface_tutorial was used as reference

class MoveRobot():
    def __init__(self):
        # Initialize moveit commander and ros node for moveit
        moveit_commander.roscpp_initialize(sys.argv)

        # Initializing node
        #rospy.init_node("move_kinova", anonymous=True)

        # Define robot using RobotCommander. Provided robot info such as
        # kinematic model and current joint state
        self.robot = moveit_commander.RobotCommander()

        # Setting the world 
        self.scene = moveit_commander.PlanningSceneInterface()

        # Define the planning group for the arm you are using
        # You can easily look it up on rviz under the MotionPlanning tab
        self.move_group = moveit_commander.MoveGroupCommander("arm")
        self.move_gripper = moveit_commander.MoveGroupCommander("gripper")
        
        # Set the precision of the robot
        rospy.set_param('/move_group/trajectory_execution/allowed_start_tolerance', 0.0)
        
        rospy.wait_for_service("/apply_planning_scene", 10.0)
        rospy.wait_for_service("/get_planning_scene", 10.0)

        self.apply_scene = rospy.ServiceProxy('/apply_planning_scene', ApplyPlanningScene)
        self.get_scene = rospy.ServiceProxy('/get_planning_scene', GetPlanningScene)
        rospy.sleep(2)

        
        # To see the trajectory
        self.disp = moveit_msgs.msg.DisplayTrajectory()

        self.disp.trajectory_start = self.robot.get_current_state()
        
        self.rate = rospy.Rate(10)

        self.move_group.allow_replanning(1)

        #self.main()
    
    def set_planner_type(self, planner_name):
        if planner_name == "RRT":
            self.move_group.set_planner_id("RRTConnectkConfigDefault")
        if planner_name == "RRT*":
            self.move_group.set_planner_id("RRTstarkConfigDefault")
        if planner_name == "PRM*":
            self.move_group.set_planner_id("PRMstarkConfigDefault")


    def go_to_joint_state(self, joint_state):
        joint_goal = JointState()
        joint_goal.position = joint_state
        self.move_group.set_joint_value_target(joint_goal.position)

        self.plan = self.move_group.plan()
        self.move_group.go(wait=True)
        self.move_group.execute(self.plan, wait=True)

        self.move_group.stop()
        self.move_group.clear_pose_targets()
        rospy.sleep(2)

    def go_to_goal(self, ee_pose):
        pose_goal = geometry_msgs.msg.Pose()
        pose_goal.position.x = ee_pose[0]
        pose_goal.position.y = ee_pose[1]
        pose_goal.position.z = ee_pose[2]
        
        if len(ee_pose) == 6:
            quat = tf.transformations.quaternion_from_euler(math.radians(ee_pose[3]), math.radians(ee_pose[4]), math.radians(ee_pose[5]))
            pose_goal.orientation.x = quat[0]
            pose_goal.orientation.y = quat[1]
            pose_goal.orientation.z = quat[2]
            pose_goal.orientation.w = quat[3]

        else:
            pose_goal.orientation.x = ee_pose[3]
            pose_goal.orientation.y = ee_pose[4]
            pose_goal.orientation.z = ee_pose[5]
            pose_goal.orientation.w = ee_pose[6]    

        self.move_group.set_pose_target(pose_goal)
        self.move_group.set_planning_time(20)
        rospy.sleep(2)
        self.move_group.go(wait=True)
        self.move_group.stop()

        self.move_group.clear_pose_targets()
        rospy.sleep(2)

    def move_gripper(self, cmd):
        if cmd == "Close":
            self.move_gripper.set_named_target("Close")
        elif cmd == "Open":
            self.move_gripper.set_named_target("Open")
        else: 
            self.move_gripper.set_joint_value_target(cmd)
        self.move_gripper.go(wait=True)
        rospy.sleep(2)

    def display_trajectory(self):
        self.disp_pub = rospy.Publisher("/move_group/display_planned_path", moveit_msgs.msg.DisplayTrajectory, queue_size=20)
        self.disp.trajectory.append(self.plan)
        print(self.disp.trajectory)
        self.disp_pub.publish(self.disp)


    #def main(self):

        # Set up path here

        # Pick planner 
    #   self.set_planner_type("RRT")

        # Draw a straight line in 90 deg

    #   rospy.loginfo('Going to first point')
    #   self.go_to_goal([-0.1, -0.63, 0.2, 0, 180, 0])

    #   rospy.loginfo('Moving down')
    #   self.go_to_goal([-0.1, -0.63, 0.097, 0, 180, 0])
        
    #   rospy.loginfo("Going to second point")
    #   self.go_to_goal([0.1, -0.63, 0.097, 0, 180, 0])

    #   rospy.loginfo('Moving Up')
    #   self.go_to_goal([0.1, -0.63, 0.2, 0, 180, 0])

    #   rospy.spin()



if __name__ == '__main__':
    
    robot = MoveRobot()
            # Pick planner 
    robot.set_planner_type("RRT")

        # Draw a straight line in 90 deg

    rospy.loginfo('Going to first point')
    robot.go_to_goal([-0.1, -0.63, 0.2, 0, 180, 0])

    rospy.loginfo('Moving down')
    robot.go_to_goal([-0.1, -0.63, 0.097, 0, 180, 0])
        
    rospy.loginfo("Going to second point")
    robot.go_to_goal([0.1, -0.63, 0.097, 0, 180, 0])

    rospy.loginfo('Moving Up')
    robot.go_to_goal([0.1, -0.63, 0.2, 0, 180, 0])

    rospy.spin()
    

