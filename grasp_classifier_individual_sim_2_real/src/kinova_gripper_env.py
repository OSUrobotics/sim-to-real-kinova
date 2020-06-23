#!/usr/bin/env python3

###############
# Author: Paresh
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import numpy as np
import math
import matplotlib.pyplot as plt
import time
import os, sys
from scipy.spatial.transform import Rotation as R
import random
import pickle
import pdb
import torch
import torch.nn as nn
import torch.nn.functional as F
import xml.etree.ElementTree as ET
from classifier_network import LinearNetwork, ReducedLinearNetwork
import re
from scipy.stats import triang

import rospy
from sensor_msgs.msg import JointState
from kinova_msgs.msg import FingerPosition, KinovaPose
from geometry_msgs.msg import PoseStamped

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

class KinovaGripper_Env:
    def init():
        self.joint_states = JointState()
        self.finger_pos = FingerPosition()
        self.reward = 0
        self.object_pose = KinovaPose()
        self.Grasp_Reward = False
        self.wrist_pose=np.zeros(3)  # The wrist position in world coordinates. Since we using local co-ordinate it is 0 
        
        ###Grasp Classifier###
        self.Grasp_net = LinearNetwork().to(device)
        trained_model = "path to model"
        model = torch.load(trained_model)
        self.Grasp_net.load_state_dict(model)
        self.Grasp_net.eval()
        
        ###Subscribers###
        self.joint_state_sub = rospy.Subscriber('/j2s7s300_driver/out/joint_state', JointState, joint_state_callback, queue_size=1)
        self.finger_sub = rospy.Subscriber('/j2s7s300_driver/out/finger_position', FingerPosition, finger_state_callback, queue_size=1)
        self.object_pose_sub = rospy.Subscriber('Object pose topic', KinovaPose, object_pose_callback, queue_size=1)
        
        ###Publisher###
        self.finger_command_pub = rospy.Publisher('/sim2real/finger_command', FingerPosition, queue_size=1)
        self.joint_angle_command_pub = rospy.Publisher('/sim2real/joint_angle_command', JointState, joint_angle_client, queue_size=1)
        
        
    ### Finger Position in Radians ###
    def get_joint_states(self): 
        temp = list(self.joint_states.position)     
        finger_joint_state_value = [0, 0, 0]
        finger_joint_state_value[0] = temp[7]
        finger_joint_state_value[1] = temp[8]
        finger_joint_state_value[2] = temp[9]
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
        obj_target = 0.2
        obs = self.get_obs() 

        lift = rospy.get_param('lift')
        if lift:
            lift_reward = 1
            done = True
        elif obs[5]>obj_target+0.05:
            lift_reward=0.0
            done=True
        else:
            lift_reward = 0
            done = False        
        return lift_reward, {}, done
    
    
    # Function to get rewards for RL training
    def get_reward(self):                    
        # object height target
        obj_target = 0.2

        # Grasp reward
        grasp_reward = 0.0 
        obs = self.get_obs() 
        lift = rospy.get_param('lift')
        
        network_inputs=obs
        inputs = torch.FloatTensor(np.array(network_inputs)).to(device)
        outputs = self.Grasp_net(inputs).cpu().data.numpy().flatten()
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
        finger_reward = 1#-np.sum((np.array(obs[41:47])) + (np.array(obs[35:41]))) #Talk to Anjali
        reward = 0.2*finger_reward + lift_reward + grasp_reward
        
        return grasp_reward, {}, done    
    
    
    # Function to get the dimensions of the object
    def get_obj_size(self):
        return [rospy.get_param('Object_size/x'), rospy.get_param('Object_size/y'), rospy.get_param('Object_size/z')]


    # Function to get the distance between the digits on the fingers and the object center
    def get_finger_obj_dist(self): #TODO:Center of finger to Object center distance 
        finger_joints = ["f1_prox", "f2_prox", "f3_prox", "f1_dist", "f2_dist", "f3_dist"]

        obj = self.get_obj_pose()
        dists = []
        ##TODO: Change this to exact fingers postion represenation 
        for i in finger_joints:
            pos = [0, 0, 0]#Pose Topic 
            dist = np.absolute(pos[0:2] - obj[0:2])
            temp = np.linalg.norm(dist)
            dists.append(temp)
        return dists
   
    
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
    ##TODO: Get accurate values w.r.t Wrist
    def get_finger_pos(self):
        num_fing = 3
        cordinate_axis = 3
        finger_pos = []
        for i in range(num_fing):
            for j in range(cordinate_axis):
                finger_pos.append(0)
        return finger_pos
    
    
        #Function to step the hardware forward in time
    def step(self, action):
        total_reward = 0
        self.finger_pos_goal = FingerPosition()
        self.finger_pos_goal.finger1 = action[0]
        self.finger_pos_goal.finger2 = action[1]
        self.finger_pos_goal.finger3 = action[2]
        self.finger_command_pub.publish(self.finger_pos_goal)
        
        while not rospy.get_param('exec_done'):
            rospy.sleep(0.1)
        
        obs = self.get_obs()
        
        ### Get this reward for RL training ###
        total_reward, info, done = self.get_reward()

        ### Get this reward for grasp classifier collection ###
        #total_reward, info, done = self.get_reward_DataCollection()
        return obs, total_reward, done, info 
    
    
    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed] 
    
    
    def joint_state_callback(self, msg):
        self.joint_states = msg
     

    def finger_state_callback(self, msg):
        self.finger_pos = msg
     

    def object_pose_callback(self, msg):
        self.object_pose = msg        
            
                
class GraspValid_net(nn.Module):
    def __init__(self, state_dim):
        super(GraspValid_net, self).__init__()
        self.l1 = nn.Linear(state_dim, 256)
        self.l2 = nn.Linear(256, 256)
        self.l3 = nn.Linear(256, 1)

    def forward(self, state):
        # pdb.set_trace()
        a = F.relu(self.l1(state))
        a = F.relu(self.l2(a))
        a =    torch.sigmoid(self.l3(a))
        return a
