#!/usr/bin/env python3

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from std_msgs.msg import String, Float32, Float32MultiArray, MultiArrayDimension
from rospy_tutorials.msg import Floats
import numpy as np
import cv2.aruco as aruco
import sys
import math
from scipy.spatial.transform import Rotation as R
import time

DEBUG_PRINTING=False

def fix_z(vector,zval):
    new=[0,0,0]
    new[0]=vector[0]*zval/abs(vector[-1])
    new[1]=vector[1]*zval/abs(vector[-1])
    new[-1]=np.sign(vector[-1])*zval
    return new


def get_fingers_dot_product(fingers_6D_pose, hand_pose):
    fingers_dot_product = []
    for i in range(4):
        fingers_dot_product.append(get_dot_product(fingers_6D_pose[3 * i:3 * i + 3],hand_pose))
    return fingers_dot_product


# function to get the dot product. Only used for the pid controller
def get_dot_product(obj_state, hand_pose):
    obj_state_x = abs(obj_state[0] - hand_pose[0])
    obj_state_y = abs(obj_state[1] - hand_pose[1])
    obj_vec = np.array([obj_state_x, obj_state_y])
    obj_vec_norm = np.linalg.norm(obj_vec)
    obj_unit_vec = obj_vec / obj_vec_norm

    center_x = abs(0.0 - hand_pose[0])
    center_y = abs(0.0 - hand_pose[1])
    center_vec = np.array([center_x, center_y])
    center_vec_norm = np.linalg.norm(center_vec)
    center_unit_vec = center_vec / center_vec_norm

    dot_prod = np.dot(obj_unit_vec, center_unit_vec)
    return dot_prod ** 20  # cuspy to get distinct reward

