#! /usr/bin/env python2

# control this with python2!
import sys
import copy

# ros and kinova stuff
import rospy

# finger velocity control
from kinova_msgs.msg import PoseVelocityWithFingerVelocity
from std_msgs.msg import Bool
import geometry_msgs.msg
import moveit_commander
import moveit_msgs.msg


home_orientation_cartesian = [0.1074, -0.48, 0.42, 0.54, 0.32, 0.04, 0.77]

pre_grasp_orientation_cartesian = [0.1074, -0.48, 0.42, 0.54, 0.32, 0.04, 0.77]


def debug_loop():
    joint_state_topic = ['joint_states:=/j2s7s300_driver/out/joint_state']
    moveit_commander.roscpp_initialize(joint_state_topic)
    # moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('try_moveit', anonymous=True)

    rate = rospy.Rate(0.5)  # 100hz

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group = moveit_commander.MoveGroupCommander("arm")
    # group.set_planning_time(10)
    # gripper = moveit_commander.MoveGroupCommander("gripper")

    display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                   moveit_msgs.msg.DisplayTrajectory,
                                                   queue_size=20)

    waypoints = []

    wpose = group.get_current_pose().pose
    waypoints.append(copy.deepcopy(wpose))

    # set up the end goal pose
    wpose.position.x = pre_grasp_orientation_cartesian[0]
    wpose.position.y = pre_grasp_orientation_cartesian[1]
    wpose.position.z = pre_grasp_orientation_cartesian[2]

    wpose.orientation.x = pre_grasp_orientation_cartesian[3]
    wpose.orientation.y = pre_grasp_orientation_cartesian[4]
    wpose.orientation.z = pre_grasp_orientation_cartesian[5]
    wpose.orientation.w = pre_grasp_orientation_cartesian[6]

    waypoints.append(copy.deepcopy(wpose))

    # compute the path
    (plan, fraction) = group.compute_cartesian_path(
        waypoints,  # waypoints to follow
        0.1,  # eef_step
        0.0)  # jump_threshold

    # group.set_pose_target(wpose)
    # plan = group.plan()

    # display the trajectroy
    display_trajectory = moveit_msgs.msg.DisplayTrajectory()
    display_trajectory.trajectory_start = robot.get_current_state()
    display_trajectory.trajectory.append(plan)

    # Publish
    display_trajectory_publisher.publish(display_trajectory)

    # execute the path
    group.execute(plan, wait=True)
    # group.stop()
    # group.clear_pose_targets()
    rospy.sleep(0.5)


if __name__ == '__main__':
    try:
        debug_loop()
    except rospy.ROSInterruptException:
        pass
