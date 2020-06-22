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

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")


class KinovaGripper_Env:
    def init():
        
        
        
    def get_joint_states(self):
        
        return arr # it is a list
            
    
    #def get_obj_pose(self):
    #    arr = self._sim.data.get_geom_xpos("object")
    #    return arr    
    
    # Function to return the angles between the palm normal and the object location
    #def get_angles(self):
    #
    #    return x_angle,z_angle    
    
    
    # Function to get rewards based only on the lift reward. This is primarily used to generate data for the grasp classifier
    def get_reward_DataCollection(self):
    
        return lift_reward, {}, done    
    
    # Function to get rewards for RL training
    def get_reward(self):

        return reward, {}, done    
    
    
    # Function to get the dimensions of the object
    def get_obj_size(self):

        return size


    # Function to place the object at a random position near the hand with a probability density designed to create more difficult grasps
    def randomize_initial_pose(self, collect_data, size, shape):  #This will get fixed by Stephanie

        return rand_x, rand_y
    
    
    # Function to return global or local transformation matrix
    def _get_obs(self, state_rep=None):
    
        return fingers_6D_pose
            
    
    # Function to run all the experiments for RL training
    def experiment(self, exp_num, stage_num):
    
        return objects


    def randomize_all(self): #Stephanie has a new version, will merge


        return x, y, z

    #Function to randomize the position of the object for grasp classifier data collection
    def randomize_initial_pos_data_collection(self):

        return rand_x, rand_y, z    
   
   
    #Function to reset the simulator
    def reset(self,start_pos=None,obj_params=None):
    
        return states    
    
    
    def seed(self, seed=None):
        self.np_random, seed = seeding.np_random(seed)
        return [seed]


    #Function to step the hardware forward in time
    def step(self, action):
    
        return obs, total_reward, done, info    
    
    
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
