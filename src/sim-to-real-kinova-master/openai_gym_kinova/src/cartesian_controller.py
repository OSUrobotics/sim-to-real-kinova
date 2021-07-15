#! /usr/bin/env python2

# ros and kinova stuff
import copy

import rospy

from std_msgs.msg import Float32MultiArray, Bool
from geometry_msgs.msg import Point, Pose

import moveit_commander
import moveit_msgs.msg

import actionlib
from openai_gym_kinova.msg import GoToPoseOrientationCartesianAction, GoToPoseOrientationCartesianFeedback, \
    GoToPoseOrientationCartesianResult
from openai_gym_kinova.msg import GoToJointStateAction, GoToJointStateFeedback, GoToJointStateResult


class CartesianController:
    """
    Cartesian controller. Pog
    """

    # create messages that are used to publish feedback/result
    _feedback = GoToPoseOrientationCartesianFeedback()
    _result = GoToPoseOrientationCartesianResult()

    def __init__(self, ):
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.group = moveit_commander.MoveGroupCommander("arm")  # just wanna control the arm.
        self.group.set_planning_time(10)  # idk what this does.
        self.group.set_planner_id("RRTstarkConfigDefault")

        # NOTE: WE GIVE AND RECEIVE IN FLOAT32 SO THAT OTHER MODULES DON'T NEED TO IMPORT MOVEIT COMMANDER. FUCK PYTHON2
        self.current_pose_cartesian_pub = rospy.Publisher('/current_pose_cartesian', Point, queue_size=10)

        self.current_pose_pub = rospy.Publisher('/current_pose', Pose, queue_size=10)

        self.goal_state_cartesian_sub = rospy.Subscriber('/goal_state_cartesian', Point,
                                                         self.go_to_pose_cartesian,
                                                         queue_size=1)  # turn this into an action

        self.goal_state_orientation_cartesian_sub = rospy.Subscriber('/goal_state_orientation_cartesian', Pose,
                                                                     self.go_to_pose_orientation_cartesian,
                                                                     queue_size=1)  # turn this into an action

        self.display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                            moveit_msgs.msg.DisplayTrajectory,
                                                            queue_size=20)

        self.server = actionlib.SimpleActionServer('go_to_pose_orientation_cartesian',
                                                   GoToPoseOrientationCartesianAction,
                                                   execute_cb=self.go_to_pose_orientation_cartesian_callback,
                                                   auto_start=False)
        self.server.start()

        self.joint_server = actionlib.SimpleActionServer(
            "go_to_joint_state_as", GoToJointStateAction, execute_cb=self.go_to_joint_state, auto_start=False)
        self.joint_server.start()

    def publish_current_pose_cartesian(self):
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

    def publish_current_pose(self):
        """
        Publish the current pose of the Kinova arm.
        """
        current_pose = self.group.get_current_pose().pose

        self.current_pose_pub.publish(current_pose)

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
            420.0)  # jump_threshold

        # execute the path
        self.group.execute(plan, True)

    def go_to_pose_orientation_cartesian(self, pose_msg):
        # assumes Pose
        pos_x = pose_msg.position.x
        pos_y = pose_msg.position.y
        pos_z = pose_msg.position.z

        ori_x = pose_msg.orientation.x
        ori_y = pose_msg.orientation.y
        ori_z = pose_msg.orientation.z
        ori_w = pose_msg.orientation.w

        waypoints = []

        wpose = self.group.get_current_pose().pose
        waypoints.append(copy.deepcopy(wpose))

        # set up the end goal pose
        wpose.position.x = pos_x
        wpose.position.y = pos_y
        wpose.position.z = pos_z

        wpose.orientation.x = ori_x
        wpose.orientation.y = ori_y
        wpose.orientation.z = ori_z
        wpose.orientation.w = ori_w

        waypoints.append(copy.deepcopy(wpose))

        # compute the path
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints,  # waypoints to follow
            0.01,  # eef_step
            420.0)  # jump_threshold

        # # display the trajectory
        # display_trajectory = moveit_msgs.msg.DisplayTrajectory()
        # display_trajectory.trajectory_start = self.robot.get_current_state()
        # display_trajectory.trajectory.append(plan)
        #
        # # Publish trajectory to Rviz
        # self.display_trajectory_publisher.publish(display_trajectory)

        # execute the path
        self.group.execute(plan, wait=True)
        self.group.stop()
        self.group.clear_pose_targets()

    def go_to_pose_orientation_cartesian_callback(self, pose_msg):
        rospy.loginfo('Executing pose orientation cartesian callback.')
        self._feedback = Bool(False)
        self.server.publish_feedback(self._feedback)

        # assumes Pose
        pos_x = pose_msg.position.x
        pos_y = pose_msg.position.y
        pos_z = pose_msg.position.z

        ori_x = pose_msg.orientation.x
        ori_y = pose_msg.orientation.y
        ori_z = pose_msg.orientation.z
        ori_w = pose_msg.orientation.w

        waypoints = []

        wpose = self.group.get_current_pose().pose
        waypoints.append(copy.deepcopy(wpose))

        # set up the end goal pose
        wpose.position.x = pos_x
        wpose.position.y = pos_y
        wpose.position.z = pos_z

        wpose.orientation.x = ori_x
        wpose.orientation.y = ori_y
        wpose.orientation.z = ori_z
        wpose.orientation.w = ori_w

        waypoints.append(copy.deepcopy(wpose))

        # compute the path
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints,  # waypoints to follow
            0.01,  # eef_step
            420.0)  # jump_threshold

        # execute the path
        rospy.loginfo('starting...')
        self.group.execute(plan, wait=True)

        rospy.loginfo('done executing')
        self._feedback = Bool(True)
        self.server.publish_feedback(self._feedback)
        self.server.set_succeeded(True)

    def go_to_joint_state(self, msg):
        """
        Action callback to go to home state (i hardcoded it for now lol)
        TODO: unhard code it
        """

        success = True

        feedback = GoToJointStateFeedback()
        result = GoToJointStateResult()

        feedback.is_finished = Bool(False)
        result.end_state = Bool(False)

        self.joint_server.publish_feedback(feedback)

        if self.joint_server.is_preempt_requested():
            self.joint_server.set_preempted()
            success = False
            rospy.loginfo('lmao you cant stop this shit')

        # joint_state_pos_arr = msg.position  # get the joint states from the msg
        # joint_goal = joint_state_pos_arr[:7]  # you could do this

        joint_goal = self.group.get_current_joint_values()
        joint_goal[0] = 4.946186294586092
        joint_goal[1] = 2.83876274182412
        joint_goal[2] = 6.2808348012014825
        joint_goal[3] = 0.7578871767047117
        joint_goal[4] = 4.630829672001013
        joint_goal[5] = 4.488419263237898
        joint_goal[6] = -1.2506944837795144

        # The go command can be called with joint values, poses, or without any
        # parameters if you have already set the pose or joint target for the group
        self.group.go(joint_goal, wait=True)

        # Calling ``stop()`` ensures that there is no residual movement
        self.group.stop()
        self.group.clear_pose_targets()

        result.end_state = Bool(True)
        success = True

        if success:
            self.joint_server.set_succeeded(result)


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
