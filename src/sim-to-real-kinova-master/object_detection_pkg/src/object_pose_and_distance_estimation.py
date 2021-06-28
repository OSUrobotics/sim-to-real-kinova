#!/usr/bin/env python

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


def fix_z(vector,zval):
    new=[0,0,0]
    new[0]=vector[0]*zval/abs(vector[-1])
    new[1]=vector[1]*zval/abs(vector[-1])
    new[-1]=np.sign(vector[-1])*zval
    return new

class ImageProcessor():
    def __init__(self,real=True):
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
            #self.finger2_dist_angle_pub = rospy.Publisher("/finger2_dist_angle", Float32, queue_size=10)
            self.obj_corners=[]
            self.ee_corners=[]
            self.f1distcorners=[]
            self.f1tipcorners=[]
            self.f2distcorners=[]
            self.f2tipcorners=[]
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
            self.f1distcorners=[]
            self.f1tipcorners=[]
            self.f2distcorners=[]
            self.f2tipcorners=[]
            #cv bridge class
            self.bridge = CvBridge()
            self.prev_ee_rvec=[]
            self.prev_ee_tvec=[]
    # Callback for image processing
    def get_object_pose(self, img_msg):
        # Aruko Marker Info

        ##Box Pixel values in the Image##
        x = 241 # Start Pixel in Height
        y = 160 # Start Pixel in Width
        h = 955-160 # Height in pixels    
        w = 1635-241 # Width in pixels
        
        marker_size = 3.6#cm 

        # Marker IDs
        ee_marker_id = 608  # end-effector
        obj_marker_id = 509  # object
        finger1_dist_id = 189 # Finger 1 Dist
        finger1_tip_id = 331# Finger 1 Tip
        finger2_dist_id = 411 # Finger 2 Dist  
        finger2_tip_id = 190  # Finger 1 Tip
        #finger 1 is the thumb, finger 2 is the side with 2 fingers.
        #finger 1 should have -x,+y location and finger 2 should have +x,+y location
        '''
        ee_marker_id = 0  # end-effector
        obj_marker_id = 2  # object
        finger1_dist_id = 1 # Finger 1 Dist
        finger1_tip_id = 4  # Finger 1 Tip
        finger2_dist_id = 5 # Finger 2 Dist  
        finger2_tip_id = 3  # Finger 1 Tip
        '''
        # Get the saved camera and distortion matrices from calibration
        #mtx = np.load('/home/nigel/kinova_ws/kinova_pkg/src/camera_mtx.npy') # camera matrix
        #dist = np.load('/home/nigel/kinova_ws/kinova_pkg/src/dist_mtx.npy')  # distortion matrix
        #
        # mtx = np.load('/home/nigel/camera_mtx2.npy') # camera matrix
        # dist = np.load('/home/nigel/dist_mtx2.npy')  # distortion matrix

        mtx = np.load('/home/jimzers/sim-to-real-kinova/camera_mtx.npy')  # camera matrix
        dist = np.load('/home/jimzers/sim-to-real-kinova/dist_mtx.npy')  # distortion matrix

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
        finger1_dist = []
        finger1_tip = []
        finger2_dist = []
        finger2_tip = []
        finger_object_dist = []
        finger_pose = []
        finger1_tip1 = []
        finger1_dist1 = []
        finger2_tip1 = []
        finger2_dist1 = []
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
        cv_image = cv_image[y:y+h, x:x+w]
        
        #Convert in gray scale
        gray = cv2.cvtColor(cv_image,cv2.COLOR_BGR2GRAY)

        #Find markers in the image 
        corners, ids, rejected = aruco.detectMarkers(image=gray, dictionary=aruco_dict, parameters=parameters, cameraMatrix=mtx, distCoeff=dist)
        winSize = (5, 5)
        zeroZone = (-1, -1)
        criteria = (cv2.TERM_CRITERIA_EPS + cv2.TermCriteria_COUNT, 40, 0.001)
        if len(ids) <6:
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
        if np.all(ids != None):
            for i in range(ids.size):
                if ids[i] == ee_marker_id:
                    if len(self.ee_corners)>5:
                        self.ee_corners.pop(0)
                    self.ee_corners.append(corners[i])
                    corners[i]=np.average(self.ee_corners,axis=0)
                if ids[i]==obj_marker_id:
                    flag1=False
                    if len(self.obj_corners)>5:
                        self.obj_corners.pop(0)
                    self.obj_corners.append(corners[i])
                    corners[i]=np.average(self.obj_corners,axis=0)
                if ids[i] == finger1_dist_id:
                    if len(self.f1distcorners)>5:
                        self.f1distcorners.pop(0)
                    self.f1distcorners.append(corners[i])
                    corners[i]=np.average(self.f1distcorners,axis=0)
                if ids[i]==finger1_tip_id:
                    if len(self.f1tipcorners)>5:
                        self.f1tipcorners.pop(0)
                    self.f1tipcorners.append(corners[i])
                    corners[i]=np.average(self.f1tipcorners,axis=0)
                if ids[i] == finger2_dist_id:
                    if len(self.f2distcorners)>5:
                        self.f2distcorners.pop(0)
                    self.f2distcorners.append(corners[i])
                    corners[i]=np.average(self.f2distcorners,axis=0)
                if ids[i]==finger2_tip_id:
                    if len(self.f2tipcorners)>5:
                        self.f2tipcorners.pop(0)
                    self.f2tipcorners.append(corners[i])
                    corners[i]=np.average(self.f2tipcorners,axis=0)

            rvec, tvec, __ = aruco.estimatePoseSingleMarkers(corners,marker_size, mtx, dist)
            all_rotations=[0,0,0,0,0,0]
            all_shifts=[0,0,0,0,0,0]
            #rvec is rotation from marker frame to camera frame I THINK, NOT SURE.
            #From there, we need to change the tvecs, which currently give me the distance from the marker to the camera
            #in that marker's coordinate frame to give the distance from the camera to the finger/object center
            #in camera frame. That way we can do a rotation to get the distance from the palm to the fingers/object
            for i in range(ids.size):
                rotation=R.from_rotvec(rvec[i][0])
                #Draw reference frame for the marker
                # Save end-effector marker pose
                if ids[i] == ee_marker_id:
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    all_rotations[0]=rotation.inv()
                    ee_marker1 = tvec[i][0]
                    ee_marker = np.copy(tvec[i][0])
                    shift=np.matmul(rotation.as_matrix(),[0,2.6,0])
                    all_shifts[0]=shift
                    local_rotation=np.copy(rotation.inv().as_matrix())
                    ee_marker1[0] = ee_marker1[0] + shift[0]
                    ee_marker1[1] = ee_marker1[1] + shift[1] #52.41 mm offset in Y
                    ee_marker1[2] = ee_marker1[2] + shift[2] #35.56 mm offset in z
                    if self.prev_ee_rvec==[]:
                        self.prev_ee_rvec=np.copy(local_rotation)
                        self.prev_ee_tvec=np.copy(ee_marker1)
                # Save object marker pose
                if ids[i] == obj_marker_id:
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    obj_marker = np.copy(tvec[i][0])
                    obj_marker1 = tvec[i][0]
                    flag1=False
                    shift=np.matmul(rotation.as_matrix(),[0,0,-5.5])
                    all_shifts[-1]=shift
                    all_rotations[-1]=rotation
                    obj_marker1[0] = obj_marker1[0] + shift[0]
                    obj_marker1[1] = obj_marker1[1] + shift[1]
                    obj_marker1[2] = obj_marker1[2] + shift[2]  ###Since Object height in z is 110 mm. Subtracting 55 mm brings center to object center
                # Save finger1 Dist marker pose
                if ids[i] == finger1_dist_id:
                    f1_rotation=np.copy(rotation.as_matrix())
                    finger1_dist = np.copy(tvec[i][0])
                    finger1_dist1 = tvec[i][0]
                    shift=np.matmul(rotation.as_matrix(),[4.7,-0.1,0])
                    all_shifts[1]=shift
                    finger1_dist1[0] = finger1_dist[0] + shift[0]
                    finger1_dist1[1] = finger1_dist[1] + shift[1]
                    finger1_dist1[2] = finger1_dist[2] + shift[2]
                    all_rotations[1]=rotation
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)

                # Save finger1 tip pose
                if ids[i] == finger1_tip_id:
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    shift=np.matmul(rotation.as_matrix(),[4.3,-2.7,0])
                    finger1_tip = np.copy(tvec[i][0])
                    finger1_tip1 = tvec[i][0]
                    all_shifts[2]=shift
                    #print('f1 z',finger1_tip[-1])
                    finger1_tip1[0] = finger1_tip[0] + shift[0]
                    finger1_tip1[1] = finger1_tip[1] + shift[1]
                    finger1_tip1[2] = finger1_tip[2]+ shift[2]
                    all_rotations[2]=rotation
                # Save finger2 Dist marker pose
                if ids[i] == finger2_dist_id:
                    f2_rotation=np.copy(rotation.as_matrix())
                    shift=np.matmul(rotation.as_matrix(),[4.4,-0.1,0])
                    all_shifts[3]=shift
                    finger2_dist = np.copy(tvec[i][0])
                    finger2_dist1 = tvec[i][0]
                    finger2_dist1[0] = finger2_dist[0] + shift[0]
                    finger2_dist1[1] = finger2_dist[1] + shift[1]
                    finger2_dist1[2] = finger2_dist[2] + shift[2]
                    all_rotations[3]=rotation
                # Save finger2 tip pose
                if ids[i] == finger2_tip_id:
                    shift=np.matmul(rotation.as_matrix(),[4.3,2.7,0])
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    all_shifts[4]=shift
                    finger2_tip = np.copy(tvec[i][0])
                    finger2_tip1 = tvec[i][0]
                    #print('f2 z',finger2_tip[-1])
                    finger2_tip1[0] = finger2_tip[0] + shift[0]
                    finger2_tip1[1] = finger2_tip[1] + shift[1]
                    finger2_tip1[2] = finger2_tip[2] + shift[2]
                    all_rotations[4]=rotation
                aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
            if (len(ee_marker)==0)&(len(self.prev_ee_rvec)>0):
                aruco.drawAxis(cv_image, mtx, dist, self.prev_ee_rvec, self.prev_ee_tvec, 2)
                
            #Draw Markers
            aruco.drawDetectedMarkers(cv_image, corners, ids)
            #print(ee_marker,finger1_dist,finger2_dist,finger1_tip,finger2_tip)
            avg_z=np.average([ee_marker[-1],finger1_dist[-1],finger2_dist[-1],finger1_tip[-1],finger2_tip[-1]])
            Z_dist=avg_z
            #print('Z dist',Z_dist)
            ee_marker=fix_z(ee_marker1,Z_dist)
            finger1_dist=fix_z(finger1_dist1,Z_dist)
            finger1_tip=fix_z(finger1_tip1,Z_dist)
            finger2_dist=fix_z(finger2_dist1,Z_dist)
            finger2_tip=fix_z(finger2_tip1,Z_dist)
            
            #obj_marker=fix_z(obj_marker,Z_dist)
            '''
            finger2_tip[0] = finger2_tip[0] + all_shifts[4][0]
            finger2_tip[1] = finger2_tip[1] + all_shifts[4][1]
            finger2_tip[2] = finger2_tip[2] + all_shifts[4][2]
            finger2_dist[0] = finger2_dist[0] + all_shifts[3][0]
            finger2_dist[1] = finger2_dist[1] + all_shifts[3][1]
            finger2_dist[2] = finger2_dist[2] + all_shifts[3][2]
            finger1_tip[0] = finger1_tip[0] + all_shifts[2][0]
            finger1_tip[1] = finger1_tip[1] + all_shifts[2][1]
            finger1_tip[2] = finger1_tip[2]+ all_shifts[2][2]
            finger1_dist[0] = finger1_dist[0] + all_shifts[1][0]
            finger1_dist[1] = finger1_dist[1] + all_shifts[1][1]
            finger1_dist[2] = finger1_dist[2] + all_shifts[1][2]
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
            if len(ee_marker) > 0 and len(obj_marker) > 0 :
                #print('object marker and ee marker',obj_marker,ee_marker)
                # Get the pose of object with respect to end-effector 
                object_pose = [(x - y)/100 for x, y in zip(obj_marker,ee_marker)] # Prints in milimeters. Default is cm.
                object_pose=np.matmul(local_rotation,object_pose)
                # object_pose: [x,y,z]
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[1].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                #print('finger 1 proximal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[2].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                #print('finger 1 distal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[3].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                #print('finger 2 proximal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[4].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                #print('finger 2 distal rot',new_rot.as_euler('xyz')[-1]*180/np.pi)
                #print('rotations',all_rotations[0].as_euler('xyz'), all_rotations[4].as_euler('xyz'))
                #print("Object Distance: " +str(object_pose))
                count += 1
            
            if len(finger1_dist) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
                #print('pre rotation values',finger1_dist,ee_marker,finger2_dist)
                
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[1].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                finger_angles.append(90+theta)
                
                
                finger_pose_local = [(x - y)/100 for x, y in zip(finger1_dist,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                
                # Get the distance between object and finger 1

                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger1_dist,obj_marker)])
                #dist = [math.sqrt(x)*10.0 for x in delta_pose]
                finger_object_dist.append(dist)
                #print("Finger1 Dist to object: " +str(dist))
                count += 1

                # finger1_dist to object distance: finger_object_dist[0]
            
            if len(finger1_tip) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
            
                overall_angle=np.matmul(all_rotations[1].inv().as_matrix(),all_rotations[2].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                finger_angles.append(180+abs(theta))
                
                finger_pose_local = [(x - y)/100 for x, y in zip(finger1_tip,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))

                delta_pose = 0
                # Get the distance between object and finger 
                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger1_tip,obj_marker)])
                finger_object_dist.append(dist)
                #print("Finger1 tip to object: " +str(dist1))
                count += 1

                # finger1_tip to object distance: finger_object_dist[1]
                
            if len(finger2_dist) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
            
                overall_angle=np.matmul(all_rotations[0].as_matrix(),all_rotations[3].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                finger_angles.append(270-theta)
                
                finger_pose_local = [(x - y)/100 for x, y in zip(finger2_dist,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                #finger_pose.append(finger_pose_local1[1])
                #finger_pose.append(finger_pose_local1[2])
                #print("Finger2 Proximal to Object relative pose: ", finger_pose[2][0:3])

                # finger2_dist to object pose: finger_pose[6:9]
            
                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger2_dist,obj_marker)])
               
                # finger2_dist to object distance: finger_object_dist[2] 

                finger_object_dist.append(dist)
                #print("Finger2 Dist to object: " +str(dist2))
                count += 1
            
            if len(finger2_tip) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
            
                overall_angle=np.matmul(all_rotations[3].inv().as_matrix(),all_rotations[4].as_matrix())
                new_rot=R.from_matrix(overall_angle)
                theta=new_rot.as_euler('xyz')[-1]*180/np.pi
                finger_angles.append(180+abs(theta))
                
                finger_pose_local = [(x - y)/100 for x, y in zip(finger2_tip,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))  
                #finger_pose.append(finger_pose_local2[1])
                #finger_pose.append(finger_pose_local2[2])
                #print("Finger2 tip to Object relative pose: ", finger_pose[3][0:3])
            
            
                # finger2_tip to object pose: finger_pose[6], finger_pose[7]
                
                # Get the distance between object and finger 
                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger2_tip,obj_marker)])
                
                
                # finger2_tip to object distance: finger_object_dist[3]

                finger_object_dist.append(dist)
                # finger_object_dist.append(dist1)
                # finger_object_dist.append(dist2)

                #print("Finger2 tip to object: " +str(dist))
                count += 1
            #print('calculated finger angles',finger_angles)
            #old method of finding finger angles
            '''
            old_finger_angles=[]
            if (len(f1_rotation) >0)&(len(f2_rotation)>0)&(len(local_rotation)>0)&(len(finger2_tip)>0)&(len(finger1_tip)>0):
                shift=np.matmul(f1_rotation,[0,-2.7,0])
                a=np.copy(ee_marker)
                b=np.copy(finger1_dist)
                b=b+shift
                c=np.copy(finger1_dist)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger1_dist_id], b, 2)
                old_finger_angles.append(angle*180/np.pi)
                
                shift=np.matmul(f1_rotation,[0,2.7,0])
                a=np.copy(finger1_dist)
                b=np.copy(finger1_dist)
                b=b+shift
                c=np.copy(finger1_tip)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                check=np.matmul(np.transpose(f1_rotation),finger1_tip)
                check=check-np.matmul(np.transpose(f1_rotation),finger1_dist)
                if check[0] <0:
                    angle=2*np.pi-angle
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger1_tip_id], b, 2)
                old_finger_angles.append(angle*180/np.pi)
                
                shift=np.matmul(f2_rotation,[0,2.7,0])
                a=np.copy(ee_marker)
                b=np.copy(finger2_dist)
                b=b+shift
                c=np.copy(finger2_dist)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger2_dist_id], b, 2)
                old_finger_angles.append(angle*180/np.pi)
                f2_rotation
                shift=np.matmul(f2_rotation,[0,-2.7,0])
                a=np.copy(finger2_dist)
                b=np.copy(finger2_dist)
                b=b+shift
                c=np.copy(finger2_tip)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                check=np.matmul(np.transpose(f2_rotation),finger2_tip)
                check=check-np.matmul(np.transpose(f2_rotation),finger2_dist)
                if check[0] <0:
                    angle=2*np.pi-angle
                #print('angle 1 and 2',a1,a2)
                #print('final angle',angle)
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger2_tip_id], b, 2)
                old_finger_angles.append(angle*180/np.pi)

            #print('finger angles',np.array(finger_angles)*180/np.pi)
            '''
            #even older method to find finger angles
            '''
            if m1 > m2:
                #finger2_dist_angle = np.atan((m2- m1)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                finger2_dist_angle = np.pi*2 - np.arctan((m2 - m1)/(1+ m1*m2))  ###  ->   <  this side angle of finger
            else:
                  #finger2_dist_angle = np.atan((m1 - m2)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                finger2_dist_angle = np.pi*2 - np.arctan((m1 - m2)/(1+ m1*m2))  ###  ->   <  this side angle of finger
                             
            m3 = (finger1_dist1[1] - finger1_dist[1])/(finger1_dist1[0] - finger1_dist[0]) 
            m4 = (finger1_tip1[1] - finger1_tip[1])/(finger1_tip1[0] - finger1_tip[0]) 
            
            if m3 > m4:
                #finger1_dist_angle = np.atan((m3 - m4)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                finger1_dist_angle = np.pi*2 - np.arctan((m3 - m4)/(1+ m3*m4))  ###  ->   <  this side angle of finger
            else:
                  #finger1_dist_angle = np.atan((m4 - m3)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                finger1_dist_angle = np.pi*2 - np.arctan((m4 - m3)/(1+ m3*m4))  ###  ->   <  this side angle of finger  
            '''

            #print('finger obj dist',finger_object_dist)
            #print('finger pose',finger_pose)
            cv2.imshow('Window', cv_image)
        
            cv2.waitKey(3)
            filename='image'+str(im_num)+'.png'
                #print(filename)
            cv2.imwrite(filename,gray)
            #self.finger2_dist_angle_pub.publish(finger2_dist_angle)

            # TODO: WTF IS THIS COUNT VARIABLE??
            if count > 4:
                print('the count is more than 4')

                count = 0 
                im_num+=1

                # we are publishing a float32. numpy array. where's the numpy wrapper?
                publisher=Float32MultiArray()
                publisher.layout.dim.append(MultiArrayDimension())
                publisher.layout.dim[0].label = 'angles'
                publisher.layout.dim[0].size = 4
                publisher.layout.dim[0].stride = 4
                if len(finger_angles)==4:
                    publisher.data=finger_angles
                    self.finger_angle_pub.publish(publisher)
                    #print('finger angles', finger_angles)

                # publish the finger distances to objects
                if len(finger_object_dist) == 4:
                    publisher.layout.dim[0].label = 'finger object dist'
                    publisher.data=finger_object_dist
                    print('finger obj dist',finger_object_dist)
                    self.finger_dist_pub.publish(publisher)
                    
                    
                if len(object_pose) == 3:
                    #print('object pose',object_pose)
                    publisher.layout.dim[0].label = 'object pose'
                    publisher.layout.dim[0].size = 3
                    publisher.layout.dim[0].stride = 3
                    publisher.data=object_pose
                    self.pose_pub.publish(publisher)
                    
                    
                if len(finger_pose) == 4:
                    #print('finger pose',finger_pose)
                    self.finger_poses.append(finger_pose)
                    finger_array=np.array(self.finger_poses)
                    temp=[]
                    temp.append(np.average(finger_array,axis=0))
                    #print('average finger pose',temp)
                    err_matrix=np.array(temp)
                    #open hand err matrix
                    err_matrix=err_matrix-np.array([[-0.05,0.024,0],[-0.063,0.055,0],[0.05,0.024,0],[0.063,0.055,0]])
                    #closed hand err matrix
                    #err_matrix=err_matrix-np.array([[-0.026,0.03,0],[-0.01,0.052,0],[0.026,0.03,0],[0.01,0.052,0]])
                    #print('error in average finger pose',err_matrix)
                    #print('err_matrix part',err_matrix[0,:,0])
                    xerr=np.average(np.abs(err_matrix[0,:,0]))
                    yerr=np.average(np.abs(err_matrix[0,:,1]))
                    toterr=np.average(np.abs(err_matrix[0,:,0:2]))
                    #print('x err',xerr)
                    #print('y err',yerr)
                    #print('total err',toterr)
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
                    self.validation_checker.publish(publisher)
                #filename='image'+str(im_num)+'.png'
                #print(filename)
                #cv2.imwrite(filename,gray)
            #else: 
                #print("Not all Markers Found")      

        #Display
        cv2.imshow('Window', cv_image)
        
        cv2.waitKey(3)
        
    
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
