#! /usr/bin/env python2

# ros and kinova stuff
import copy

import rospy

from std_msgs.msg import Float32MultiArray, Bool
from geometry_msgs.msg import Point, Pose

import moveit_commander
import moveit_msgs.msg

from tf.transformations import quaternion_from_euler
from tf.transformations import euler_from_quaternion

import actionlib
from openai_gym_kinova.msg import GoToPoseOrientationCartesianAction, GoToPoseOrientationCartesianFeedback, \
    GoToPoseOrientationCartesianResult
from openai_gym_kinova.msg import GoToJointStateAction, GoToJointStateFeedback, \
    GoToJointStateResult  # go to joint state
from openai_gym_kinova.msg import AddOrientationNoiseAction, AddOrientationNoiseFeedback, \
    AddOrientationNoiseResult  # add orientation noise
from openai_gym_kinova.msg import AddPositionalNoiseAction, AddPositionalNoiseFeedback, \
    AddPositionalNoiseResult  # add positional noise


# def all_close(goal, actual, tolerance):
#     """
#     Convenience method for testing if a list of values are within a tolerance of their counterparts in another list
#     @param: goal       A list of floats, a Pose or a PoseStamped
#     @param: actual     A list of floats, a Pose or a PoseStamped
#     @param: tolerance  A float
#     @returns: bool
#     """
#     all_equal = True
#     if type(goal) is list:
#         for index in range(len(goal)):
#             if abs(actual[index] - goal[index]) > tolerance:
#                 return False
#
#     elif type(goal) is geometry_msgs.msg.PoseStamped:
#         return all_close(goal.pose, actual.pose, tolerance)
#
#     elif type(goal) is geometry_msgs.msg.Pose:
#         return all_close(pose_to_list(goal), pose_to_list(actual), tolerance)
#
#     return True


