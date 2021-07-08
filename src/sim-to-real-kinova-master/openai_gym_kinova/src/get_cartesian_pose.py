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



    while not rospy.is_shutdown():
        pose = group.get_current_pose().pose
        print ("====================")
        print (pose)

        # rate.sleep()
        rospy.sleep(4)


if __name__ == '__main__':
    try:
        debug_loop()
    except rospy.ROSInterruptException:
        pass
