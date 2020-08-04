#!/usr/bin/env python3

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import numpy as np
#import math
#import matplotlib.pyplot as plt
#import time
#import os, sys
#from scipy.spatial.transform import Rotation as R
import random
#import pickle
#import pdb
#mport torch
#import torch.nn as nn
#import torch.nn.functional as F
#import xml.etree.ElementTree as ET
#from classifier_network import LinearNetwork, ReducedLinearNetwork
#import re
#from scipy.stats import triang

import rospy
from sensor_msgs.msg import JointState
from kinova_msgs.msg import FingerPosition, KinovaPose
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import String, Float32, Float32MultiArray, Int32

#device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

class KinovaGripper_Env:
    def __init__(self):
        self.joint_states = JointState()
        self.finger_pos = FingerPosition()
        self.reward = 0
        self.object_pose = Float32()
        self.object_id = String()
        self.Grasp_Reward = False
        self.wrist_pose= np.zeros(3)  # The wrist position in world coordinates. Since we using local co-ordinate it is 0
        self.finger_dist_list = Float32MultiArray()
        self.finger_pose_list = Float32MultiArray()
        self.finger1_dist_ang = 0
        self.finger2_dist_ang = 0
        
        ###Grasp Classifier###
        #self.Grasp_net = LinearNetwork().to(device)
        #trained_model = "path to model"  ###Path Requiered 
        #model = torch.load(trained_model)
        #self.Grasp_net.load_state_dict(model)
        #self.Grasp_net.eval()
        

        ###Define Intermidiate Positions###
        # Starting position at the center of the table
        self.joint_angle1 = [4.76, 4.52, -0.015, 1.43, 3.21, 4.53, 6.22]
        # Pick Up 
        self.joint_angle2 = [4.78, 4.13, -0.04, 1.24, 3.21, 4.33, 6.23]
        # Move slightly to the right
        self.joint_angle3 = [4.99, 4.16, 0.05, 1.36, 3.21, 4.25, 6.15]
        # Move more to the right
        self.joint_angle4 = [4.99, 4.16, 0.05, 1.36, 3.21, 4.25, 6.15]
        # Move slightly forward
        self.joint_angle5 = [4.98, 4.20, 0.05, 1.52, 3.21, 4.13, 6.14]
        # Move more to the right
        self.joint_angle6 = [5.10, 4.20, 0.09, 1.51, 3.21, 4.13, 6.10]
        # Move down
        self.joint_angle7 = [5.11, 4.49, 0.08, 1.65, 3.18, 4.28, 6.12]


        ###Subscribers###
        self.joint_state_sub = rospy.Subscriber('/j2s7s300_driver/out/joint_state', JointState, self.joint_state_callback, queue_size=10)
        self.finger_sub = rospy.Subscriber('/j2s7s300_driver/out/finger_position', FingerPosition, self.finger_state_callback, queue_size=10)
        self.object_pose_sub = rospy.Subscriber('/object_pose', Float32, self.object_pose_callback, queue_size=10)
        self.marker_id_sub = rospy.Subscriber('/marker_id', String, self.marker_id_callback, queue_size=10)
        self.finger_dist_sub = rospy.Subscriber('/finger_dist', Float32, self.finger_dist_callback, queue_size=10)
        self.finger_pose_sub = rospy.Subscriber('/finger_pose', Float32, self.finger_pose_callback, queue_size=10)
        self.reset_check_sub = rospy.Subscriber('/sim2real/reset_status', Int32, self.reset_check_callback, queue_size=10)        
        
        ###Publisher###
        self.finger_command_pub = rospy.Publisher('/sim2real/finger_command', FingerPosition, queue_size=10)
        self.joint_angle_command_pub = rospy.Publisher('/sim2real/joint_angle_command', JointState, queue_size=10)
        self.obs_pub = rospy.Publisher('/sim2real/obs', Float32MultiArray, queue_size=10)
        self.reset = rospy.Publisher('/sim2real/reset', Int32, queue_size=10)
        
    ### Finger Position in Radians ###
    def get_joint_states(self): 
        temp = list(self.joint_states.position)     
        finger_joint_state_value = [0, 0, 0, 0, 0, 0]
        finger_joint_state_value[0] = temp[7]
        finger_joint_state_value[1] = temp[8]
        finger_joint_state_value[2] = temp[9]
        finger_joint_state_value[3] = self.finger1_dist_ang
        finger_joint_state_value[4] = self.finger2_dist_ang
        finger_joint_state_value[5] = self.finger2_dist_ang
        return  finger_joint_state_value

    
    def get_obj_pose(self):
        return self.object_pose    
    
    
    # Function to return the angles between the palm normal and the object location
    def get_angles(self):
        obj_pose = self.get_obj_pose() #x, y, z
        local_obj_pos=np.copy(obj_pose)
        local_obj_pos=np.append(local_obj_pos,1)
        obj_wrist = local_obj_pos[0:3]/np.linalg.norm(local_obj_pos[0:3])
        center_line = np.array([0,1,0])
        z_dot = np.dot(obj_wrist[0:2],center_line[0:2])
        z_angle = np.arccos(z_dot/np.linalg.norm(obj_wrist[0:2]))
        x_dot = np.dot(obj_wrist[1:3],center_line[1:3])
        x_angle = np.arccos(x_dot/np.linalg.norm(obj_wrist[1:3]))
        return x_angle,z_angle  
    
    
    # Function to get rewards based only on the lift reward. This is primarily used to generate data for the grasp classifier
    def get_reward_DataCollection(self):
        obs = self.get_obs() 

        lift = rospy.get_param('Goal')
        if lift:
            lift_reward = 1
            done = True
        else:
            lift_reward = 0
            done = False        
        return lift_reward, {}, done
    
    
    # Function to get rewards for RL training
    def get_reward(self):                    
        # Grasp reward
        grasp_reward = 0.0 
        #obs = self.get_obs() 
        lift = rospy.get_param('Goal')
        
        #network_inputs=obs
        #inputs = torch.FloatTensor(np.array(network_inputs)).to(device)
        outputs = 0#self.Grasp_net(inputs).cpu().data.numpy().flatten()
        if (outputs >=0.3) & (not self.Grasp_Reward):
            grasp_reward = 5.0
            self.Grasp_Reward=True
        else:
            grasp_reward = 0.0
        lift = rospy.get_param('Goal')
        print("Grasp_reward: " +str(grasp_reward))         
        if lift:
            lift_reward = 50.0
            done = True
        else:
            lift_reward = 0.0
            done = False            
        finger_reward = sum(self.finger_dist_list)
        reward = 0.2*finger_reward + lift_reward + grasp_reward
        
        return reward, {}, done    
    
    
    # Function to get the dimensions of the object
    def get_obj_size(self):
        return [42, 42, 110]


    # Function to get the distance between the digits on the fingers and the object center
    def get_finger_obj_dist(self):
        return self.finger_dist_list
   
    
    # Function to return global or local transformation matrix
    def get_obs(self): #Finger Joint states, Object Distance, Angles
        obj_pose = self.get_obj_pose()
        obj_pose = np.copy(obj_pose)
        x_angle,z_angle = self.get_angles()
        joint_states = self.get_joint_states()
        obj_size = self.get_obj_size()
        finger_obj_dist = self.get_finger_obj_dist()          
        fingers_6D_pose = []

        fingers_6D_pose.append(self.get_finger_pos())
        fingers_6D_pose = fingers_6D_pose + list(self.wrist_pose) + list(obj_pose) + joint_states + [obj_size[0], obj_size[1], obj_size[2]*2] + finger_obj_dist + [x_angle, z_angle] 
        
        return fingers_6D_pose     
    
    
    ####Gives x,y,z position of fingers#####
    def get_finger_pos(self):
        return self.finger_pose_list
    
    
        #Function to step the hardware forward in time
    def step(self, action):
        total_reward = 0
        self.finger_pos_goal = FingerPosition()
        self.finger_pos_goal.finger1 = action.finger1
        self.finger_pos_goal.finger2 = action.finger2
        self.finger_pos_goal.finger3 = action.finger3
        self.finger_command_pub.publish(self.finger_pos_goal)
        
        while not rospy.get_param('exec_done'):
            rospy.sleep(0.1)

        rospy.set_param('exec_done', "false")
        obs = self.get_obs()
        obs_pub_msg = Float32MultiArray()
        obs_pub_msg.data.append(obs)
        self.obs_pub.publish(obs_pub_msg)

        ### Get this reward for RL training ###
        total_reward, info, done = self.get_reward()

        ### Get this reward for grasp classifier collection ###
        #total_reward, info, done = self.get_reward_DataCollection()
        return obs, total_reward, done, info 
    
    
    def go_to_goal(self):

        joint_state_goal = self.joint_angle1
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle2
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle3
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle4
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle5
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle6
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle7
        self.move_arm_joint_angle(joint_state_goal)
        
    def go_to_home(self):

        joint_state_goal = self.joint_angle7
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle6
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle5
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle4
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle3
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle2
        self.move_arm_joint_angle(joint_state_goal)
        joint_state_goal = self.joint_angle1
        self.move_arm_joint_angle(joint_state_goal)

    def move_arm_joint_angle(self, joint_angle):
        self.joint_pos_goal = JointState()
        self.joint_pos_goal.position.append(joint_angle)
        
        self.joint_angle_command_pub.publish(self.joint_pos_goal)
        
        while not rospy.get_param('exec_done'):
            rospy.sleep(0.1)

        rospy.set_param('exec_done', "false")

    def reset(self):
        reset_command = 1
        self.reset.publish(reset_command)
        while not self.reset_done:
            rospy.sleep(0.1)

        self.reset_done = 0

        self.go_to_home()


    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed] 
    
    
    def joint_state_callback(self, msg):
        self.joint_states = msg
     

    def finger_state_callback(self, msg):
        self.finger_pos = msg
     

    def object_pose_callback(self, msg):
        self.object_pose = msg        
    
    
    def marker_id_callback(self, msg):
        self.object_id = msg
        
        
    def finger_dist_callback(self, msg):
        self.finger_dist_list = msg          
              
    def reset_check_callback(self, msg):
        self.reset_done = msg

     
    # Look at this function again 

    def finger_pose_callback(self, msg):
        self.finger_pose_list = msg
        a = list(self.finger_pose_list[0])
        b = list(self.finger_pose_list[1])
        c = [0,0,0]
        A = a - c
        B = a - b
        self.finger1_dist_ang = np.pi - np.acos((A[0]*B[0] + A[1]*B[1] + A[2]*B[2]) / (sqrt(A[0]*A[0] + A[1]*A[1] + A[2]*A[2]) * sqrt(B[0]*B[0] + B[1]*B[1] + B[2]*B[2]) ) )
        
        a = list(self.finger_pose_list[2])
        b = list(self.finger_pose_list[3])
        c = [0,0,0]
        A = a - c
        B = a - b
        self.finger2_dist_ang = np.pi - np.acos((A[0]*B[0] + A[1]*B[1] + A[2]*B[2]) / (sqrt(A[0]*A[0] + A[1]*A[1] + A[2]*A[2]) * sqrt(B[0]*B[0] + B[1]*B[1] + B[2]*B[2]) ) )
         

                
# class GraspValid_net(nn.Module):
#     def __init__(self, state_dim):
#         super(GraspValid_net, self).__init__()
#         self.l1 = nn.Linear(state_dim, 256)
#         self.l2 = nn.Linear(256, 256)
#         self.l3 = nn.Linear(256, 1)

#     def forward(self, state):
#         a = F.relu(self.l1(state))
#         a = F.relu(self.l2(a))
#         a =    torch.sigmoid(self.l3(a))
#         return a
