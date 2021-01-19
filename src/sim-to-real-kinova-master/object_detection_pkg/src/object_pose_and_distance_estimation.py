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
        ee_marker_id = 647  # end-effector
        obj_marker_id = 509  # object
        finger1_dist_id = 634 # Finger 1 Dist
        finger1_tip_id = 139  # Finger 1 Tip
        finger2_dist_id = 297 # Finger 2 Dist  
        finger2_tip_id = 524  # Finger 1 Tip

        # Get the saved camera and distortion matrices from calibration
        #mtx = np.load('/home/nigel/kinova_ws/kinova_pkg/src/camera_mtx.npy') # camera matrix
        #dist = np.load('/home/nigel/kinova_ws/kinova_pkg/src/dist_mtx.npy')  # distortion matrix
        mtx = np.load('/home/nigel/camera_mtx2.npy') # camera matrix
        dist = np.load('/home/nigel/dist_mtx2.npy')  # distortion matrix
        #mtx = np.load('/home/nigel/charuco_cam.npy') # camera matrix
        #dist = np.load('/home/nigel/charuco_dist.npy')  # distortion matrix
        # Define Aruco Dictionary 
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_ARUCO_ORIGINAL)
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
        print('ids',ids)
        #print(corners, rejected)
        flag1=True
        if np.all(ids != None):
            for i in range(ids.size):
                if ids[i] == ee_marker_id:
                    if len(self.ee_corners)>25:
                        self.ee_corners.pop(0)
                    self.ee_corners.append(corners[i])
                    corners[i]=np.average(self.ee_corners,axis=0)
                if ids[i]==obj_marker_id:
                    flag1=False
                    if len(self.obj_corners)>25:
                        self.obj_corners.pop(0)
                    self.obj_corners.append(corners[i])
                    corners[i]=np.average(self.obj_corners,axis=0)
                if ids[i] == finger1_dist_id:
                    if len(self.f1distcorners)>25:
                        self.f1distcorners.pop(0)
                    self.f1distcorners.append(corners[i])
                    corners[i]=np.average(self.f1distcorners,axis=0)
                if ids[i]==finger1_tip_id:
                    if len(self.f1tipcorners)>25:
                        self.f1tipcorners.pop(0)
                    self.f1tipcorners.append(corners[i])
                    corners[i]=np.average(self.f1tipcorners,axis=0)
                if ids[i] == finger2_dist_id:
                    if len(self.f2distcorners)>25:
                        self.f2distcorners.pop(0)
                    self.f2distcorners.append(corners[i])
                    corners[i]=np.average(self.f2distcorners,axis=0)
                if ids[i]==finger2_tip_id:
                    if len(self.f2tipcorners)>25:
                        self.f2tipcorners.pop(0)
                    self.f2tipcorners.append(corners[i])
                    corners[i]=np.average(self.f2tipcorners,axis=0)

            rvec, tvec, __ = aruco.estimatePoseSingleMarkers(corners,marker_size, mtx, dist)
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

                    ee_marker = tvec[i][0]
                    shift=np.matmul(rotation.as_matrix(),[0,3.2,0])
                    local_rotation=np.copy(rotation.inv().as_matrix())
                    ee_marker[0] = ee_marker[0] + shift[0]
                    ee_marker[1] = ee_marker[1] + shift[1] #52.41 mm offset in Y
                    ee_marker[2] = ee_marker[2] + shift[2] #35.56 mm offset in z
                    if self.prev_ee_rvec==[]:
                        self.prev_ee_rvec=np.copy(local_rotation)
                        self.prev_ee_tvec=np.copy(ee_marker)
                # Save object marker pose
                if ids[i] == obj_marker_id:
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    obj_marker = tvec[i][0]
                    flag1=False
                    shift=np.matmul(rotation.as_matrix(),[0,0,-5.5])
                    #shift=np.array([0,0,-5.5])
                    obj_marker[0] = obj_marker[0] + shift[0]
                    obj_marker[1] = obj_marker[1] + shift[1]
                    obj_marker[2] = obj_marker[2] + shift[2]  ###Since Object height in z is 110 mm. Subtracting 55 mm brings center to object center 
                # Save finger1 Dist marker pose
                if ids[i] == finger1_dist_id:
                    f1_rotation=np.copy(rotation.as_matrix())
                    finger1_dist = tvec[i][0]
                    finger1_dist1 = tvec[i][0]
                    shift=np.matmul(rotation.as_matrix(),[4.7,-0.3,0])
                    finger1_dist1[0] = finger1_dist[0] + shift[0]
                    finger1_dist1[1] = finger1_dist[1] + shift[1]
                    finger1_dist1[2] = finger1_dist[2] + shift[2]
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)

                # Save finger1 tip pose
                if ids[i] == finger1_tip_id:
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    shift=np.matmul(rotation.as_matrix(),[-3.7,-1.7,0])
                    finger1_tip = tvec[i][0]
                    finger1_tip1 = tvec[i][0]
                    finger1_tip1[0] = finger1_tip[0] + shift[0]
                    finger1_tip1[1] = finger1_tip[1] + shift[1]
                    finger1_tip1[2] = finger1_tip[2]+ shift[2]
                    
                # Save finger2 Dist marker pose
                if ids[i] == finger2_dist_id:
                    f2_rotation=np.copy(rotation.as_matrix())
                    shift=np.matmul(rotation.as_matrix(),[4.4,0.1,0])
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    finger2_dist = tvec[i][0]
                    finger2_dist1 = tvec[i][0]
                    finger2_dist1[0] = finger2_dist[0] + shift[0]
                    finger2_dist1[1] = finger2_dist[1] + shift[1]
                    finger2_dist1[2] = finger2_dist[2] + shift[2]

                # Save finger2 tip pose
                if ids[i] == finger2_tip_id:
                    shift=np.matmul(rotation.as_matrix(),[4.3,-1.7,0])
                    print('starting tvec',tvec[i][0])
                    #aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
                    finger2_tip = tvec[i][0]
                    finger2_tip1 = tvec[i][0]
                    finger2_tip1[0] = finger2_tip[0] + shift[0]
                    finger2_tip1[1] = finger2_tip[1] + shift[1]
                    finger2_tip1[2] = finger2_tip[2] + shift[2]
                    print('ending tvec',tvec[i][0])
                aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)
            if (ee_marker==[])&(self.prev_ee_rvec!=[]):
                aruco.drawAxis(cv_image, mtx, dist, self.prev_ee_rvec, self.prev_ee_tvec, 2)
                
            #Draw Markers
            aruco.drawDetectedMarkers(cv_image, corners, ids)
            ee_marker=fix_z(ee_marker,55)
            finger1_dist=fix_z(finger1_dist,55)
            finger1_tip=fix_z(finger1_tip,55)
            finger2_dist=fix_z(finger2_dist,55)
            finger2_tip=fix_z(finger2_tip,55)
            #cv2.imshow('window',elf.prev_ee_tvec
            # For indexingcv_image)
            #cv2.waitKey()
            count = 0
            if (f1_rotation != []) & (f2_rotation !=[]) & (len(local_rotation) > 0):
                if abs(f1_rotation[-1][-1]-f2_rotation[-1][-1]) < 0.1:
                    if abs(f1_rotation[-1][-1]-local_rotation[-1][-1]) <0.05:
                        self.prev_ee_rvec=np.copy(local_rotation)
                        self.prev_ee_tvec=np.copy(ee_marker)
                    else:
                        local_rotation=self.prev_ee_rvec
                        ee_marker=s
            n = len(finger_pose) - 3
            n_next = len(finger_pose)
            obj_marker=[0,0,0]
            if len(ee_marker) > 0 and len(obj_marker) > 0 :
                # Get the pose of object with respect to end-effector 
                object_pose = [(x - y)/100 for x, y in zip(obj_marker,ee_marker)] # Prints in milimeters. Default is cm.
                object_pose=np.matmul(local_rotation,object_pose)
                # object_pose: [x,y,z]

                #print("Object Distance: " +str(object_pose))
                count += 1
            
            if len(finger1_dist) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
                print('pre rotation values',finger1_dist,ee_marker,finger2_dist)
                Z_dist=55

                finger_pose_local = [(x - y)/100 for x, y in zip(finger1_dist,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                
                print('current method',list(np.matmul(local_rotation,finger_pose_local)))
                '''
                finger1_dist[0]=finger1_dist[0]*55/abs(finger1_dist[-1])
                finger1_dist[1]=finger1_dist[1]*55/abs(finger1_dist[-1])
                finger1_dist[2]=np.sign(finger1_dist[2])*55
                ee_marker[0]=ee_marker[0]*55/abs(ee_marker[-1])
                ee_marker[1]=ee_marker[1]*55/abs(ee_marker[-1])
                ee_marker[2]=np.sign(ee_marker[2])*55
                '''
                #print('post tweak values',finger1_dist,ee_marker)
                #finger_pose_local = [(x - y)/100 for x, y in zip(finger1_dist,ee_marker)]
                #print('method that removes z component',list(np.matmul(local_rotation,finger_pose_local)))
                print('current rotation matrix',local_rotation)
                print('desired value',[0.051,0.025,0.0])
                #print('finger location',finger_pose)
                #finger_pose.append(finger_pose_local[1])
                #finger_pose.append(finger_pose_local[2])
                #print("Finger1_Proximal to Object relative pose: ", finger_pose[0:3])
                # print("Finger1_Proximal to Object relative pose: ", finger_pose[n:n_next])

                # finger1_dist to obj pose: finger_pose[0:3]
            
            
                # Get the distance between object and finger 1

                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger1_dist,obj_marker)])
                #dist = [math.sqrt(x)*10.0 for x in delta_pose]
                finger_object_dist.append(dist)
                #print("Finger1 Dist to object: " +str(dist))
                count += 1

                # finger1_dist to object distance: finger_object_dist[0]
            
            if len(finger1_tip) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
            
                finger_pose_local = [(x - y)/100 for x, y in zip(finger1_tip,ee_marker)]
                finger_pose.append(list(np.matmul(local_rotation,finger_pose_local)))
                #finger_pose.append(finger_pose_local[1])
                #finger_pose.append(finger_pose_local[2])
                #print("Finger1 tip to Object relative pose: ", finger_pose[1][0:3])

                # finger1_tip to obj pose: finger_pose[3:6]
            
                delta_pose = 0
                # Get the distance between object and finger 
                dist =np.linalg.norm([(x - y)/100 for x, y in zip(finger1_tip,obj_marker)])
                finger_object_dist.append(dist)
                #print("Finger1 tip to object: " +str(dist1))
                count += 1

                # finger1_tip to object distance: finger_object_dist[1]
                
            if len(finger2_dist) > 0 and len(ee_marker) > 0 and len(obj_marker) > 0:
            
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
            #print('object location, should be -0.15,0.1',object_pose)
            #print(np.array(local_rotation[-1,-1])-np.array(f1_rotation[-1,-1]))
            #print(f2_rotation)

            #print('finger locations',finger_pose)
            #print('finger obj dists',finger_object_dist)
            #print('diffs',finger_pose[0][0]+finger_pose[2][0],finger_pose[1][0]+finger_pose[3][0])
            finger_angles=[]
            if (f1_rotation != [])&(f2_rotation !=[])&(len(local_rotation)>0)&(len(finger2_tip)>0)&(len(finger1_tip)>0):
                shift=np.matmul(f1_rotation,[0,-2.7,0])
                a=np.copy(ee_marker)
                b=np.copy(finger1_dist)
                b=b+shift
                c=np.copy(finger1_dist)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger1_dist_id], b, 2)
                finger_angles.append(angle)
                
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
                finger_angles.append(angle)
                
                shift=np.matmul(f2_rotation,[0,2.7,0])
                a=np.copy(ee_marker)
                b=np.copy(finger2_dist)
                b=b+shift
                c=np.copy(finger2_dist)
                a1=np.array([b[0]-a[0],b[1]-a[1]])
                a2=np.array([b[0]-c[0],b[1]-c[1]])
                angle=np.arccos(np.dot(a1,a2)/(np.linalg.norm(a1)*np.linalg.norm(a2)))
                #aruco.drawAxis(cv_image, mtx, dist, rvec[finger2_dist_id], b, 2)
                finger_angles.append(angle)
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
                finger_angles.append(angle)

            #print('finger angles',np.array(finger_angles)*180/np.pi)
            
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
            
            #self.finger2_dist_angle_pub.publish(finger2_dist_angle)
            if count > 4:
                count = 0 
                im_num+=1
                publisher=Float32MultiArray()
                publisher.layout.dim.append(MultiArrayDimension())
                publisher.layout.dim[0].label = 'angles'
                publisher.layout.dim[0].size = 4
                publisher.layout.dim[0].stride = 4
                if len(finger_angles)==4:
                    
                    publisher.data=finger_angles
                    self.finger_angle_pub.publish(publisher)
                    #print('eyy')
                if len(finger_object_dist) == 4:
                    publisher.layout.dim[0].label = 'finger object dist'
                    publisher.data=finger_object_dist
                    #print('finger obj dist',finger_object_dist)
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
                    print('average finger pose',temp)
                    publisher.layout.dim[0].label = 'x,y,z'
                    publisher.layout.dim[0].size = 12
                    publisher.layout.dim[0].stride = 12
                    finger_pose=np.array(finger_pose)
                    finger_pose=list(finger_pose.flatten())
                    publisher.data=finger_pose
                    self.finger_pose_pub.publish(publisher)
                
                    #self.marker_pub.publish(str(obj_marker_id))
                
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
    a.get_object_pose('/home/nigel/testing_imgs/calibrationimage0.jpg')
    cv2.destroyAllWindows()
    '''

if __name__ == '__main__':
    main(sys.argv)
