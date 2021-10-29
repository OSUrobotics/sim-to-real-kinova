#!/usr/bin/env python2

'''
Author(s): Yi Herng Ong
Purpose: Use MoveIt interface to plan paths for Kinova Jaco arm for executing new pose hallucination benchmark 
Date: June 2019

HOW THE FUCK DID HE GET THIS TO WORK ON PYTHON3
'''

import rospy
import moveit_commander
import sys, os
import moveit_msgs.msg
# from moveit_msgs.msg import PickupAction, PickupGoal, PlaceAction, PlaceGoal
import tf.transformations
# import std_msgs.msg
import geometry_msgs.msg
import pdb
import tf, math
from sensor_msgs.msg import JointState
import time
from std_msgs.msg import String
from std_msgs.msg import Bool
import random
import numpy as np
from geometry_msgs.msg import PoseStamped
from moveit_msgs.msg import PlanningScene, PlanningSceneComponents, AllowedCollisionEntry, AllowedCollisionMatrix
from moveit_msgs.srv import GetPlanningScene, ApplyPlanningScene
#from ppb_Benchmark import *
import serial
import time
#from qrtestRGB import main_f
import subprocess
import roslib; roslib.load_manifest('kinova_demo')
import rospy

import actionlib
import kinova_msgs.msg
from kinova_msgs.msg import FingerPosition
import matplotlib.pyplot as plt
# base pose : position [0.6972, 0, 0.8] orientation [0, 90, 0]
# vary poses based on the base pose. 
#output.goal=FingerPosition()
#output.goal_id=actionlib.msg.actionlib_msgs.msg._GoalID()
class robot(object):
    def __init__(self, robot_name):
        # Initialize Moveit interface
        moveit_commander.roscpp_initialize(sys.argv)
        if robot_name == "kinova":
            rospy.init_node("kinova_move_group", anonymous=True)
            self.hold=time.time()
            self.pub = rospy.Publisher("/route_finish", Bool,queue_size=1)
            self.pub2 = rospy.Publisher("/test_finish",Bool,queue_size=1)
            self.finger_action_status = rospy.Subscriber('/j2s7s300_driver/fingers_action/finger_positions/result',kinova_msgs.msg.SetFingersPositionActionResult,self.finger_action_status_sub)
            self.finger_pub = rospy.Publisher("/j2s7s300_driver/fingers_action/finger_positions/goal",kinova_msgs.msg.SetFingersPositionActionGoal,queue_size=1)
            self.open_close = rospy.Subscriber('/hand_control',String,self.hand_control)
            self.command_sub=rospy.Subscriber('/sim2real/joint_angle_command',JointState, self.joint_angle_client, queue_size=1)
            # self.filename = rospy.get_param("~filename")
            self.robot = moveit_commander.RobotCommander()
            self.scene = moveit_commander.PlanningSceneInterface()
            self.group = moveit_commander.MoveGroupCommander("arm")
            self.group.set_planning_time(10)
            self.gripper = moveit_commander.MoveGroupCommander("gripper")
            rospy.set_param('/move_group/trajectory_execution/allowed_start_tolerance', 0.0)
            rospy.wait_for_service("/apply_planning_scene", 10.0)
            rospy.wait_for_service("/get_planning_scene", 10.0)
            self.aps = rospy.ServiceProxy('/apply_planning_scene', ApplyPlanningScene)
            self.gps = rospy.ServiceProxy('/get_planning_scene', GetPlanningScene)
            rospy.sleep(2)
            self.disp_traj = moveit_msgs.msg.DisplayTrajectory()
            self.disp_traj.trajectory_start = self.robot.get_current_state()
            self.arm_joints_sub = rospy.Subscriber("/j2s7s300_driver/out/joint_state", JointState, self.get_arm_joints,tcp_nodelay=True)
            self.arm_joint_states = []
            self.prev_arm_js = []
            self.arm_traj = []
            # self.random_pose = [0.6972,0,0.82,0,90,0] 
            self.rate = rospy.Rate(10)    
            self.traj_pos = []
            self.traj_vel = []
            self.traj_time = []
            self.group.allow_replanning(1)
            self.route=[]
            self.hand='n'
            self.finger_pose=[0,0,0]
            self.count=0
            self.updated_position=False
            self.all_poses=[]
            self.all_times=[]
            self.all_goals=[]
            self.time=0
            self.ready_for_action=True
            self.fingers=[0,0,0]
            self.next_output=kinova_msgs.msg.SetFingersPositionActionGoal()
            # self.pubPlanningScene = rospy.Publisher("planning_scene" PlanningScene)
            # rospy.wait_for_service("/get_planning_scene", 10.0)
            # get_planning_scene = rospy.ServiceProxy('/get_planning_scene', GetPlanningScene)
            # request = PlanningSceneComponents(components=PlanningSceneComponents.ALLOWED_COLLISION_MATRIX)
            # response = get_planning_scene(request)

    def finger_action_status_sub(self,msg):
        status=msg.status.status
        #print (msg.status.goal_id.id, status,msg.result.fingers.finger1,msg.result.fingers.finger2,msg.result.fingers.finger3)
        if (status in [3,4,5,8,9]):# & (msg.status.goal_id.id == self.id):
            self.ready_for_action=True
        else:
            self.ready_for_action=False
        if np.average(np.array(self.fingers)-np.array([msg.result.fingers.finger1,msg.result.fingers.finger2,msg.result.fingers.finger3]))/np.average([msg.result.fingers.finger1,msg.result.fingers.finger2,msg.result.fingers.finger3])>0.5:
            print ('massive step noticed, likely failure. Consider redoing this test?')
        
    def allow_collision(self):
        # self.pubPlanningScene = rospy.Publisher("planning_scene", PlanningScene)
        ps = PlanningScene()
        psc = PlanningSceneComponents()
        acm = AllowedCollisionMatrix()
        ace = AllowedCollisionEntry()
        is_allow = Bool()
        is_allow.data = False
        ace.enabled = [False]
        # get scene components 
        # psc.ALLOWED_COLLISION_MATRIX
        getScene = self.gps(psc) # make it empty for now
        # ps = getScene
        ps.allowed_collision_matrix.entry_names = ["cube"]
        ps.allowed_collision_matrix.entry_values = [ace]
        ps.allowed_collision_matrix.default_entry_names = ["cube"]
        ps.allowed_collision_matrix.default_entry_values = [1]
        ps.is_diff = 1
        # print "gripper name", self.gripper
        applyScene = self.aps(ps)
        print (ps)
    def hand_control(self,msg):
        print ('message contents',msg)
        if 'c' in msg.data:
            print ('closing')
            self.hand='c'
        elif 'o' in msg.data:
            print ('opening')
            self.hand='o'
        elif '1' in msg.data:
            print ('closing 1 finger')
            self.hand='1'
        elif '2' in msg.data:
            print ('closing 2 fingers')
            self.hand='2'

    def get_arm_joints(self, msg):
        #print (msg)
        #print ('received messege at',time.time())
        if time.time()-self.time>0.08:
            self.time=time.time()
            self.arm_joint_states = msg.position
            if len(self.prev_arm_js) > 0 and max(np.absolute(np.array(self.arm_joint_states) - np.array(self.prev_arm_js))) > 0.01:
                self.arm_traj.append(self.arm_joint_states)
            self.prev_arm_js = self.arm_joint_states
            self.finger_pose=msg.position[-6:-3]
            self.updated_position=True
        

    def planner_type(self, planner_type):
        if planner_type == "RRT":
            self.group.set_planner_id("RRTConnectkConfigDefault")
        if planner_type == "RRT*":
            self.group.set_planner_id("RRTstarkConfigDefault")
        if planner_type == "PRM*":
            self.group.set_planner_id("PRMstarkConfigDefault")

    def move_to_Goal(self,ee_pose):
        # if ee_pose == "home":
        #     pose_goal == ee_pose
        # else:
        pose_goal = geometry_msgs.msg.Pose()
        pose_goal.position.x = ee_pose[0]
        pose_goal.position.y = ee_pose[1]
        pose_goal.position.z = ee_pose[2]
        if len(ee_pose) == 6:
            quat = tf.transformations.quaternion_from_euler(math.radians(ee_pose[3]), math.radians(ee_pose[4]), math.radians(ee_pose[5]))
            pose_goal.orientation.x = quat[0]
            pose_goal.orientation.y = quat[1]
            pose_goal.orientation.z = quat[2]
            pose_goal.orientation.w = quat[3]

        else:
            pose_goal.orientation.x = ee_pose[3]
            pose_goal.orientation.y = ee_pose[4]
            pose_goal.orientation.z = ee_pose[5]
            pose_goal.orientation.w = ee_pose[6]    

        self.group.set_pose_target(pose_goal)
        self.group.set_planning_time(20)
        self.plan = self.group.plan()
        rospy.sleep(2)
        self.group.go(wait=True)
        # self.group.execute(self.plan, wait=True)
        self.group.stop()
        self.group.clear_pose_targets()
        rospy.sleep(2)

    def move_finger(self, cmd):
        #cmd is a list of length 4. first index is the lift, either 0 or 1, next three are finger actions, 0-1

        # this code below is nigels joint velocity stuff

        output=kinova_msgs.msg.SetFingersPositionActionGoal()
        #finger_range=[6,7000]
        output.header.seq=self.count
        self.count +=1
        #output.header.stamp=time.time()
        #output.goal_id.stamp=time.time()
        output.goal_id.id='/j2s7s300_gripper_command_action_server-'+str(self.count)+'-'+str(time.time())
        
        while (not(self.updated_position)) | (not(self.ready_for_action)):
            time.sleep(0.01)

        # # 7000 => fully closed/ LERP b/w 1.44
        # # 500 => radians speed
        # # cmd => the desired joint velocities
        # #
        # output.goal.fingers.finger1=max(self.finger_pose[0]*7000/1.44+cmd[1]*500,0)
        # output.goal.fingers.finger2=max(self.finger_pose[1]*7000/1.44+cmd[2]*500,0)
        # output.goal.fingers.finger3=max(self.finger_pose[2]*7000/1.44+cmd[3]*500,0)
        # self.next_output=output
        # self.fingers=[output.goal.fingers.finger1,output.goal.fingers.finger2,output.goal.fingers.finger3]
        # self.all_goals.append([output.goal.fingers.finger1,output.goal.fingers.finger2,output.goal.fingers.finger3])
        # self.all_poses.append(self.finger_pose)
        # self.all_times.append(time.time())


        if cmd == "Close":
            print('is the gripper actually closing???')
            # self.gripper.set_named_target("Close")
            self.gripper.set_joint_value_target([1.1, 1.1, 1.1])
            self.gripper_plan = self.gripper.plan()
            # self.gripper.go(wait=True)
        elif cmd == "Open":
            self.gripper.set_named_target("Open")
        elif cmd =="1Finger":
            self.gripper.set_joint_value_target([0.2,0.2,1])
        elif cmd =="2Finger":
            self.gripper.set_joint_value_target([1,1,0.2])
        else:
            self.gripper.set_joint_value_target(cmd)

        print("here goes...")
        self.gripper.go(wait=True)
        rospy.sleep(2)
        '''
        #print ('sent command',output.goal_id.id,output.goal.fingers.finger1,output.goal.fingers.finger2,output.goal.fingers.finger3)
        self.finger_pub.publish(output)
        self.updated_position=False
        self.ready_for_action=False
        rospy.sleep(0.03)
        '''

    def display_Trajectory(self):
        self.disp_traj_publisher = rospy.Publisher("/move_group/display_planned_path", moveit_msgs.msg.DisplayTrajectory, queue_size=20)
        self.disp_traj.trajectory.append(self.plan)
        #print (self.disp_traj.trajectory)
        self.disp_traj_publisher.publish(self.disp_traj)

    def move_to_Joint(self, joint_states):
        joint_goal = JointState()
        joint_goal.position = joint_states
        #print ('joint goal, should be jointstate with positions values',joint_goal)
        self.group.set_joint_value_target(joint_goal.position)
        self.plan = self.group.plan()
        self.group.go(wait=True)

        print("executing da plan.... move_to_joint")
        print(joint_states)
        # print(self.plan)

        # self.group.execute(self.plan[1], wait=True)
        self.group.execute(self.plan, wait=True)

        self.group.stop()
        self.group.clear_pose_targets()
        rospy.sleep(2)

    def move_to_waypoint(self, p1, pose_or_goal): # THIS DOESN'T GET USED BRUH
        # from current move to p1
        # print "current pose", self.group.get_current_pose()
        if pose_or_goal == "goal":
            self.move_to_Goal(p1)
        else:
            self.move_to_Joint(p1)
        # print "traj points", self.plan.joint_trajectory.points
        if self.plan.joint_trajectory.points == []:
            print ("No path found at this set of start and goal")
            return None
        # save traj
        else:
            # print self.plan.joint_trajectory.points
            for a in range(len(self.plan.joint_trajectory.points)):
                temp = self.plan.joint_trajectory.points[a].positions
                temp_vel = self.plan.joint_trajectory.points[a].velocities
                time_step = self.plan.joint_trajectory.points[a].time_from_start
                # print temp
                self.traj_pos.append(temp)
                self.traj_vel.append(temp_vel)
                self.traj_time.append(time_step)
            # return traj1

    def output_trajfile(self,traj, filename):
        csvfile = filename + ".csv"
        file = open(csvfile,"wb")
        for j in traj:
            try:
                joint_state = j[:]
                for k in joint_state:
                    file.write(str(k))
                    file.write(',')
                file.write('\n')
            except:
                joint_state = j
                file.write(str(j))
                file.write('\n')

    def get_Object(self, sizes, poses, shape):
        box_pose = PoseStamped()
        box_pose.header.frame_id = self.robot.get_planning_frame()
        box_pose.pose.position.x = poses[0]
        box_pose.pose.position.y = poses[1]
        box_pose.pose.position.z = poses[2]
        box_pose.pose.orientation.w = poses[3]
        box_name = shape
        self.scene.add_box(box_name, box_pose, size=(sizes[0], sizes[1], sizes[2]))

    def get_Robot_EEposemsg(self):
        return self.group.get_current_pose()

    def get_Robot_EErpy(self):
        return self.group.get_current_rpy()

    def get_Robot_EE6Dpose(self):
        xyz = [self.get_Robot_EEposemsg().pose.position.x, self.get_Robot_EEposemsg().pose.position.y, self.get_Robot_EEposemsg().pose.position.z]
        rpy = self.get_Robot_EErpy()

        return xyz + rpy 

    def joint_angle_client(self,msg):
        print ('message received')
        self.route.append(list(msg.position))
        self.hold=time.time()
    
