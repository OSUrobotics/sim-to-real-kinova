#! /usr/bin/env python2

# ros and kinova stuff
import copy

import rospy

from std_msgs.msg import Float32MultiArray
from geometry_msgs.msg import Point

import moveit_commander
import moveit_msgs.msg


class CartesianController:
    """
    Cartesian controller. Pog
    """

    def __init__(self, ):
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.group = moveit_commander.MoveGroupCommander("arm")  # just wanna control the arm.
        self.group.set_planning_time(10)  # idk what this does.

        # NOTE: WE GIVE AND RECEIVE IN FLOAT32 SO THAT OTHER MODULES DON'T NEED TO IMPORT MOVEIT COMMANDER. FUCK PYTHON2
        self.current_pose_cartesian_pub = rospy.Publisher('/current_pose_cartesian', Point, queue_size=10)

        self.goal_state_cartesian_sub = rospy.Subscriber('/goal_state_cartesian', Point,
                                                         self.go_to_pose_cartesian, queue_size=10)  # turn this into an action

    def publish_current_pose(self):
        """
        Publish the current pose of the Kinova arm.
        """
        current_pose = self.group.get_current_pose().pose

        pos_x = current_pose.position.x
        pos_y = current_pose.position.y
        pos_z = current_pose.position.z

        msg = Point()
        msg.x = pos_x
        msg.y = pos_y
        msg.z = pos_z

        self.current_pose_cartesian_pub.publish(msg)

    def go_to_pose_cartesian(self, point_msg):
        # assumes Point
        pos_x = point_msg.x
        pos_y = point_msg.y
        pos_z = point_msg.z

        waypoints = []

        wpose = self.group.get_current_pose().pose
        waypoints.append(copy.deepcopy(wpose))

        # set up the end goal pose
        wpose.position.x = pos_x
        wpose.position.y = pos_y
        wpose.position.z = pos_z
        waypoints.append(copy.deepcopy(wpose))

        # compute the path
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints,  # waypoints to follow
            0.01,  # eef_step
            0.0)  # jump_threshold

        # execute the path
        self.group.execute(plan, True)


def cartesian_control_loop():
    joint_state_topic = ['joint_states:=/j2s7s300_driver/out/joint_state']
    moveit_commander.roscpp_initialize(joint_state_topic)

    rospy.init_node('cartesian_controller', anonymous=True)

    rate = rospy.Rate(100)  # 100hz

    cartesian_controller = CartesianController()

    while not rospy.is_shutdown():
        cartesian_controller.publish_current_pose()
        rate.sleep()


if __name__ == '__main__':
    try:
        cartesian_control_loop()
    except rospy.ROSInterruptException:
        pass
