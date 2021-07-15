#!/usr/bin/env python3

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import numpy as np

import rospy
from sensor_msgs.msg import JointState
from kinova_msgs.msg import FingerPosition, KinovaPose
from std_msgs.msg import String, Float32, Float32MultiArray, Int32

# finger velocity control
from kinova_msgs.msg import PoseVelocityWithFingerVelocity
from std_msgs.msg import Bool
from geometry_msgs.msg import Point, Pose

import actionlib
from openai_gym_kinova.msg import GoToJointStateAction, GoToJointStateFeedback, GoToJointStateResult, GoToJointStateGoal


class KinovaGripper_Env:
    def __init__(self):
        self.joint_states = JointState()
        self.finger_pos = FingerPosition()
        self.reward = 0
        self.object_pose = Float32()
        self.object_pose = [0, 0, 0]
        self.object_id = String()
        self.Grasp_Reward = False
        self.wrist_pose = np.zeros(
            3)  # The wrist position in world coordinates. Since we using local co-ordinate it is 0
        self.finger_dist_list = []
        self.finger_pose_list = []
        self.joint_pos_goal = JointState()

        self.current_pose = Pose()

        self.lift_pose = [4.866613704375614, 4.122815448785748, 0.1414330286430561, 1.9348951889150416,
                          3.6055872208310284, 3.697782661976264, 5.638702453909283]
        self.goal_pose = [4.535117260320219, 4.0081762175538715, -0.19378097191225108, 0.9701969088088641,
                          2.590757729523254, 4.529786677082317, 6.372174835004584]
        self.home_angle = [4.964415099615467, 2.8208391350556687, 0.44980407982031634, 0.6773156347693454,
                           4.663973244399267, 4.3373637009441675, 5.135849170570483]
        self.pre_grasp_angle = [4.983464158260585, 4.045665003586699, 0.055458519583596724, 1.010266164779924,
                                3.939520190967737, 4.624078558637662, 5.97568500981024]

        self.pre_grasp_cartesian = [0.0602, -0.5789, 0.1987]  # bruh
        self.home_cartesian = [-0.0566, -0.4257, 0.3432]  # position

        # we reset to this pose before aligning for every grasp
        # self.home_orientation_cartesian = [0.0396, -0.5164, 0.2085, 0.7228, -0.0835, .0192, 0.6856]
        self.home_orientation_cartesian = [0.0329, -0.4842, 0.3109, 0.7778, -0.0420, 0.0475, 0.6252]
        # TODO: change out with alejo's UR5 pertubation code
        self.pre_grasp_orientation_cartesian = [0.0415, -0.5715, 0.2103, 0.7978, -0.0791, 0.1117, 0.5871]
        # this is a set position we move our hand to, after we've closed and lifted the hand.
        self.check_reward_orientation_cartesian = [-0.1345, -0.5653, 0.2592, 0.7367, -0.1048, 0.0256, 0.6674]

        # lift the object to this pose
        self.manual_lift_pose_cartesian = [0.0416, -0.5779, 0.3166, 0.7910, -0.0854, 0.1197, 0.5937]

        # THE JOINT ANGLES ARE FROM BOTTOM TO END EFFECTOR
        # self.joint_angle1 = [4.76, 4.52, -0.015, 1.43, 3.21, 4.53, 6.22]
        # # Pick Up
        # self.joint_angle2 = [4.78, 4.13, -0.04, 1.24, 3.21, 4.33, 6.23]
        # # Move slightly to the right
        # self.joint_angle3 = [4.99, 4.16, 0.05, 1.36, 3.21, 4.25, 6.15]
        # # Move more to the right
        # self.joint_angle4 = [4.99, 4.16, 0.05, 1.36, 3.21, 4.25, 6.15]
        # # Move slightly forward
        # self.joint_angle5 = [4.98, 4.20, 0.05, 1.52, 3.21, 4.13, 6.14]
        # # Move more to the right
        # self.joint_angle6 = [5.10, 4.20, 0.09, 1.51, 3.21, 4.13, 6.10]
        # # Move down
        # self.joint_angle7 = [5.11, 4.49, 0.08, 1.65, 3.18, 4.28, 6.12]
        self.finger_angle = []

        ###Subscribers###
        self.joint_state_sub = rospy.Subscriber('/j2s7s300_driver/out/joint_state', JointState,
                                                self.joint_state_callback, queue_size=10)
        self.finger_sub = rospy.Subscriber('/j2s7s300_driver/out/finger_position', FingerPosition,
                                           self.finger_state_callback, queue_size=10)
        self.object_pose_sub = rospy.Subscriber('/object_pose', Float32MultiArray, self.object_pose_callback,
                                                queue_size=10)
        self.marker_id_sub = rospy.Subscriber('/marker_id', String, self.marker_id_callback, queue_size=10)
        self.finger_dist_sub = rospy.Subscriber('/finger_dist', Float32MultiArray, self.finger_dist_callback,
                                                queue_size=10)
        self.finger_pose_sub = rospy.Subscriber('/finger_pose', Float32MultiArray, self.finger_pose_callback,
                                                queue_size=10)
        self.reset_check_sub = rospy.Subscriber('/sim2real/reset_status', Int32, self.reset_check_callback,
                                                queue_size=10)
        self.finger_angle_sub = rospy.Subscriber('/finger_angle', Float32MultiArray, self.finger_angle_callback,
                                                 queue_size=10)
        # self.finger2_dist_angle_sub = rospy.Subscriber('/finger2_dist_angle', Float32, self.finger2_dist_angle_callback, queue_size=10)

        ###Publisher###
        self.finger_command_pub = rospy.Publisher('/sim2real/finger_command', FingerPosition, queue_size=10)
        self.joint_angle_command_pub = rospy.Publisher('/sim2real/joint_angle_command', JointState, queue_size=10)

        # wtf does queue_size actually do???
        self.finger_velocity_pub = rospy.Publisher('/j2s7s300_driver/in/cartesian_velocity_with_finger_velocity',
                                                   PoseVelocityWithFingerVelocity, queue_size=10)
        self.finger_velocity_controller_pub = rospy.Publisher('/finger_velocity', PoseVelocityWithFingerVelocity,
                                                              queue_size=10)
        self.finish_velocity_controller_pub = rospy.Publisher('/finish_velocity_controller', Bool, queue_size=1)

        # for controlling the cartesian controller
        self.goal_state_cartesian_pub = rospy.Publisher('/goal_state_cartesian', Point, queue_size=10)
        self.goal_state_orientation_cartesian_pub = rospy.Publisher('/goal_state_orientation_cartesian', Pose,
                                                                    queue_size=10)

        self.current_pose_sub = rospy.Publisher('/current_pose', Pose, self.update_current_pose, queue_size=10)

        self.obs_pub = rospy.Publisher('/sim2real/obs', Float32MultiArray, queue_size=10)
        self.reset_pub = rospy.Publisher('/sim2real/reset', Int32, queue_size=10)

    def update_current_pose(self, pose_msg):
        self.current_pose = pose_msg

    ### Finger Position in Radians ###
    def get_joint_states(self):
        temp = list(self.joint_states.position)
        # print(temp)
        finger_joint_state_value = [0, 0, 0, 0, 0, 0]
        if self.finger_angle != []:
            finger_joint_state_value[0] = self.finger_angle[0]
            finger_joint_state_value[1] = self.finger_angle[1]
            finger_joint_state_value[2] = self.finger_angle[2]

            # TODO: WTF ARE THESE? THEY DON'T EVEN MAKE SENSE??????
            finger_joint_state_value[3] = self.finger_angle[3]
            finger_joint_state_value[4] = self.finger_angle[2]
            finger_joint_state_value[5] = self.finger_angle[3]
        return finger_joint_state_value

    def get_obj_pose(self):
        return self.object_pose

    # Function to return the angles between the palm normal and the object location
    def get_angles(self):
        obj_pose = self.get_obj_pose()  # x, y, z
        # print(obj_pose)
        local_obj_pos = np.copy(obj_pose)
        local_obj_pos = np.append(local_obj_pos, 1)
        obj_wrist = local_obj_pos[0:3] / np.linalg.norm(local_obj_pos[0:3])
        center_line = np.array([0, 1, 0])
        z_dot = np.dot(obj_wrist[0:2], center_line[0:2])
        z_angle = np.arccos(z_dot / np.linalg.norm(obj_wrist[0:2]))
        x_dot = np.dot(obj_wrist[1:3], center_line[1:3])
        x_angle = np.arccos(x_dot / np.linalg.norm(obj_wrist[1:3]))
        return x_angle, z_angle

        # Function to get rewards based only on the lift reward. This is primarily used to generate data for the grasp classifier

    def get_reward_DataCollection(self):

        lift = rospy.get_param('Goal')
        # rospy.loginfo(lift)
        # rospy.loginfo(type(lift))
        if lift is True or lift == 'true':  # yeah... we had a string bug earlier.
            lift_reward = 1
            done = True
        else:  # lift == 'false' or some other weird stuff
            lift_reward = 0
            done = False
        return lift_reward, {}, done

    # Function to get rewards for RL training
    def get_reward(self):
        # Grasp reward
        grasp_reward = 0.0
        # obs = self.get_obs()
        lift = rospy.get_param('Goal')

        # network_inputs=obs
        # inputs = torch.FloatTensor(np.array(network_inputs)).to(device)
        outputs = 0  # self.Grasp_net(inputs).cpu().data.numpy().flatten()
        if (outputs >= 0.3) & (not self.Grasp_Reward):
            grasp_reward = 5.0
            self.Grasp_Reward = True
        else:
            grasp_reward = 0.0
        lift = rospy.get_param('Goal')
        print("Grasp_reward: " + str(grasp_reward))
        if lift:
            lift_reward = 50.0
            done = True
        else:
            lift_reward = 0.0
            done = False
        finger_reward = sum(self.finger_dist_list)
        reward = 0.2 * finger_reward + lift_reward + grasp_reward

        return reward, {}, done

        # Function to get the dimensions of the object

    def get_obj_size(self):
        # TODO: get rid of hard coding...
        return [42, 42, 110]

    # Function to get the distance between the digits on the fingers and the object center
    def get_finger_obj_dist(self):
        return self.finger_dist_list

    # Function to return global or local transformation matrix
    def get_obs(self):  # Finger Joint states, Object Distance, Angles
        obj_pose = self.get_obj_pose()
        obj_pose = np.copy(obj_pose)
        x_angle, z_angle = self.get_angles()
        joint_states = self.get_joint_states()
        obj_size = self.get_obj_size()
        finger_obj_dist = self.get_finger_obj_dist()
        fingers_6D_pose = []

        fingers_6D_pose = self.get_finger_pos()
        fingers_6D_pose = fingers_6D_pose + list(self.wrist_pose) + list(obj_pose) + joint_states + \
                          [obj_size[0], obj_size[1], obj_size[2] * 2] + finger_obj_dist + [x_angle, z_angle]
        # print('this is the obs data',fingers_6D_pose)
        return fingers_6D_pose

    ####Gives x,y,z position of fingers#####
    def get_finger_pos(self):
        return self.finger_pose_list

    # Function to step the hardware forward in time
    def step_pos(self, action):
        total_reward = 0
        self.finger_pos_goal = FingerPosition()
        self.finger_pos_goal.finger1 = action[0]
        self.finger_pos_goal.finger2 = action[1]
        self.finger_pos_goal.finger3 = action[2]

        rospy.set_param('exec_done', "false")

        self.finger_command_pub.publish(self.finger_pos_goal)

        counter = 0

        while not rospy.get_param('exec_done'):
            rospy.sleep(0.1)
            counter += 1

        print("number of cycles:", counter)
        obs = self.get_obs()
        obs_pub_msg = Float32MultiArray()
        obs_pub_msg.data.append(obs)
        self.obs_pub.publish(obs_pub_msg)

        ### Get this reward for RL training ###
        total_reward, info, done = self.get_reward()

        ### Get this reward for grasp classifier collection ###
        # total_reward, info, done = self.get_reward_DataCollection()
        return obs, total_reward, done, info

    def step(self, action):
        # TODO: scale to between -6800 - 6800
        # TODO: EVALUATE THIS METHOD
        self.finger_vel_goal = PoseVelocityWithFingerVelocity()
        self.finger_vel_goal.finger1 = action[0]
        self.finger_vel_goal.finger2 = action[1]
        self.finger_vel_goal.finger3 = action[2]

        self.finger_velocity_controller_pub.publish(self.finger_vel_goal)

        obs = self.get_obs()
        obs_pub_msg = Float32MultiArray()
        obs_pub_msg.data.append(obs)
        self.obs_pub.publish(obs_pub_msg)

        ### Get this reward for RL training ###
        # total_reward, info, reward_check_done = self.get_reward()

        total_reward = 0  # sparse rewards lol
        info = {}  # i love diagnostic info

        # TODO: it seems that reward is labelling as finished too early. we need to fix that to default to not finishing
        # if done:
        #     print('Finishing here!')
        #     self.finish_velocity_controller_pub.publish(True)

        rospy.loginfo('=== checking joint done')
        joint_check_done = self.check_joint_done()
        rospy.loginfo('=== done checking joint done')

        # done = reward_check_done or joint_check_done  # check either condition giving a done condition
        done = joint_check_done

        if done:  # todo: turn back to reward
            print('Finishing here!')
            self.finish_velocity_controller_pub.publish(True)

        return obs, total_reward, done, info

    def check_reward(self):
        rospy.loginfo('======================starting reward check')

        # step 0: just wait a bit. buffer.
        rospy.sleep(7)

        # step 1: lift the thing. we put to a fixed position, but technically you should move it straight up
        # first get the current pose
        # current_pose = copy.deepcopy(self.current_pose)
        #
        # # next modify the current pose's z!
        # current_pose.position.z += 0.125
        #
        #

        # # execute the lift command

        rospy.loginfo('lifting right now')

        self.move_arm_orientation_cartesian(self.manual_lift_pose_cartesian)
        rospy.sleep(7)  # wait a bit before taking more actions

        rospy.loginfo('moving to check reward orientation')

        # move to the manually set goal position on the right
        self.move_arm_orientation_cartesian(self.check_reward_orientation_cartesian)
        rospy.sleep(7)  # wait for the arm to finish moving

        rospy.loginfo('waiting a bit before reward check...')
        rospy.set_param('Goal', False)  # turn the reward check off!
        rospy.sleep(1)  # wait a little!
        rospy.loginfo('running reward check')

        # now check for the sparse reward. get_reward_DataCollection() does this for us
        # note: info is hardcoded empty dict. done doesn't really matter either
        total_reward, info, done = self.get_reward_DataCollection()

        # rospy.set_param('finish_reward_check', "true")

        rospy.loginfo('====================== ending reward check')

        return total_reward

    def check_joint_done(self, threshold=2.4):
        # checks the joint states, and if the joint states are closed, then return True
        finger_joint_state_value = [0, 0, 0]
        finger1 = self.joint_states.position[7]
        finger2 = self.joint_states.position[8]
        # finger3 = self.joint_states.position[9]

        # we don't care about the 3rd finger
        total_pos = finger1 + finger2
        print(total_pos)

        is_done = total_pos >= threshold

        return is_done

    def move_arm_cartesian(self, cartesian_goal):
        """
        Moves the arm to given cartesian coordinate.
        input: cartesian_goal, should be an array [x, y, z]

        """
        msg = Point()
        msg.x = cartesian_goal[0]
        msg.y = cartesian_goal[1]
        msg.z = cartesian_goal[2]

        self.goal_state_cartesian_pub.publish(msg)

    def move_arm_orientation_cartesian(self, cartesian_goal):
        """
        Moves the arm to given cartesian coordinate.
        input: cartesian_goal, should be an array [pos_x, pos_y, pos_z, ori_x, ori_y, ori_z, ori_w]

        """
        msg = Pose()

        msg.position.x = cartesian_goal[0]
        msg.position.y = cartesian_goal[1]
        msg.position.z = cartesian_goal[2]

        msg.orientation.x = cartesian_goal[3]
        msg.orientation.y = cartesian_goal[4]
        msg.orientation.z = cartesian_goal[5]
        msg.orientation.w = cartesian_goal[6]

        self.goal_state_orientation_cartesian_pub.publish(msg)

    def feedback_cb(self, msg):
        print('Feedback received:', msg)

    def reset(self):
        rospy.loginfo('--------------------starting reset check')

        # this would bring the arm back home.
        # self.go_to_home()  # TODO: FIX CARTESIAN GO TO HOME (NEED ACTION SERVER FIRST)
        rospy.sleep(2)

        # open up the gripper.
        rospy.loginfo('=== step pos')
        self.step_pos(np.array([0, 0, 0]))
        rospy.sleep(7)

        # move arm back to real kinova home joint state.
        rospy.loginfo('=== move to kinova real home joint state')
        joint_goal = JointState()
        client = actionlib.SimpleActionClient('go_to_joint_state_as', GoToJointStateAction)
        client.wait_for_server()
        goal = GoToJointStateGoal()
        goal.goal_joint_state = joint_goal
        client.send_goal(goal, feedback_cb=self.feedback_cb)
        client.wait_for_result()
        result = client.get_result()

        rospy.sleep(2)  # TODO: i added this in before leaving the lab on wednesday. if this doesn't work then cry...

        # move hand to the home position
        rospy.loginfo('=== move to home')
        self.move_arm_orientation_cartesian(self.home_orientation_cartesian)
        rospy.sleep(8)  # wait for the arm to finish moving. otherwise it will get interrupted

        # go to the pregrasp orientation
        rospy.loginfo('=== move to pregrasp')
        self.move_arm_orientation_cartesian(self.pre_grasp_orientation_cartesian)
        rospy.sleep(7)  # wait for the arm to finish moving. otherwise it will get interrupted

        # get the parameters required by openai gym wrapper
        obs = self.get_obs()

        # not finished anymore! re-enable the grasping controller to take velocities.
        self.finish_velocity_controller_pub.publish(False)

        rospy.loginfo('-------------------ending reset')

        return obs

    def joint_state_callback(self, msg):
        self.joint_states = msg

        # lmao do some actual updates here!
        # print('joint states:', self.joint_states.position)

    def finger_state_callback(self, msg):
        self.finger_pos = msg

    def object_pose_callback(self, msg):
        self.object_pose = list(msg.data)
        # print('object pose',self.object_pose)

    def marker_id_callback(self, msg):
        self.object_id = msg

    def finger_dist_callback(self, msg):
        self.finger_dist_list = list(msg.data)

    # TODO: ARE WE EVEN USING THIS???
    def reset_check_callback(self, msg):
        self.reset_done = list(msg.data)

    def finger_angle_callback(self, msg):
        self.finger_angle = list(msg.data)

    # def finger2_dist_angle_callback(self, msg):
    #    self.finger2_dist_ang = msg

    # Look at this function again

    def finger_pose_callback(self, msg):
        self.finger_pose_list = list(msg.data)