def get_random_translation():
    translation = ['x', 'y', 'z']
    import random
    return random.choice(translation)


def readfile(filename):
    import csv
    all_Poses = []
    with open(filename) as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=',')
        for row in csv_reader:
            temp = row
            pose = []
            for each in temp:
                try:
                    pose.append(float(each))
                except:
                    pass
            all_Poses.append(pose)    

    return all_Poses # make sure all poses are float 

def find_pose(poses, target_pose):
    print ("Find target_pose index...", target_pose)
    index = None
    n_poses = np.array(poses)
    tar_pose = np.array(target_pose) 
    for pose in n_poses:
        if np.max(abs(tar_pose[0:6] - pose[0:6])) < 0.00001:
            index = poses.index(list(pose))
            # print index
            return index    
        # else:
        #     print index
    return index
            
def benchmark_feature_2():
    # ser = serial.Serial('/dev/ttyACM2')

    # Set initial pose and base pose
    initial_pose = [0.02, -0.58, 0.015, 90, 180, 0] # about 10 cm away from object, treat it as home pose for the benchmark
    lift_pose = [-0.24, -0.8325, 0.30, 90, 180, 0] # lifting object
    # base_pose = [0.03, (-0.54-0.104), 0.01, 90, 180, 0] # make it closer to object

    # Get pose extremes and increments based on object size and type

    # Hand geometry
    hand_width = 0.175
    hand_height = 0.08
    hand_depth = 0.08
    table_to_hand_distance = 0.0254 # the height of the gripper

    # small retangular block (can apply on other small objects as well)
    obj_width = 0.0656
    obj_depth = 0.0656
    obj_height = 0.04375 + table_to_hand_distance
    trans_inc = 0.02
    orien_inc = 15

    ppB = ppBenchmark(hand_width, hand_depth, hand_height, table_to_hand_distance, obj_width, obj_depth, obj_height, trans_inc, orien_inc, initial_pose)
    ppB.get_X_limits()
    ppB.get_Y_limits()
    ppB.get_Z_limits()
    ppB.get_R_limits()
    ppB.get_P_limits()
    ppB.get_W_limits()
    ppB.sampling_limits()
    # ppB.save_poses_into_csv("kg_s_cyl", ppB.all_all_poses)
    limits = ppB.get_actual_limits()
    ranges = ppB.get_actual_ranges()

    Robot = robot('kinova')
    Robot.scene.remove_world_object()
    # Set planner type
    Robot.planner_type("RRT")
    Robot.get_Object([0.13125, 0.10125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube
    Robot.get_Object([0.02, 0.49, 0.50], [-0.38, -0.49, (-0.05 + 0.25 + 0.01), 1.0], "wall") # wall
    rospy.sleep(2)
    Robot.move_to_Goal(initial_pose)


    start = time.time()
    print ("RUNNING BENCHMARK FEATURE 2, NOW TEST THE UNDONE POSES FROM BEGINNING...")
    # read_poses = readfile("kg_s_rectblock_2.csv") # read latest updated file
    while True:
        read_poses = readfile("kg_b_block_1.csv")

        for i in range(len(read_poses)):
            # if read_poses[i][-1] == 0: # undone pose
            if read_poses[i][-1] == 0: # undone pose
                pose = read_poses[i][0:6]
                print ("current testing pose: ", pose)
                rospy.sleep(3)
                Robot.scene.remove_world_object()
                rospy.sleep(3)

                # # Set to RRT star
                Robot.planner_type("RRT*")
                rospy.sleep(3)

                # Move to the extreme
                Robot.move_to_Goal(pose)
                rospy.sleep(3)

                # Move closer to object
                closer_pose = pose[:]
                closer_pose[1] -= 0.054
                Robot.move_to_Goal(closer_pose)
                rospy.sleep(3)

                print ("Start recording")
                pose_index = find_pose(read_poses, pose)
                print ("Pose index: ", pose_index)
                if pose_index != i:
                    raise ValueError

                cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_large_rectangleblock/kg_brect_p{}_camera.bag /camera/color/image_raw __name:=alpha_camera &".format(pose_index)
                record = os.system(cmd)
                cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_large_rectangleblock/kg_brect_p{}_joints.bag /j2s7s300_driver/out/joint_state __name:=alpha_joints &".format(pose_index)
                record = os.system(cmd)


                # Grasp
                Robot.move_finger("Close")
                rospy.sleep(5)

                # Stop record
                print ("Stop recording")
                # record_data.terminate()
                kill_node = os.system("rosnode kill /alpha_camera")
                kill_node = os.system("rosnode kill /alpha_joints")

                # Lift
                # lift_pose = pose[:]
                # lift_pose[2] = 0.3 
                Robot.move_to_Goal(lift_pose)
                rospy.sleep(3)

                # Check if grasp succeeds
                # Camera code goes in here
                '''
                print ("Detecting grasp...")
                if main_f() == "yes":
                    # grasp suceed
                    print ("grasp success")
                    # print "find the next harder / outer pose"
                    # pose += ["s"]
                    success_pose_index = find_pose(read_poses, pose)
                    if success_pose_index == None:
                        raise ValueError 
                    print ("success_pose_index found: ", success_pose_index)
                    read_poses[success_pose_index][-1] = 1
                    ppB.save_poses_into_csv("kg_b_block_1", read_poses)
                else:
                    # grasp failed
                    print ("grasp fails")
                    # print "find the next easier / inner pose"
                    # pose += ["f"]
                    fail_pose_index = find_pose(read_poses, pose) # find pose position in the file
                    if fail_pose_index == None:
                        raise ValueError 
                    print ("fail_pose_index found: ", fail_pose_index)
                    read_poses[fail_pose_index][-1] = -1 # mark middle 
                    ppB.save_poses_into_csv("kg_b_block_1", read_poses)
                '''

                # Open grasp
                Robot.move_finger("Open")
                rospy.sleep(3)


                # Reset object
                print ("Resetting object...")
                # ser.write('r')

                rospy.sleep(3)
                print ("Move back to home pose")
                # Move back to home pose 
                Robot.get_Object([0.13125, 0.10125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube
                Robot.get_Object([0.02, 0.49, 0.50], [-0.38, -0.49, (-0.05 + 0.25 + 0.01), 1.0], "wall") # wall
                rospy.sleep(3)
                Robot.planner_type("RRT")
                rospy.sleep(3)
                Robot.move_to_Goal(initial_pose)    

                # reset ping 
                # ser.write('p')
                # while 1:
                #     tdata = ser.read() # Wait forever for anything
                #     print tdata 
                #     if tdata =='d':
                #         print 'yes'
                #         break 
                #     time.sleep(1)              # Sleep (or inWaiting() doesn't give the correct value)
                #     data_left = ser.inWaiting()  # Get the number of characters ready to be read
                #     tdata += ser.read(data_left)

                # break
        if i == len(read_poses) -1:
            print ("Done")
            break    
    print ("total time used: ", time.time() - start)
    # Robot.planner_type("RRT*")
    # Robot.move_to_Goal([0.07, -0.644, 0.01, 90, 180, 0]) # move close the object

def check_pose_f_or_s(poses, target_pose):
    n_poses = np.array(poses)
    tar_pose = np.array(target_pose) 
    f_or_s = None    
    index = None
    for pose in n_poses:
        # print tar_pose, pose[0:6]
        if np.max(abs(tar_pose[0:6] - pose[0:6])) < 0.00001:
            # print pose
            f_or_s = pose[-1] 
            # print "Read from doc: ", f_or_s 
            return f_or_s
    return f_or_s

def find_range_index(ranges, pose):
    index = None
    for r in ranges:
        if abs(r - pose) < 0.00001:
            index = ranges.index(r) 
            return index

    return index

def find_target_index(read_poses, target_pose, chosen_axis):
    index = None
    for pose in read_poses:
        if abs(pose[chosen_axis] - target_pose) < 0.00001:
            index = read_poses.index(pose)
            return index
    return index


def main():
    ############################### BENCHMARK PIPELINE ######################################
    # Open reset port
    # ser = serial.Serial('/dev/ttyACM2')
    print ('i hope this isnt getting called')
    # Set initial pose and base pose
    initial_pose = [0.02, -0.58, 0.015, 90, 180, 0] # about 10 cm away from object, treat it as home pose for the benchmark
    lift_pose = [-0.24, -0.8325, 0.30, 90, 180, 0] # lifting object
    # base_pose = [0.03, (-0.54-0.104), 0.01, 90, 180, 0] # make it closer to object

    # Get pose extremes and increments based on object size and type

    # Hand geometry
    hand_width = 0.175
    hand_height = 0.08
    hand_depth = 0.08
    # table_to_hand_distance = 0.0254 # the height of the gripper
    table_to_hand_distance = 0.04
    # small retangular block (can apply on other small objects as well)
    obj_width = 0.0656
    obj_depth = 0.0656
    obj_height = 0.24
    # obj_height = 0.18
    trans_inc = 0.02
    orien_inc = 15
    
    ppB = ppBenchmark(hand_width, hand_depth, hand_height, table_to_hand_distance, obj_width, obj_depth, obj_height, trans_inc, orien_inc, initial_pose)
    ppB.get_X_limits()
    ppB.get_Y_limits()
    ppB.get_Z_limits()
    ppB.get_R_limits()
    ppB.get_P_limits()
    ppB.get_W_limits()
    ppB.sampling_limits()
    # ppB.save_poses_into_csv("kg_b_cyl", ppB.all_all_poses)
    limits = ppB.get_actual_limits()
    ranges = ppB.get_actual_ranges()

    # Initialization
    Robot = robot("kinova")
    Robot.scene.remove_world_object()

    # Set planner type
    Robot.planner_type("RRT")
    Robot.get_Object([0.13125, 0.10125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube
    Robot.get_Object([0.02, 0.49, 0.50], [-0.38, -0.49, (-0.05 + 0.25 + 0.01), 1.0], "wall") # wall
    rospy.sleep(2)

    # Move to home pose of the benchmark
#    print "Pose variation computed, Robot is moving to initial pose..."
    Robot.move_to_Goal(initial_pose)
    
    axes = ["00","01","10","11","20","30","31","40","41","50","51"]
    total_axis_count = 0
    record_done_axis = []

    while True:
        if len(record_done_axis) == 11:
#            print "All axis limits are computed, DONE..."
            break
#        print "Number of completed axes: ", len(record_done_axis)

        # Randomly pick an axis. Conduct binary search
        ax = random.choice(axes)
        chosen_axis = int(ax[0])

        # chosen_axis = random.randint(0,5)
        chosen_axis_poses  = ppB.all_limits[chosen_axis][:]
        chosen_dir = int(ax[1])
        # if chosen_axis != 2:
        #     chosen_dir = random.randint(0,1) # 0 - min, 1 - max
        # else:
        #     chosen_dir = 0
#        print "Remaining axis and directions: ", axes
#        print "Conduct binary search"
        # !!!check if this direction has done!!!
        # Binary search
        if len(ranges[chosen_axis][chosen_dir]) % 2 == 1: # odd
            pose_arr = ranges[chosen_axis][chosen_dir]
            middle_pose = pose_arr[((len(ranges[chosen_axis][chosen_dir]) - 1) / 2)]
        else: # even
            pose_arr = ranges[chosen_axis][chosen_dir]
            middle_pose = pose_arr[len(ranges[chosen_axis][chosen_dir]) / 2]

        while_loop_check = True
        done_axis_dir = 0
        target_pose = middle_pose
        loop_again_flag = False
        while while_loop_check:
            # check if all axis limits are computed
            read_poses = readfile("kg_m_hglass_1.csv")

            for pose_count, pose in enumerate(chosen_axis_poses,1):
                if abs(pose[chosen_axis] - target_pose) < 0.00001:
                    # Check if done
#                    print "Target pose", target_pose, pose[chosen_axis]
#                    print "Current chosen limit: ", pose[chosen_axis], pose
                    # print "Pose match, looking for fail or success:", pose[-1] if (pose[-1] == 1) or (pose[-1] == -1) else "NOT DONE"

                    if check_pose_f_or_s(read_poses, pose) == -1: # fail grasp means inner pose will succeed
#                        print "Pose found was failed, looking for next inner pose"
                        range_index = find_range_index(ranges[chosen_axis][chosen_dir], target_pose)
                        if range_index == None:
#                            print "range index"
                            raise ValueError

                        if (range_index + 1) != len(ranges[chosen_axis][chosen_dir]):
                            r_f = ranges[chosen_axis][chosen_dir]
                            outer_failure_pose = r_f[range_index + 1] # set outer pose as failure
                            outer_fpose_index = find_target_index(read_poses, outer_failure_pose, chosen_axis)
                            if outer_fpose_index == None:
#                                print "outer_fpose_index"
                                raise ValueError
                            read_poses[outer_fpose_index][-1] = -1
                            ppB.save_poses_into_csv("kg_m_hglass_1", read_poses)

                        if (range_index - 1) >= 0:    
                            r = ranges[chosen_axis][chosen_dir]
                            target_pose = r[range_index - 1] # get inner pose
                            # check if inner pose is success
#                            print "next pose: ", target_pose
                            target_index = find_target_index(read_poses, target_pose, chosen_axis)
                            if target_index == None:
#                                print "target index"
                                raise ValueError
                            if read_poses[target_index][-1] == 1:
                                while_loop_check == False
                                done_axis_dir = 1
#                                print "This axis and dir is done"
                                break
                            else:
                                while_loop_check = True
                                loop_again_flag = True
#                                print "next pose found"
                                break                        
                        else:
                            while_loop_check = False
                            done_axis_dir = 1
#                            print "This axis and dir is done"
                            break
                    elif check_pose_f_or_s(read_poses, pose) == 1: # success grasp
#                        print "Pose found was success, looking for next outer pose"
                        # check if the pose is at the last of the list
                        range_index = find_range_index(ranges[chosen_axis][chosen_dir], target_pose)
                        if range_index == None:
                            raise ValueError            
                        if (range_index + 1) < len(ranges[chosen_axis][chosen_dir]):
                            r = ranges[chosen_axis][chosen_dir]
                            target_pose = r[range_index + 1] # get outer pose
                            # check if outer pose is fail
                            target_index = find_target_index(read_poses, target_pose, chosen_axis)
                            if target_index == None:
#                                print "target index"
                                raise ValueError
                            if read_poses[target_index][-1] == -1:
                                while_loop_check == False
                                done_axis_dir = 1
#                                print "This axis and dir is done"
                                break
                            else:                            
                                while_loop_check = True
                                loop_again_flag = True
#                                print "next pose found"
                                break
                        else:
                            while_loop_check = False
                            done_axis_dir = 1 
#                            print "This axis and dir is done"
                            break

                    elif check_pose_f_or_s(read_poses, pose) == 0: # if not tested, NOT DONE
#                        print "Pose found has not been tested. Running..."
                        rospy.sleep(3)
                        Robot.scene.remove_world_object()
                        rospy.sleep(2)

                        # Set to RRT star
                        Robot.planner_type("RRT*")
                        rospy.sleep(3)

                        # Move to the extreme
#                        print "Move to the chosen limit pose"
                        Robot.move_to_Goal(pose[0:6])

                        # Move closer to object
#                        print "Approaching..."
                        closer_pose = pose[0:6][:]
                        closer_pose[1] -= 0.044
#                        print "closer pose", closer_pose
                        rospy.sleep(3)
                        Robot.move_to_Goal(closer_pose)
                        rospy.sleep(3)


                        # Start recording
#                        print "Start recording..."
                        # get pose index 
                        pose_index = find_pose(read_poses, pose)
#                        print "Pose index: ", pose_index
                        # record_data = subprocess.Popen(["rosbag", "record", "--output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_sblock_a{}_d{}.bag".format(chosen_axis,chosen_dir), "/camera/color/image_raw", "/j2s7s300_driver/out/joint_state"])
                        cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_medium_hourglass/kg_mhglass_p{}_camera.bag /camera/color/image_raw __name:=alpha_camera &".format(pose_index)
                        record = os.system(cmd)
                        cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_medium_hourglass/kg_mhglass_p{}_joints.bag /j2s7s300_driver/out/joint_state __name:=alpha_joints &".format(pose_index)
                        record = os.system(cmd)

                        rospy.sleep(5)
                        # Grasp
#                        print "Grasping..."    
                        Robot.move_finger("Close")

                        rospy.sleep(5)
                        # Stop record
#                        print "Stop recording"
                        # record_data.terminate()
                        kill_node = os.system("rosnode kill /alpha_camera")
                        kill_node = os.system("rosnode kill /alpha_joints")

                        # Lift
#                        print "Lifting..."
                        rospy.sleep(3)
                        Robot.move_to_Goal(lift_pose)

                        # Check if grasp succeeds
                        # Camera code goes in here
#                        print "Detecting grasp..."
                        '''
                        if main_f() == "yes":
                            # grasp suceed
#                            print "grasp success"
                            # print "find the next harder / outer pose"
                            # pose += ["s"]
                            success_pose_index = find_pose(read_poses, pose)
                            if success_pose_index == None:
#                                print "Success_pose_index not found"
                                raise ValueError 
#                            print "success_pose_index found: ", success_pose_index
                            read_poses[success_pose_index][-1] = 1
                            ppB.save_poses_into_csv("kg_m_hglass_1", read_poses)
                        else:
                            # grasp failed
#                            print "grasp fails"
                            # print "find the next easier / inner pose"
                            # pose += ["f"]
                            fail_pose_index = find_pose(read_poses, pose) # find pose position in the file
                            if fail_pose_index == None:
#                                print "Fail_pose_index not found"
                                raise ValueError 
#                            print "fail_pose_index found: ", fail_pose_index
                            read_poses[fail_pose_index][-1] = -1
                            ppB.save_poses_into_csv("kg_m_hglass_1", read_poses)
                        '''
                        # Open grasp
#                        print "Open grasp"
                        Robot.move_finger("Open")
                        rospy.sleep(3)


                        # Reset object
#                        print "Resetting object..."
                        # ser.write('r')
                        # while 1:
                        #     tdata = ser.read() # Wait forever for anything
                        #     print tdata 
                        #     if tdata =='d':
                        #         print 'yes'
                        #         break 
                        #     time.sleep(1)              # Sleep (or inWaiting() doesn't give the correct value)
                        #     data_left = ser.inWaiting()  # Get the number of characters ready to be read
                        #     tdata += ser.read(data_left)

                        # Move back to home pose 
#                        print "Done resetting, move to home pose..."
                        Robot.get_Object([0.13125, 0.10125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube for planning
                        Robot.get_Object([0.02, 0.49, 0.60], [-0.38, -0.49, (-0.05 + 0.30 + 0.01), 1.0], "wall") # wall
                        rospy.sleep(3)
                        Robot.planner_type("RRT")
                        rospy.sleep(3)
                        Robot.move_to_Goal(initial_pose)    

                        # reset ping 
                        # ser.write('p')
                        # while 1:
                        #     tdata = ser.read() # Wait forever for anything
                        #     print tdata 
                        #     if tdata =='d':
                        #         print 'yes'
                        #         break 
                        #     time.sleep(1)              # Sleep (or inWaiting() doesn't give the correct value)
                        #     data_left = ser.inWaiting()  # Get the number of characters ready to be read
                        #     tdata += ser.read(data_left)
                        
                        while_loop_check = False
                        break

                    else:
#                        print "Not recorded whether the pose is done"
                        raise ValueError

            if done_axis_dir == 1:
                # print "One axis and direction done: {} axis in {} direction".format(chosen_axis, "min" if chosen_dir == 0 else "max")
                # code = str(chosen_axis) + str(chosen_dir)
                # total_axis_count += 1
                if ax not in record_done_axis:
#                    print "One axis and direction done: {} axis in {} direction".format(chosen_axis, "min" if chosen_dir == 0 else "max")
                    record_done_axis.append(ax)
                    axes.pop(axes.index(ax))
                    # total_axis_count += 1
                #else:
#                    print "{} axis in {} direction has done before, find next...".format(chosen_axis, "min" if chosen_dir == 0 else "max")

                done_axis_dir = 0
                while_loop_check =False

            if (pose_count == len(chosen_axis_poses)) and (loop_again_flag == False):
#                print "Pose count last"
                while_loop_check = False
            # else:
            #     while_loop_check = True
            #     loop_again_flag = False

#    print "ALL LIMITS ARE COMPUTED, NOW TEST THE UNDONE POSES..."
    # read_poses = readfile("kg_s_cyl.csv") # read latest updated file

    # benchmark_feature_2()

    # for i in range(len(read_poses)):
    #     if read_poses[i][-1] == 0: # undone pose
    #         pose = read_poses[i][:]/
    #         print "current testing pose: ", pose
    #         rospy.sleep(3)
    #         Robot.scene.remove_world_object()
    #         rospy.sleep(3)

    #         # # Set to RRT star
    #         Robot.planner_type("RRT*")
    #         rospy.sleep(3)

    #         # Move to the extreme
    #         Robot.move_to_Goal(pose)
    #         rospy.sleep(3)

    #         # Move closer to object
    #         closer_pose = pose[:]
    #         closer_pose[1] -= 0.054
    #         Robot.move_to_Goal(closer_pose)
    #         rospy.sleep(3)

    #         print "Start recording"
    #         pose_index = find_pose(read_poses, pose)
    #         print "Pose index: ", pose_index
    #         if pose_index != i:
    #             print "Not match!!! ", pose_index, i
    #             raise ValueError

    #         cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_small_cylinder/kg_scyl_p{}_camera.bag /camera/color/image_raw __name:=alpha_camera &".format(pose_index)
    #         record = os.system(cmd)
    #         cmd = "rosbag record --output-name=/media/yihernong/Samsung_T5/benchmark_data/kinova_small_cylinder/kg_scyl_p{}_joints.bag /j2s7s300_driver/out/joint_state __name:=alpha_joints &".format(pose_index)
    #         record = os.system(cmd)


    #         # Grasp
    #         Robot.move_finger("Close")
    #         rospy.sleep(5)

    #         # Stop record
    #         print "Stop recording"
    #         # record_data.terminate()
    #         kill_node = os.system("rosnode kill /alpha_camera")
    #         kill_node = os.system("rosnode kill /alpha_joints")

    #         # Lift
    #         # lift_pose = pose[:]
    #         # lift_pose[2] = 0.3 
    #         Robot.move_to_Goal(lift_pose)
    #         rospy.sleep(3)

    #         # Check if grasp succeeds
    #         # Camera code goes in here
    #         print "Detecting grasp..."
    #         if main_f() == "yes":
    #             # grasp suceed
    #             print "grasp success"
    #             # print "find the next harder / outer pose"
    #             # pose += ["s"]
    #             success_pose_index = find_pose(read_poses, pose)
    #             if success_pose_index == None:
    #                 print "Success_pose_index not found"
    #                 raise ValueError 
    #             print "success_pose_index found: ", success_pose_index
    #             read_poses[success_pose_index][-1] = 1
    #             ppB.save_poses_into_csv("kg_s_cyl", read_poses)
    #         else:
    #             # grasp failed
    #             print "grasp fails"
    #             # print "find the next easier / inner pose"
    #             # pose += ["f"]
    #             fail_pose_index = find_pose(read_poses, pose) # find pose position in the file
    #             if fail_pose_index == None:
    #                 print "Fail_pose_index not found"
    #                 raise ValueError 
    #             print "fail_pose_index found: ", fail_pose_index
    #             read_poses[fail_pose_index][-1] = -1 # mark middle 
    #             ppB.save_poses_into_csv("kg_s_cyl", read_poses)


    #         # Open grasp
    #         Robot.move_finger("Open")
    #         rospy.sleep(3)



    #         # Reset object
    #         ser.write('r')

    #         # Move back to home pose 
    #         Robot.get_Object([0.13125, 0.13125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube for planning
    #         Robot.get_Object([0.02, 0.49, 0.50], [-0.38, -0.49, (-0.05 + 0.25 + 0.01), 1.0], "wall") # wall
    #         rospy.sleep(3)
    #         Robot.planner_type("RRT")
    #         rospy.sleep(3)
    #         Robot.move_to_Goal(initial_pose)

    #         # reset ping 
    #         ser.write('p')
    #         while 1:
    #             tdata = ser.read() # Wait forever for anything
    #             print tdata 
    #             if tdata =='d':
    #                 print 'yes'
    #                 break 
    #             time.sleep(1)              # Sleep (or inWaiting() doesn't give the correct value)
    #             data_left = ser.inWaiting()  # Get the number of characters ready to be read
    #             tdata += ser.read(data_left)    
    ################################# BENCHMARK END ####################################
    # Compute all pose variations
    # ppB.sampling_all_Poses()

    # ppB.save_poses_into_csv("test_posefile")

        

    ######################### BLOCK TEST / DEMO ##############################
    # Initialization
    # Robot = robot("kinova")
    # Robot.scene.remove_world_object()

    # # Set planner type
    # Robot.planner_type("RRT")
    
    # # Read reset port

    # # Robot.move_to_Goal(initial_pose)
    # Robot.get_Object([0.13125, 0.13125, 0.93125], [0.0, -0.66, (-0.05 + 0.465625 + 0.01), 1.0], "cube") # get cube
    # rospy.sleep(2)
    # Robot.move_to_Goal(initial_pose) 
    # Robot.scene.remove_world_object()
    # rospy.sleep(2) # this 2 seconds is important for rrt* to work

    # Robot.planner_type("RRT*")
    # Robot.move_to_Goal(base_pose) # move close the object

    # Robot.move_finger("Close") # close grip

    # Robot.move_to_Goal(lift_pose)
    # grasp_status = main_f()
    # print grasp_status
    # Robot.move_finger("Open") # open grip, object will drop
    
    # time.sleep(3)



    # ser.write('r') # reset starts

    # # loop until reset is done
    # while 1:
    #     tdata = ser.read()           # Wait forever for anything
    #     print tdata 
    #     if tdata =='d':
    #         print 'yes'
    #         break 
    #     time.sleep(1)              # Sleep (or inWaiting() doesn't give the correct value)
    #     data_left = ser.inWaiting()  # Get the number of characters ready to be read
    #     tdata += ser.read(data_left)    
    
    #################################### END ######################################

    
def stripper(data):

    #get each piece in string
    p = list(str(data).split(" "))
    point_x = p[1]
    point_y = p[2]

    #get rid of bracket
    point_x = point_x.replace('"[', '')
    point_y = point_y.replace(']"', '')
    #get rid of comma
    point_x = float(point_x.replace(',', ''))
    point_y = float(point_y.replace(',', ''))

    grab_point = [point_x, point_y]

    return grab_point

def pickerupper(grab_point, arm_error_x):

    print (grab_point[0] + arm_error_x)
    #Robot.move_finger("Close")
    # #if len(grab_point) > 0 and len(go_to_point) > 0:
    # 
    # 
    Robot.move_finger("Open")
    #go to first waypoint
    Robot.move_to_Goal([grab_point[0] + arm_error_x,(grab_point[1] - 0.2),0.2,90,165,180])
    time.sleep(0.5)
    #lower self
    Robot.move_to_Goal([grab_point[0] + arm_error_x,(grab_point[1] - 0.2),0.05,90,165,180])
    #move to object
    Robot.move_to_Goal([grab_point[0] + arm_error_x,grab_point[1],0.075,90,165,180])
    Robot.move_finger("Close")
    #come back up
    Robot.move_to_Goal([grab_point[0] + arm_error_x,grab_point[1],0.2,90,165,180])
    #bucket
    Robot.move_to_Goal([0, -0.6, 0.05, 90, 165, 0])
    Robot.move_finger("Open")
    # Robot.move_to_Goal([go_to_point[0]+0.2, go_to_point[1], 0.08, 90, 165, 180])
    # Robot.move_finger('Open')
    # Robot.move_to_Goal([go_to_point[0]+0.2, go_to_point[1], 0.2, 90, 165, 180])
    # time.sleep(1)



if __name__ == '__main__':
    #main
    print ('main in rviz controller')
    arm_error_x = 0.01
    
    goal_joints1 = [2.915011253031598e-06, 3.141125001472557, 0.816810382494447, 4.3594885760972195, -1.036030871184044e-06, 3.1416020986126925, -1.0120726343479318e-06]
    goal_joints2 = [-0.8028319446316649, 2.1864673119061298, 1.9820086287143661, 3.251482835499371, -0.09331017153748677, 1.9306891930256083, -0.9613650401498705]

    test_joint=[11.229457355552778, 3.562878639061646, 6.209094035124711, 0.7181161281967137, 4.222365475597346, 4.347476256235416, 5.809072858324921]
    
    Robot = robot('kinova')
    Robot.planner_type("RRT")
    #Robot.move_to_Joint(goal_joints2)
    robot_grasp_joints=[[5.292494707992289, 4.617425449602426, 6.262907998639722, 1.1245324203011362, 10.581492152841088, 4.773212383888791, 12.698122519807571],\
                        [5.194395038710349, 4.61755328133475, 6.258866918001637, 1.1237466546215082, 10.583468218369926, 4.77062485657367, 12.701494081747612],\
                        [5.301863708707188, 4.642172075083661, 6.25642586454647, 1.0640270648102172, 10.638482734904347, 4.773731167669139, 12.787761326306331],\
                        [5.1712862572995135, 4.612319104528309, 6.258938290718851, 1.1500339187933535, 10.562352546718905, 4.76536884184629, 12.666124106678053],\
                        [5.283578977294923, 4.655589613287698, 6.2539922679423565, 1.0363660089900546, 10.668026778773251, 4.774261669358283, 12.831719463259178],\
                        [5.291669660686583, 4.620667581913489, 6.259802220176472, 1.1244778254987895, 10.582222924244205, 4.775655035240613, 12.699355030760062],\
                        [5.31152459187756, 4.6414903058445995, 6.256269270674373, 1.0651639017005448, 10.636814530797523, 4.775946917696085, 12.78615064647905],\
                        [5.231036406884313, 4.623028207903735, 6.256276194893207, 1.1181681310861193, 10.588668839346633, 4.7726222273912295, 12.710124854208342],\
                        [5.190161145209341, 4.60857097161013, 6.263025710359904, 1.1623586288440768, 10.551653030723402, 4.765531827305003, 12.649429282436563],\
                        [5.180549796835245, 4.616609457044426, 6.257989140106346, 1.1261925017666372, 10.581176834568023, 4.765731031754541, 12.69837072642117]]
    obj_poses=[[0,0,0],\
                        [0.0005763325025327504, 0.060118433088064194, -0.0006358461105264723],\
                        [-0.00976986438035965, 0.09388939291238785, -0.006232446525245905],\
                        [-0.008225378580391407, 0.04460170120000839, -0.007075028959661722],\
                        [0.016475221142172813, 0.09869850426912308, 0.006259513553231955],\
                        [-0.04405537247657776, 0.0806846171617508, -0.005772814620286226],\
                        [-0.017389487475156784, 0.10056109726428986, 0.004388507921248674],\
                        [-0.013956969603896141, 0.06829618662595749, -0.0029939603991806507],\
                        [-0.02506561391055584, 0.05351909622550011, 0.0054907468147575855],\
                        [0.002339501865208149, 0.05117242783308029, -0.0064667463302612305]]
    openfinger=915
    closefinger=5485.437#914.62
    #reset the world
    Robot.scene.remove_world_object()
    #Robot.move_finger("Open")
    # #add in walls
    Robot.get_Object([1.5, 0.02, 2], [0, -0.8, 0, 1.0], "wall") # wall
    Robot.get_Object([2, 2, 0.02], [0, 0, -.075, 1.0], "floor") # wall
    Robot.get_Object([0.6, 0.5, 0.1], [0, -0.7, 0.7, 1.0], "camera bar") # wall
    speed1=1
    speed2=2
    speed3=3
    print ('testing different finger speeds, in theory a speed of 0.1 should take {} seconds, a speed of 0.2 should take {} and a speed of 0.3 should take {}.'.format(speed1, speed2, speed3))
    print ('0.1 signal')
    start=time.time()
    '''
    while (Robot.finger_pose[0]<1.4)|(Robot.finger_pose[1]<1.4):
        Robot.move_finger([0,0.2,0.2,0.2])
        #print (Robot.finger_pose)
    end=time.time()
    print ('closing with 0.4 took',end-start,'seconds')
    start=time.time()
    while (Robot.finger_pose[0]>0.05)|(Robot.finger_pose[1]>0.05):
        Robot.move_finger([0,-0.2,-0.2,-0.2])
    end=time.time()
    print ('opening with 0.4 took',end-start,'seconds')
    start=time.time()
    while (Robot.finger_pose[0]<1.4)|(Robot.finger_pose[1]<1.4):
        Robot.move_finger([0,0.6,0.6,0.6])
    end=time.time()
    print ('closing with 0.6 took',end-start,'seconds')
    start=time.time()
    while (Robot.finger_pose[0]>0.05)|(Robot.finger_pose[1]>0.05):
        Robot.move_finger([0,-0.6,-0.6,-0.6])
    end=time.time()
    print ('opening with 0.6 took',end-start,'seconds')
    start=time.time()
    while (Robot.finger_pose[0]<1.4)|(Robot.finger_pose[1]<1.4):
        Robot.move_finger([0,0.8,0.8,0.8])
    end=time.time()
    print ('closing with 0.8 took',end-start,'seconds')
    start=time.time()
    while (Robot.finger_pose[0]>0.05)|(Robot.finger_pose[1]>0.05):
        Robot.move_finger([0,-0.8,-0.8,-0.8])
    end=time.time()
    print ('opening with 0.8 took',end-start,'seconds')
    x=np.copy(Robot.all_times)
    y=np.copy(Robot.all_poses)
    y2=np.copy(Robot.all_goals)
    plt.plot(x,y[:,0]*7000/1.44)
    plt.plot(x,y[:,1]*7000/1.44)
    plt.plot(x,y[:,2]*7000/1.44)
    plt.plot(x,y2[:,0],marker='.')
    plt.plot(x,y2[:,1])
    plt.plot(x,y2[:,2])
    plt.legend(['finger 1','finger 2','finger 3','finger 1 control','finger 2 control','finger 3 control'])
    plt.show()
    '''
    '''
    print ('closing with 0.1')
    old=time.time()
    Robot.move_finger([0,0.1,0.1,0.1])
    Robot.move_finger([0,0.1,0.1,0.1])
    Robot.move_finger([0,0.1,0.1,0.1])
    print ('this took',time.time()-old)
    print ('opening with 0.1')
    old=time.time()
    Robot.move_finger([0,-0.1,-0.1,-0.1])
    Robot.move_finger([0,-0.1,-0.1,-0.1])
    Robot.move_finger([0,-0.1,-0.1,-0.1])
    print ('this took',time.time()-old)
    print ('closing with 0.3')
    old=time.time()
    Robot.move_finger([0,0.3,0.3,0.3])
    Robot.move_finger([0,0.3,0.3,0.3])
    Robot.move_finger([0,0.3,0.3,0.3])
    print ('this took',time.time()-old)    
    print ('opening with 0.3')
    old=time.time()
    Robot.move_finger([0,-0.3,-0.3,-0.3])
    Robot.move_finger([0,-0.3,-0.3,-0.3])
    Robot.move_finger([0,-0.3,-0.3,-0.3])
    print ('this took',time.time()-old)
    print ('closing with 1')
    old=time.time()
    Robot.move_finger([0,1,1,1])
    Robot.move_finger([0,1,1,1])
    Robot.move_finger([0,1,1,1])    
    print ('this took',time.time()-old)    
    print ('opening with 1')
    old=time.time()
    Robot.move_finger([0,-1,-1,-1])
    Robot.move_finger([0,-1,-1,-1])
    Robot.move_finger([0,-1,-1,-1])
    print ('this took',time.time()-old)
    '''
    print ('ready to go captain!')
    #Robot.move_to_Goal([0.21, -0.26, 0.5, 0.64, 0.317, 0.42,0.55])
    #Robot.move_to_Joint(test_joint)
    while True:
        Robot.pub.publish(False)

        # MARKER: IF HAND IS TRYING TO CLOSE
        if Robot.hand=='c':
            Robot.hand='n'
            Robot.move_finger("Close")
        elif Robot.hand=='o':
            Robot.hand='n'
            Robot.move_finger("Open")
        elif Robot.hand=='1':
            Robot.hand='n'
            Robot.move_finger("1Finger")
        elif Robot.hand=='2':
            Robot.hand='n'
            Robot.move_finger("2Finger")
        if (time.time()-Robot.hold)>1:
            if len(Robot.route) >0:
                print ('starting to move around',Robot.route)
                Robot.pub.publish(False)
                for i in Robot.route:
                    Robot.move_to_Joint(i)
                Robot.route=[]
                print ('theoretically we are done with the route.')
                Robot.pub.publish(True)
        rospy.sleep(0.5)
    '''
    Robot.move_to_Goal([0.07, -0.644, 0.01, 90, 180, 0])
    Robot.move_to_Goal([0,0.7,0.5,90,165,180])
    Robot.move_to_Goal([0,0.7,0.2,90,165,180])
    Robot.move_to_Goal([-.21,0.33,0.3,90,165,270])
    Robot.move_to_Goal([-.3875,-.1,0.05,90,165,180])
    Robot.move_finger("Open")
    Robot.move_to_Goal([-.3875,.1,0.05,90,165,180])
    #rospy.sleep(1)
    Robot.move_finger("Close")
    Robot.move_to_Goal([-.3875,.1,0.2,90,165,180])
    Robot.move_to_Goal([0.02,0.7,0.2,90,165,180])
    Robot.move_finger("Open")
    # # rospy.sleep(2)
    Robot.move_to_Goal([0.03, -0.59, 0.015, 90, 180, 0])    
    # rospy.sleep(2)
    Robot.move_to_Goal([-.21,0.33,0.3,90,165,270])
    # grab_point = []
    # grab_point2 = []
    '''