class ImageProcessor():
    """
`   LOOK HERE FOR ID ASSOCIATIONS TO OBJECT
    """
    MARKER_TO_OBJ = {
        509: 'CylinderB',
        201: 'CubeM',
        202: 'CylinderM',
        203: 'Vase1M',
        204: 'Cone1M'
    }
    def __init__(self,real=True):
        # see openai_gym_kinova for more info on MARKER_TO_OBJ
        if real:
            # Object pose publisher
            self.pose_pub = rospy.Publisher("/object_pose", Float32MultiArray, queue_size=10)
            # Marker ID publisher 
            self.marker_pub = rospy.Publisher('/marker_id', String, queue_size=10)
            # Finger object distance publisher
            self.finger_dist_pub = rospy.Publisher("/finger_dist", Float32MultiArray, queue_size=10)
            self.finger_pose_pub = rospy.Publisher("/finger_pose", Float32MultiArray, queue_size=10)
            self.validation_checker= rospy.Publisher("/total_errors",Float32MultiArray, queue_size=10)
            self.finger_angle_pub = rospy.Publisher("/finger_angle", Float32MultiArray, queue_size=10)
            self.finger_dot_product_pub = rospy.Publisher("/finger_dot_product", Float32MultiArray, queue_size=10)
            #self.finger2_proximal_angle_pub = rospy.Publisher("/finger2_proximal_angle", Float32, queue_size=10)
            self.obj_corners=[]
            self.ee_corners=[]
            self.f1proximalcorners=[]
            self.f1distalcorners=[]
            self.f2proximalcorners=[]
            self.f2distalcorners=[]
            #cv bridge class
            self.bridge = CvBridge()
            self.prev_ee_rvec=[]
            self.prev_ee_tvec=[]
            self.finger_poses=[]
            # This is the image message subcriber. Change the topic to your camera topic (most likely realsense)
            self.image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, self.get_object_pose)
        else:
            self.obj_corners=[]
            self.ee_corners=[]
            self.f1proximalcorners=[]
            self.f1distalcorners=[]
            self.f2proximalcorners=[]
            self.f2distalcorners=[]
            #cv bridge class
            self.bridge = CvBridge()
            self.prev_ee_rvec=[]
            self.prev_ee_tvec=[]

    # Callback for image processing
    def get_object_pose(self, img_msg):
        # start = time.time()

        # Aruko Marker Info

        ##Box Pixel values in the Image## < WHY WE CROPPIN THE IMAGE THO
        # x = 241 # Start Pixel in Height
        # y = 160 # Start Pixel in Width
        # h = 955-y # Height in pixels
        # w = 1635-x # Width in pixels
        
        marker_size = 3.6#cm 

        # Marker IDs
        ee_marker_id = 608  # end-effector
        obj_marker_id = 202  # object  # TODO: change detection so it only fires for this specific marker?
        finger1_proximal_id = 189 # Finger 1 proximal
        finger1_distal_id = 331# Finger 1 distal
        finger2_proximal_id = 411 # Finger 2 proximal
        finger2_distal_id = 190  # Finger 1 distal
        #finger 1 is the thumb, finger 2 is the side with 2 fingers.
        #finger 1 should have -x,+y location and finger 2 should have +x,+y location
        '''
        ee_marker_id = 0  # end-effector
        obj_marker_id = 2  # object
        finger1_proximal_id = 1 # Finger 1 proximal
        finger1_distal_id = 4  # Finger 1 distal
        finger2_proximal_id = 5 # Finger 2 proximal 
        finger2_distal_id = 3  # Finger 1 distal
        '''
        # Get the saved camera and distortion matrices from calibration
        #mtx = np.load('/home/nigel/kinova_ws/kinova_pkg/src/camera_mtx.npy') # camera matrix
        #dist = np.load('/home/nigel/kinova_ws/kinova_pkg/src/dist_mtx.npy')  # distortion matrix
        #
        # mtx = np.load('/home/nigel/camera_mtx2.npy') # camera matrix
        # dist = np.load('/home/nigel/dist_mtx2.npy')  # distortion matrix

        mtx = np.load('/home/mechagodzilla/sim-to-real-kinova/camera_mtx.npy')  # camera matrix
        dist = np.load('/home/mechagodzilla/sim-to-real-kinova/dist_mtx.npy')  # distortion matrix

        #mtx = np.load('/home/nigel/charuco_cam.npy') # camera matrix
        #dist = np.load('/home/nigel/charuco_dist.npy')  # distortion matrix
        # Define Aruco Dictionary 
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_ARUCO_ORIGINAL)
        #aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_5X5_1000)
        parameters = aruco.DetectorParameters_create()
        #parameters.adaptiveThreshWinSizeMax=400
        #parameters.minDistanceToBorder=0
        #Lists for storing marker positions
        ee_marker = []
        obj_marker = []
        finger1_proximal = []
        finger1_distal = []
        finger2_proximal = []
        finger2_distal = []
        finger_object_dist = []
        finger_pose = []
        finger1_distal1 = []
        finger1_proximal1 = []
        finger2_distal1 = []
        finger2_proximal1 = []
        im_num=0
        local_rotation=[]
        f1_rotation=[]
        f2_rotation=[]
        #Convert ros image message to opencv image
        
        try:
            cv_image = self.bridge.imgmsg_to_cv2(img_msg, "bgr8")
        except CvBridgeError as e:
            print(e)
            print('trying to read the image')
        '''
        try:
            cv_image = cv2.imread(img_msg)
        except:
            print('not image filepath or imgmsg')
        '''
        #Cropping Image
        # print(cv_image.shape)
        # cv_image = cv_image[y:y+h, x:x+w]
        # NO DON'T CROP THE IMAGE!!!
        
        #Convert in gray scale
        gray = cv2.cvtColor(cv_image,cv2.COLOR_BGR2GRAY)

        # print(gray.shape)

        #Find markers in the image
        corners, ids, rejected = aruco.detectMarkers(image=gray, dictionary=aruco_dict, parameters=parameters, cameraMatrix=mtx, distCoeff=dist)
        # winSize = (5, 5)
        # zeroZone = (-1, -1)
        # criteria = (cv2.TERM_CRITERIA_EPS + cv2.TermCriteria_COUNT, 40, 0.001)
        if ids is not None:

            if len(ids) <6:
                if DEBUG_PRINTING:
                    print("aruco ids")
                    print(ids)

            '''
            # Calculate the refined corner locations
            #print('corners',corners,type(corners),'corners')
            #print('ids',ids)
            temp=[]
            for i in corners:
                for corner in i[0]:
                    temp.append([list(corner)])
            #print(temp)
            corners = cv2.cornerSubPix(gray, np.float32(temp), winSize, zeroZone, criteria)
            t2=[]
            for i in range(int(len(corners)/4)):
                temp=[]
                for j in range(4):
                    temp.append([corners[i*4+j][0]])
                t2.append(np.array(temp))
            #print('new corners',t2)
            corners=t2
            '''

            flag1=True
            if np.all(ids != None):  # TODO: this is redundant, we already do a none check. also the none check didn't really work before LOL (you did a check on len(ids))
                '''
                this is an averaging function. averages the observation over the past 5 observations seen
                '''
                # for i in range(ids.size):
                    # if ids[i] == ee_marker_id:
                    #     if len(self.ee_corners)>5:
                    #         self.ee_corners.pop(0)
                    #     self.ee_corners.append(corners[i])
                    #     corners[i]=np.average(self.ee_corners,axis=0)
                    # if ids[i].item() in self.MARKER_TO_OBJ.keys():  #ids[i]==obj_marker_id:  # bruh this is an array so need to use .item()
                    #     flag1=False
                    #     if len(self.obj_corners)>5:
                    #         self.obj_corners.pop(0)
                    #     self.obj_corners.append(corners[i])
                    #     corners[i]=np.average(self.obj_corners,axis=0)
                    # if ids[i] == finger1_proximal_id:
                    #     if len(self.f1proximalcorners)>5:
                    #         self.f1proximalcorners.pop(0)
                    #     self.f1proximalcorners.append(corners[i])
                    #     corners[i]=np.average(self.f1proximalcorners,axis=0)
                    # if ids[i]==finger1_distal_id:
                    #     if len(self.f1distalcorners)>5:
                    #         self.f1distalcorners.pop(0)
                    #     self.f1distalcorners.append(corners[i])
                    #     corners[i]=np.average(self.f1distalcorners,axis=0)
                    # if ids[i] == finger2_proximal_id:
                    #     if len(self.f2proximalcorners)>5:
                    #         self.f2proximalcorners.pop(0)
                    #     self.f2proximalcorners.append(corners[i])
                    #     corners[i]=np.average(self.f2proximalcorners,axis=0)
                    # if ids[i]==finger2_distal_id:
                    #     if len(self.f2distalcorners)>5:
                    #         self.f2distalcorners.pop(0)
                    #     self.f2distalcorners.append(corners[i])
                    #     corners[i]=np.average(self.f2distalcorners,axis=0)


                rvec, tvec, __ = aruco.estimatePoseSingleMarkers(corners,marker_size, mtx, dist)

                """
                There are 6 rotations + 6 shifts.
                
                1: end effector   
                2:
                3:
                4:
                5:
                6:
                
                """

                all_rotations=[0,0,0,0,0,0]
                all_shifts=[0,0,0,0,0,0]
                #rvec is rotation from marker frame to camera frame I THINK, NOT SURE.
                #From there, we need to change the tvecs, which currently give me the distance from the marker to the camera
                #in that marker's coordinate frame to give the distance from the camera to the finger/object center
                #in camera frame. That way we can do a rotation to get the distance from the palm to the fingers/object
                for i in range(ids.size):
                    # marker frame to camera frame
                    rotation=R.from_rotvec(rvec[i][0])  # axis of trotation + rot angle around axis (gives marker orientation)
                    # print('rotation: ', rotation.shape)
                    #Draw reference frame for the marker
                    # Save end-effector marker pose
                    if ids[i] == ee_marker_id:
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                        all_rotations[0]=rotation.inv()
                        ee_marker1 = tvec[i][0]  # first variable, start with translation vector (these translation vectors are
                        ee_marker = np.copy(tvec[i][0]) # trnanslatin vector here as well, this is just a single list
                        shift=np.matmul(rotation.as_matrix(),[1,5.8,0])  # rotate this HARDCODED THING. # TODO: NIGEL what is the hardcoding here?
                        # this shift is x, y, and z offset from the palm marker to the actual palm.  # uhhh not sure if actually true

                        all_shifts[0]=shift  # the created shift is added here
                        local_rotation=np.copy(rotation.inv().as_matrix())  # inverse rotation's corresponding matrix
                        ee_marker1[0] = ee_marker1[0] + shift[0]
                        ee_marker1[1] = ee_marker1[1] + shift[1] #52.41 mm offset in Y
                        ee_marker1[2] = ee_marker1[2] + shift[2] #35.56 mm offset in z

                        # if we haven't recorded any rotation vectors before, we need to setup up our data structures properly
                        if self.prev_ee_rvec==[]:
                            self.prev_ee_rvec=np.copy(local_rotation)
                            self.prev_ee_tvec=np.copy(ee_marker1)
                    # Save object marker pose. first check if object id is in the aruco marker ids mapped to shapes we know.
                    if ids[i].item() in self.MARKER_TO_OBJ.keys():  # bruh this is an array so need to use .item()
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                        obj_marker = np.copy(tvec[i][0])
                        obj_marker1 = tvec[i][0]
                        flag1=False
                        # TODO: NIGEL what is the hardcoding here? does this just go to COM below the area of detection
                        shift=np.matmul(rotation.as_matrix(),[0,0,-5.5])  # shift from the actual marker to the center of mass area of the objecty part? (eyeballed)
                        all_shifts[-1]=shift
                        all_rotations[-1]=rotation
                        obj_marker1[0] = obj_marker1[0] + shift[0]
                        obj_marker1[1] = obj_marker1[1] + shift[1]
                        obj_marker1[2] = obj_marker1[2] + shift[2]  ###Since Object height in z is 110 mm. Subtracting 55 mm brings center to object center
                    # Save finger1 proximalmarker pose
                    if ids[i] == finger1_proximal_id:
                        f1_rotation=np.copy(rotation.as_matrix())
                        finger1_proximal = np.copy(tvec[i][0])
                        finger1_proximal1 = tvec[i][0]
                        shift=np.matmul(rotation.as_matrix(),[4.7,-0.1,0])  # shift from the actual marker to the center of mass area of the finger part (eyeballed)
                        all_shifts[1]=shift
                        finger1_proximal1[0] = finger1_proximal[0] + shift[0]
                        finger1_proximal1[1] = finger1_proximal[1] + shift[1]
                        finger1_proximal1[2] = finger1_proximal[2] + shift[2]
                        all_rotations[1]=rotation
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)

                    # Save finger1 distal pose
                    if ids[i] == finger1_distal_id:
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                        shift=np.matmul(rotation.as_matrix(),[4.3,-2.7,0])  # shift from the actual marker to the center of mass area of the finger part (eyeballed)
                        finger1_distal = np.copy(tvec[i][0])
                        finger1_distal1 = tvec[i][0]
                        all_shifts[2]=shift
                        #print('f1 z',finger1_distal[-1])
                        finger1_distal1[0] = finger1_distal[0] + shift[0]
                        finger1_distal1[1] = finger1_distal[1] + shift[1]
                        finger1_distal1[2] = finger1_distal[2]+ shift[2]
                        all_rotations[2]=rotation
                    # Save finger2 proximalmarker pose
                    if ids[i] == finger2_proximal_id:
                        f2_rotation=np.copy(rotation.as_matrix())
                        shift=np.matmul(rotation.as_matrix(),[4.4,-0.1,0])  # shift from the actual marker to the center of mass area of the finger part (eyeballed)
                        all_shifts[3]=shift
                        finger2_proximal = np.copy(tvec[i][0])
                        finger2_proximal1 = tvec[i][0]
                        finger2_proximal1[0] = finger2_proximal[0] + shift[0]
                        finger2_proximal1[1] = finger2_proximal[1] + shift[1]
                        finger2_proximal1[2] = finger2_proximal[2] + shift[2]
                        all_rotations[3]=rotation
                    # Save finger2 distal pose
                    if ids[i] == finger2_distal_id:
                        shift=np.matmul(rotation.as_matrix(),[4.3,2.7,0])  # shift from the actual marker to the center of mass area of the finger part (eyeballed)
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                        all_shifts[4]=shift
                        finger2_distal = np.copy(tvec[i][0])
                        finger2_distal1 = tvec[i][0]
                        #print('f2 z',finger2_distal[-1])
                        finger2_distal1[0] = finger2_distal[0] + shift[0]
                        finger2_distal1[1] = finger2_distal[1] + shift[1]
                        finger2_distal1[2] = finger2_distal[2] + shift[2]
                        all_rotations[4]=rotation
                    aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                if (len(ee_marker)==0)&(len(self.prev_ee_rvec)>0):
                    aruco.drawAxis(cv_image, mtx, dist, self.prev_ee_rvec, self.prev_ee_tvec, 2)

                #Draw Markers
                aruco.drawDetectedMarkers(cv_image, corners, ids)

                # TODO: Try catch here

                if DEBUG_PRINTING:
                    print('markers!!!')
                    print('ee marker: ', ee_marker)
                    print('finger 1 proximal: ', finger1_proximal)
                    print('finger 2 proximal: ', finger2_proximal)
                    print('finger 1 distal: ', finger1_distal)
                    print('finger 2 distal: ', finger2_distal)
                    # print(ee_marker,finger1_proximal,finger2_proximal,finger1_distal,finger2_distal)

                # this condition checks if all the aruco markers are present.
                can_calculate_z = len(ee_marker) and len(finger1_proximal) and len(finger2_proximal) and len(finger1_distal) and len(finger2_distal)
                if can_calculate_z:

                    # get average z value from all our detected markers
                    avg_z=np.average([ee_marker[-1],finger1_proximal[-1],finger2_proximal[-1],finger1_distal[-1],finger2_distal[-1]])
                    Z_dist=avg_z
                    #print('Z dist',Z_dist)
                    ee_marker=fix_z(ee_marker1,Z_dist)
                    finger1_proximal=fix_z(finger1_proximal1,Z_dist)
                    finger1_distal=fix_z(finger1_distal1,Z_dist)
                    finger2_proximal=fix_z(finger2_proximal1,Z_dist)
                    finger2_distal=fix_z(finger2_distal1,Z_dist)

                    finger1_proximal_site = [finger1_proximal[0] + 0.5, finger1_proximal[1] + 0.6,
                                             finger1_proximal[2]]
                    finger2_proximal_site = [finger2_proximal[0] - 0.5, finger2_proximal[1] + 0.6,
                                             finger2_proximal[2]]
                    finger1_distal_site = [finger1_distal[0] - 0.3, finger1_distal[1] + 0.8, finger1_distal[2]]
                    finger2_distal_site = [finger2_distal[0] + 0.3, finger2_distal[1] + 0.8, finger2_distal[2]]

                    #obj_marker=fix_z(obj_marker,Z_dist)
                    '''
                    finger2_distal[0] = finger2_distal[0] + all_shifts[4][0]
                    finger2_distal[1] = finger2_distal[1] + all_shifts[4][1]
                    finger2_distal[2] = finger2_distal[2] + all_shifts[4][2]
                    finger2_proximal[0] = finger2_proximal[0] + all_shifts[3][0]
                    finger2_proximal[1] = finger2_proximal[1] + all_shifts[3][1]
                    finger2_proximal[2] = finger2_proximal[2] + all_shifts[3][2]
                    finger1_distal[0] = finger1_distal[0] + all_shifts[2][0]
                    finger1_distal[1] = finger1_distal[1] + all_shifts[2][1]
                    finger1_distal[2] = finger1_distal[2]+ all_shifts[2][2]
                    finger1_proximal[0] = finger1_proximal[0] + all_shifts[1][0]
                    finger1_proximal[1] = finger1_proximal[1] + all_shifts[1][1]
                    finger1_proximal[2] = finger1_proximal[2] + all_shifts[1][2]
                    obj_marker[0] = obj_marker[0] + all_shifts[-1][0]
                    obj_marker[1] = obj_marker[1] + all_shifts[-1][1]
                    obj_marker[2] = obj_marker[2] + all_shifts[-1][2]
                    ee_marker[0] = ee_marker[0] + all_shifts[0][0]
                    ee_marker[1] = ee_marker[1] + all_shifts[0][1] #52.41 mm offset in Y
                    ee_marker[2] = ee_marker[2] + all_shifts[0][2] #35.56 mm offset in z
                    '''
                    finger_angles=[]
                    count = 0
                    if (len(f1_rotation)>0) & (len(f2_rotation)>0) & (len(local_rotation) > 0):
                        if abs(f1_rotation[-1][-1]-f2_rotation[-1][-1]) < 0.1:
                            if abs(f1_rotation[-1][-1]-local_rotation[-1][-1]) <0.05:
                                self.prev_ee_rvec=np.copy(local_rotation)
                                self.prev_ee_tvec=np.copy(ee_marker)
                            else:
                                local_rotation=self.prev_ee_rvec
                                #ee_marker=s
                    n = len(finger_pose) - 3
                    n_next = len(finger_pose)
                    if len(finger1_proximal) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0 and len(finger1_distal) > 0 and len(finger2_proximal) > 0 and len(finger2_distal) > 0:
                        all_poses = []
                        all_poses.extend(finger1_proximal)
                        all_poses.extend(finger2_proximal)
                        all_poses.extend(finger1_distal)
                        all_poses.extend(finger2_distal)
                        finger_dot_product = get_fingers_dot_product(all_poses, ee_marker)

                    if len(ee_marker) > 0 and len(obj_marker) > 0 :
                        # print(obj_marker,ee_marker,all_poses)
                        dot_product = get_dot_product(obj_marker, ee_marker)
                        #print('object marker and ee marker',obj_marker,ee_marker)
                        # Get the pose of object with respect to end-effector
                        object_pose = [(x - y)/100 for x, y in zip(obj_marker,ee_marker)] # Prints in milimeters. Default is cm.
                        object_pose=np.matmul(local_rotation,object_pose)  # align in coordinate frame of the local object
                        # object_pose: [x,y,z]
                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[1].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        #print('finger 1 distal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)


                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[2].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        #print('finger 1 proximalal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[3].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        #print('finger 2 distal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[4].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        #print('finger 2 proximalal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                        #print('rotations',all_rotations[0].as_euler('xyz'), all_rotations[4].as_euler('xyz'))
                        #print("Object Distance: " +str(object_pose))
                        count += 1

                    if len(finger1_proximal) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
                        #print('pre rotation values',finger1_proximal,ee_marker,finger2_proximal)

                        # calculate finger angles from finger1 distal rotation!
                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[1].as_matrix())  # rotation from end effector combined with f1 prox orientation
                        new_rot=R.from_matrix(overall_angle)
                        theta=new_rot.as_euler('xyz')[-1]*180/np.pi  # conversion from radians to degrees
                        finger_angles.append(90+theta)  # there's an offset of 90 i guess


                        finger_pose_local = [(x - y)/100 for x, y in zip(finger1_proximal,ee_marker)]  # wrt to end effector marker
                        finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))  # get it into coord frame of end effector too

                        # Get the distance between object and finger 1

                        dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger1_proximal_site,obj_marker)])
                        #dist = [math.sqrt(x)*10.0 for x in delta_pose]
                        finger_object_dist.append(dist)
                        #print("Finger1 proximal to object: " +str(dist))
                        count += 1

                        # finger1_proximal to object distance: finger_object_dist[0]

                    if len(finger1_distal) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:

                        overall_angle=np.matmul(all_rotations[1].inv().as_matrix(),all_rotations[2].as_matrix())  # rotation from end effector combined with f1 distal
                        new_rot=R.from_matrix(overall_angle)
                        theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                        finger_angles.append(180+abs(theta))

                        finger_pose_local = [(x - y)/100 for x, y in zip(finger1_distal,ee_marker)]
                        finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))

                        delta_pose = 0
                        # Get the distance between object and finger
                        proximal=np.linalg.norm([(x - y)/100 for x, y in zip(finger1_distal_site,obj_marker)])
                        finger_object_dist.append(proximal)
                        #print("Finger1 distal to object: " +str(dist1))
                        count += 1

                        # finger1_distal to object distance: finger_object_dist[1]

                    if len(finger2_proximal) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:

                        overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[3].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                        finger_angles.append(270-theta)

                        finger_pose_local = [(x - y)/100 for x, y in zip(finger2_proximal,ee_marker)]
                        finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                        #finger_pose.append(finger_pose_local1[1])
                        #finger_pose.append(finger_pose_local1[2])
                        #print("Finger2 Proximal to Object relative pose: ", finger_pose[2][0:3])

                        # finger2_proximal to object pose: finger_pose[6:9]

                        dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger2_proximal_site,obj_marker)])

                        # finger2_proximal to object distance: finger_object_dist[2]

                        finger_object_dist.append(dist)
                        #print("Finger2 proximalto object: " +str(dist2))
                        count += 1

                    if len(finger2_distal) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:

                        overall_angle=np.matmul(all_rotations[3].inv().as_matrix(),all_rotations[4].as_matrix())
                        new_rot=R.from_matrix(overall_angle)
                        theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                        finger_angles.append(180+abs(theta))

                        finger_pose_local = [(x - y)/100 for x, y in zip(finger2_distal,ee_marker)]
                        finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                        #finger_pose.append(finger_pose_local2[1])
                        #finger_pose.append(finger_pose_local2[2])
                        #print("Finger2 distal to Object relative pose: ", finger_pose[3][0:3])


                        # finger2_distal to object pose: finger_pose[6], finger_pose[7]

                        # Get the distance between object and finger
                        dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger2_distal_site,obj_marker)])


                        # finger2_distal to object distance: finger_object_dist[3]

                        finger_object_dist.append(dist)
                        # finger_object_dist.append(dist1)
                        # finger_object_dist.append(dist2)

                        #print("Finger2 distal to object: " +str(dist))
                        count += 1

                    #print('calculated finger angles',finger_angles)
                    #old method of finding finger angles
                    '''
                    old_finger_angles=[]
                    if (len(f1_rotation) >0)&(len(f2_rotation)>0)&(len(local_rotation)>0)&(len(finger2_distal)>0)&(len(finger1_distal)>0):
                        shift=np.matmul(f1_rotation,[0,-2.7,0])
                        a=np.copy(ee_marker)
                        b=np.copy(finger1_proximal)
                        b=b+shift
                        c=np.copy(finger1_proximal)
                        a1=np.array([b[0]-a[0],b[1]-a[1]])
                        a2=np.array([b[0]-c[0],b[1]-c[1]])
                        angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                        
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[finger1_proximal_id], b, 2)
                        old_finger_angles.append(angle*180/np.pi)
                        
                        shift=np.matmul(f1_rotation,[0,2.7,0])
                        a=np.copy(finger1_proximal)
                        b=np.copy(finger1_proximal)
                        b=b+shift
                        c=np.copy(finger1_distal)
                        a1=np.array([b[0]-a[0],b[1]-a[1]])
                        a2=np.array([b[0]-c[0],b[1]-c[1]])
                        angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                        check=np.matmul(np.transpose(f1_rotation),finger1_distal)
                        check=check-np.matmul(np.transpose(f1_rotation),finger1_proximal)
                        if check[0] <0:
                            angle=2*np.pi-angle
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[finger1_distal_id], b, 2)
                        old_finger_angles.append(angle*180/np.pi)
                        
                        shift=np.matmul(f2_rotation,[0,2.7,0])
                        a=np.copy(ee_marker)
                        b=np.copy(finger2_proximal)
                        b=b+shift
                        c=np.copy(finger2_proximal)
                        a1=np.array([b[0]-a[0],b[1]-a[1]])
                        a2=np.array([b[0]-c[0],b[1]-c[1]])
                        angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[finger2_proximal_id], b, 2)
                        old_finger_angles.append(angle*180/np.pi)
                        f2_rotation
                        shift=np.matmul(f2_rotation,[0,-2.7,0])
                        a=np.copy(finger2_proximal)
                        b=np.copy(finger2_proximal)
                        b=b+shift
                        c=np.copy(finger2_distal)
                        a1=np.array([b[0]-a[0],b[1]-a[1]])
                        a2=np.array([b[0]-c[0],b[1]-c[1]])
                        angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                        check=np.matmul(np.transpose(f2_rotation),finger2_distal)
                        check=check-np.matmul(np.transpose(f2_rotation),finger2_proximal)
                        if check[0] <0:
                            angle=2*np.pi-angle
                        #print('angle 1 and 2',a1,a2)
                        #print('final angle',angle)
                        #aruco.drawAxis(cv_image, mtx, dist, rvec[finger2_distal_id], b, 2)
                        old_finger_angles.append(angle*180/np.pi)
        
                    #print('finger angles',np.array(finger_angles)*180/np.pi)
                    '''
                    #even older method to find finger angles
                    '''
                    if m1 > m2:
                        #finger2_proximal_angle = np.atan((m2- m1)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                        finger2_proximal_angle = np.pi*2 - np.arctan((m2 - m1)/(1+ m1*m2))  ###  ->   <  this side angle of finger
                    else:
                          #finger2_proximal_angle = np.atan((m1 - m2)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                        finger2_proximal_angle = np.pi*2 - np.arctan((m1 - m2)/(1+ m1*m2))  ###  ->   <  this side angle of finger
                                     
                    m3 = (finger1_proximal1[1] - finger1_proximal[1])/(finger1_proximal1[0] - finger1_proximal[0]) 
                    m4 = (finger1_distal1[1] - finger1_distal[1])/(finger1_distal1[0] - finger1_distal[0]) 
                    
                    if m3 > m4:
                        #finger1_proximal_angle = np.atan((m3 - m4)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                        finger1_proximal_angle = np.pi*2 - np.arctan((m3 - m4)/(1+ m3*m4))  ###  ->   <  this side angle of finger
                    else:
                          #finger1_proximal_angle = np.atan((m4 - m3)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                        finger1_proximal_angle = np.pi*2 - np.arctan((m4 - m3)/(1+ m3*m4))  ###  ->   <  this side angle of finger  
                    '''

                    # print('finger obj dist',finger_object_dist)
                    # print('finger pose',finger_pose)
                    # print('image shape before showing:', cv_image.shape)
                    # # resize = cv2.resize(image, width=1280)
                    # cv2.imshow('COOL Window', cv_image)

                    cv2.waitKey(3)
                    filename='image'+str(im_num)+'.png'
                        #print(filename)
                    cv2.imwrite(filename,gray)
                    #self.finger2_proximal_angle_pub.publish(finger2_proximal_angle)
                    # TODO: WTF IS THIS COUNT VARIABLE??
                    if count > 4:
                        # If
                        # print('the count is more than 4')

                        count = 0
                        im_num+=1

                        # we are publishing a float32. numpy array. where's the numpy wrapper?
                        publisher=Float32MultiArray()
                        publisher.layout.dim.append(MultiArrayDimension())
                        publisher.layout.dim[0].label = 'angles'
                        publisher.layout.dim[0].size = 4
                        publisher.layout.dim[0].stride = 4
                        # print('len finger angles',len(finger_angles))
                        if len(finger_angles)==4:
                            publisher.data=finger_angles
                            self.finger_angle_pub.publish(publisher)
                            #print('finger angles', finger_angles)
                            publisher.layout.dim[0].size = 5
                            publisher.data=finger_dot_product + [dot_product]
                            # print('publishing on finger dot product')
                            self.finger_dot_product_pub.publish(publisher)
                        # publish the finger distances to objects
                        if len(finger_object_dist) == 4:
                            publisher.layout.dim[0].label = 'finger object dist'
                            publisher.data=finger_object_dist
                            # print('finger obj dist',finger_object_dist)
                            self.finger_dist_pub.publish(publisher)


                        if len(object_pose) == 3:
                            #print('object pose',object_pose)
                            publisher.layout.dim[0].label = 'object pose'
                            publisher.layout.dim[0].size = 3
                            publisher.layout.dim[0].stride = 3
                            publisher.data=object_pose
                            self.pose_pub.publish(publisher)


                        if len(finger_pose) == 4:
                            # print('finger pose',finger_pose)
                            self.finger_poses.append(finger_pose)
                            finger_array=np.array(self.finger_poses)
                            temp=[]
                            temp.append(np.average(finger_array,axis=0))
                            #print('average finger pose',temp)
                            err_matrix=np.array(temp)
                            #open hand err matrix
                            # TODO: modify this err matrix. what is it doing???
                            # TODO: this err mtrix is still hardcoded, and I don't know what its doing...
                            # I think it doesn't do aythign though... just a waste of calulation
                            err_matrix=err_matrix-np.array([[-0.05,0.024,0],[-0.063,0.055,0],[0.05,0.024,0],[0.063,0.055,0]])
                            #closed hand err matrix
                            #err_matrix=err_matrix-np.array([[-0.026,0.03,0],[-0.01,0.052,0],[0.026,0.03,0],[0.01,0.052,0]])
                            #print('error in average finger pose',err_matrix)
                            #print('err_matrix part',err_matrix[0,:,0])
                            xerr=np.average(np.abs(err_matrix[0,:,0]))
                            yerr=np.average(np.abs(err_matrix[0,:,1]))
                            toterr=np.average(np.abs(err_matrix[0,:,0:2]))
                            # print('x err',xerr)
                            # print('y err',yerr)
                            # print('total err',toterr)
                            # print('==================================================================')
                            publisher.layout.dim[0].label = 'x,y,z'
                            publisher.layout.dim[0].size = 12
                            publisher.layout.dim[0].stride = 12
                            finger_pose=np.array(finger_pose)
                            finger_pose=list(finger_pose.flatten())
                            publisher.data=finger_pose
                            self.finger_pose_pub.publish(publisher)

                            #self.marker_pub.publish(str(obj_marker_id))
                            publisher.layout.dim[0].label='errors'
                            publisher.layout.dim[0].size = 3
                            publisher.layout.dim[0].stride = 3
                            publisher.data=[xerr,yerr,toterr]
                            self.validation_checker.publish(publisher)  # only place where error is used
                        #filename='image'+str(im_num)+'.png'
                        #print(filename)
                        #cv2.imwrite(filename,gray)
                    #else:
                        #print("Not all Markers Found")

        #Display
        # print('window size: ', cv_image.shape)
        cv2.imshow('object_pose_and_distance_estimation.py window', cv_image)
        
        cv2.waitKey(1)

        # end = time.time()
        #
        # rospy.loginfo(end - start)
        
    
def main(args):
    
    f = ImageProcessor(real=True)
    rospy.init_node('object_pose_and_distance_estimation', anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    
    '''
    a=ImageProcessor(real=False)
    a.get_object_pose('/home/nigel/calibresult.png')
    cv2.destroyAllWindows()
    '''

if __name__ == '__main__':
    main(sys.argv)
