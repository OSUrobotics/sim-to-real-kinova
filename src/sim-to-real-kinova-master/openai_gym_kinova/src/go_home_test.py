#! /usr/bin/env python2

# control this with python2!
import sys

# ros and kinova stuff
import rospy

# finger velocity control
from kinova_msgs.msg import PoseVelocityWithFingerVelocity
from std_msgs.msg import Bool
import geometry_msgs.msg
import moveit_commander
import moveit_msgs.msg

import actionlib
from openai_gym_kinova.msg import GoToPoseOrientationCartesianAction, GoToPoseOrientationCartesianFeedback, GoToPoseOrientationCartesianResult
from openai_gym_kinova.msg import GoToJointStateAction, GoToJointStateFeedback, GoToJointStateResult, GoToJointStateGoal

from sensor_msgs.msg import JointState

# def debug_loop():
#     joint_state_topic = ['joint_states:=/j2s7s300_driver/out/joint_state']
#     moveit_commander.roscpp_initialize(joint_state_topic)
#     # moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('get_cartesian_pose', anonymous=True)
#
#     rate = rospy.Rate(0.5)  # 100hz
#
#     robot = moveit_commander.RobotCommander()
#     scene = moveit_commander.PlanningSceneInterface()
#     group = moveit_commander.MoveGroupCommander("arm")
#     group.set_planning_time(10)
#     # gripper = moveit_commander.MoveGroupCommander("gripper")
#
#     display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
#                                                    moveit_msgs.msg.DisplayTrajectory,
#                                                    queue_size=20)
#
#     joint_goal = group.get_current_joint_values()
#     joint_goal[0] = 4.946186294586092
#     joint_goal[1] = 2.83876274182412
#     joint_goal[2] = 6.2808348012014825
#     joint_goal[3] = 0.7578871767047117
#     joint_goal[4] = 4.630829672001013
#     joint_goal[5] = 4.488419263237898
#     joint_goal[6] = -1.2506944837795144
#
#     # The go command can be called with joint values, poses, or without any
#     # parameters if you have already set the pose or joint target for the group
#     group.go(joint_goal, wait=True)
#
#     # Calling ``stop()`` ensures that there is no residual movement
#     group.stop()
#
#     group.clear_pose_targets()

def feedback_cb(msg):
 print 'Feedback received:', msg


def debug_loop():
    joint_state_topic = ['joint_states:=/j2s7s300_driver/out/joint_state']
    moveit_commander.roscpp_initialize(joint_state_topic)
    # moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('get_cartesian_pose', anonymous=True)

    rate = rospy.Rate(0.5)  # 100hz

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group = moveit_commander.MoveGroupCommander("arm")
    group.set_planning_time(10)
    # gripper = moveit_commander.MoveGroupCommander("gripper")

    display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                   moveit_msgs.msg.DisplayTrajectory,
                                                   queue_size=20)

    # self.joint_state_sub = rospy.Subscriber('/j2s7s300_driver/out/joint_state', JointState, self.joint_state_callback,
    #                                         queue_size=10)

    # joint_goal = group.get_current_joint_values()
    # joint_goal[0] = 4.946186294586092
    # joint_goal[1] = 2.83876274182412
    # joint_goal[2] = 6.2808348012014825
    # joint_goal[3] = 0.7578871767047117
    # joint_goal[4] = 4.630829672001013
    # joint_goal[5] = 4.488419263237898
    # joint_goal[6] = -1.2506944837795144

    joint_goal = JointState()
    client = actionlib.SimpleActionClient('go_to_joint_state_as', GoToJointStateAction)
    client.wait_for_server()
    goal = GoToJointStateGoal()
    goal.goal_joint_state = joint_goal
    client.send_goal(goal, feedback_cb=feedback_cb)
    client.wait_for_result()
    result = client.get_result()

    print "ok finished"

if __name__ == '__main__':
    try:
        debug_loop()
    except rospy.ROSInterruptException:
        pass