class CartesianController:
    """
    Cartesian controller. Pog
    """

    def __init__(self, ):
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.group = moveit_commander.MoveGroupCommander("arm")  # just wanna control the arm.
        self.group.set_planning_time(5)  # idk what this does.
        # self.group.set_planner_id("RRTstarkConfigDefault")
        self.group.set_planner_id("PRMstarkConfigDefault")

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

        self.pose_orientation_server = actionlib.SimpleActionServer('go_to_pose_orientation_cartesian_as',
                                                                    GoToPoseOrientationCartesianAction,
                                                                    execute_cb=self.go_to_pose_orientation_cartesian_callback,
                                                                    auto_start=False)
        self.pose_orientation_server.start()

        self.joint_server = actionlib.SimpleActionServer(
            "go_to_joint_state_as", GoToJointStateAction, execute_cb=self.go_to_joint_state, auto_start=False)
        self.joint_server.start()

        self.pos_noise_server = actionlib.SimpleActionServer(
            "add_positional_noise_as", AddPositionalNoiseAction, execute_cb=self.add_positional_noise, auto_start=False)
        self.pos_noise_server.start()

        self.orientation_noise_server = actionlib.SimpleActionServer(
            "add_orientation_noise_as", AddOrientationNoiseAction, execute_cb=self.add_orientation_noise,
            auto_start=False)
        self.orientation_noise_server.start()

        # self.add_positional_noise_sub = rospy.Subscriber('/add_positional_noise', Pose,
        #                                                              self.add_positional_noise,
        #                                                              queue_size=1)  # turn this into an action

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
        self.group.set_planning_time(10)

        rospy.loginfo('Executing pose orientation cartesian callback.')
        success = True

        feedback = GoToPoseOrientationCartesianFeedback()
        result = GoToPoseOrientationCartesianResult()

        feedback.is_finished = Bool(False)
        result.end_state = Bool(False)

        self.pose_orientation_server.publish_feedback(feedback)

        if self.pose_orientation_server.is_preempt_requested():
            self.pose_orientation_server.set_preempted()
            success = False
            rospy.loginfo('lmao you cant stop this shit')

        # assumes Pose
        pos_x = pose_msg.goal_pose.position.x
        pos_y = pose_msg.goal_pose.position.y
        pos_z = pose_msg.goal_pose.position.z

        ori_x = pose_msg.goal_pose.orientation.x
        ori_y = pose_msg.goal_pose.orientation.y
        ori_z = pose_msg.goal_pose.orientation.z
        ori_w = pose_msg.goal_pose.orientation.w

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

        USE_CARTESIAN_PATH = True

        if USE_CARTESIAN_PATH:
            # compute the path
            (plan, fraction) = self.group.compute_cartesian_path(
                waypoints,  # waypoints to follow
                0.01,  # eef_step
                420.0)  # jump_threshold

            # execute the path
            rospy.loginfo('starting...')
            self.group.execute(plan, wait=True)

        else:
            self.group.go(wpose, wait=True)

        # Calling ``stop()`` ensures that there is no residual movement
        self.group.stop()
        self.group.clear_pose_targets()

        rospy.loginfo('done executing')
        result.end_state = Bool(True)
        success = True

        if success:
            self.pose_orientation_server.set_succeeded(result)

    def go_to_joint_state(self, msg):
        """
        Action callback to go to home state (i hardcoded it for now lol)
        TODO: unhard code it
        """
        self.group.set_planning_time(5)

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

        joint_state_pos_arr = msg.goal_joint_state.position  # get the joint states from the msg
        print(joint_state_pos_arr)
        print('holy crap')
        # joint_goal = joint_state_pos_arr[:7]  # you could do this

        joint_goal = self.group.get_current_joint_values()
        # joint_goal[0] = 4.946186294586092
        # joint_goal[1] = 2.83876274182412
        # joint_goal[2] = 6.2808348012014825
        # joint_goal[3] = 0.7578871767047117
        # joint_goal[4] = 4.630829672001013
        # joint_goal[5] = 4.488419263237898
        # joint_goal[6] = -1.2506944837795144
        joint_goal[0] = joint_state_pos_arr[0]
        joint_goal[1] = joint_state_pos_arr[1]
        joint_goal[2] = joint_state_pos_arr[2]
        joint_goal[3] = joint_state_pos_arr[3]
        joint_goal[4] = joint_state_pos_arr[4]
        joint_goal[5] = joint_state_pos_arr[5]
        joint_goal[6] = joint_state_pos_arr[6]

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

    def add_positional_noise(self, msg):
        """
        Add positional noise to the current position.

        Parameters
        ----------
        msg - AddPositionalNoiseAction. has x, y, z for desired noise pertubation


        Returns
        -------

        """
        x_noise = msg.x
        y_noise = msg.y
        z_noise = msg.z

        feedback = AddPositionalNoiseFeedback()
        result = AddPositionalNoiseResult()

        feedback.is_finished = Bool(False)
        result.end_state = Bool(False)

        self.pos_noise_server.publish_feedback(feedback)

        if self.pos_noise_server.is_preempt_requested():
            self.pos_noise_server.set_preempted()
            success = False
            rospy.loginfo('lmao you cant stop this shit')

        waypoints = []

        wpose = self.group.get_current_pose().pose
        waypoints.append(copy.deepcopy(wpose))

        # set up the end goal pose
        wpose.position.x += x_noise
        wpose.position.y += y_noise
        wpose.position.z += z_noise

        ## use these for a different noiser
        wpose.orientation.x += 0
        wpose.orientation.y += 0
        wpose.orientation.z += 0
        wpose.orientation.w += 0

        waypoints.append(copy.deepcopy(wpose))

        # compute the path
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints,  # waypoints to follow
            0.002,  # eef_step
            420.0)  # jump_threshold

        # execute the path
        rospy.loginfo('starting...')
        self.group.execute(plan, wait=True)

        rospy.loginfo('done executing')
        self.group.stop()
        self.group.clear_pose_targets()

        result.end_state = Bool(True)
        success = True

        if success:
            self.pos_noise_server.set_succeeded(result)

    def add_orientation_noise(self, msg):

        # Step 1: Get current pose
        # Step 2: Convert current quaternion orientation to euler
        # Step 3: Add rotation orientation to euler representation
        # Step 4: Convert euler representation back to quaternion
        # Step 5: Set new quaternion orientation as the target pose for cartesian stuff
        # Step 6: Execute.

        pitch_noise = msg.pitch  # around y axis
        roll_noise = msg.roll  # around x axis
        yaw_noise = msg.yaw  # around z axis

        feedback = AddOrientationNoiseFeedback()
        result = AddOrientationNoiseResult()

        feedback.is_finished = Bool(False)
        result.end_state = Bool(False)

        self.orientation_noise_server.publish_feedback(feedback)

        if self.orientation_noise_server.is_preempt_requested():
            self.orientation_noise_server.set_preempted()
            success = False
            rospy.loginfo('lmao you cant stop this shit')

        waypoints = []

        # Step 1: Get current pose
        wpose = self.group.get_current_pose().pose
        waypoints.append(copy.deepcopy(wpose))

        # Step 2: Convert current quaternion orientation to euler
        quat_vec = [wpose.orientation.x, wpose.orientation.y, wpose.orientation.z, wpose.orientation.w]
        # http://docs.ros.org/en/jade/api/tf/html/python/transformations.html#tf.transformations.euler_from_quaternion
        angles = euler_from_quaternion(quat_vec)  # angles is size 3, its a tuple

        # Step 3: Add rotation orientation to euler representation
        new_angles = [0, 0, 0]
        new_angles[0] = angles[0] + roll_noise
        new_angles[1] = angles[1] + pitch_noise
        new_angles[2] = angles[2] + yaw_noise

        # Step 4: Convert euler representation back to quaternion
        new_quat_vec = quaternion_from_euler(new_angles[0], new_angles[1], new_angles[2])

        # Step 5: Set new quaternion orientation as the target pose for cartesian stuff
        # no changes to position
        wpose.position.x += 0
        wpose.position.y += 0
        wpose.position.z += 0

        ## set up the new end goal pose
        wpose.orientation.x = new_quat_vec[0]
        wpose.orientation.y = new_quat_vec[1]
        wpose.orientation.z = new_quat_vec[2]
        wpose.orientation.w = new_quat_vec[3]

        waypoints.append(copy.deepcopy(wpose))

        # # compute the path
        # (plan, fraction) = self.group.compute_cartesian_path(
        #     waypoints,  # waypoints to follow
        #     0.002,  # eef_step
        #     420.0)  # jump_threshold
        #
        # # Step 6: Execute.
        # rospy.loginfo('starting...')
        # self.group.execute(plan, wait=True)

        # The go command can be called with joint values, poses, or without any
        # parameters if you have already set the pose or joint target for the group
        self.group.go(wpose, wait=True)

        rospy.loginfo('done executing')
        self.group.stop()
        self.group.clear_pose_targets()

        result.end_state = Bool(True)
        success = True

        if success:
            self.orientation_noise_server.set_succeeded(result)


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
