#!/usr/bin/env python

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from std_msgs.msg import String, Float32, Float32MultiArray
import numpy as np
import cv2.aruco as aruco
import sys
import math


class ImageProcessor():
    def __init__(self):
        # Object pose publisher
        self.pose_pub = rospy.Publisher("/object_pose", Float32, queue_size=10)
        # Marker ID publisher 
        self.marker_pub = rospy.Publisher('/marker_id', String, queue_size=10)
        # Finger object distance publisher
        self.finger_dist_pub = rospy.Publisher("/finger_dist", Float32, queue_size=10)
        self.finger_pose_pub = rospy.Publisher("/finger_pose", Float32, queue_size=10)
        
        self.finger1_dist_angle_pub = rospy.Publisher("/finger1_dist_angle", Float32, queue_size=10)
        self.finger2_dist_angle_pub = rospy.Publisher("/finger2_dist_angle", Float32, queue_size=10)
        
        #cv bridge class
        self.bridge = CvBridge()

        # This is the image message subcriber. Change the topic to your camera topic (most likely realsense)
        self.image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, self.get_object_pose)
        
    # Callback for image processing
    def get_object_pose(self, img_msg):
        # Aruko Marker Info

        ##Box Pixel values in the Image##
        x = 600 # Start Pixel in Height
        y = 250 # Start Pixel in Width
        h = 500 # Height in pixels    
        w = 700 # Width in pixels
        
        marker_size = 2 #cm 

        # Marker IDs
        ee_marker_id = 5  # end-effector
        obj_marker_id = 0  # object
        finger1_dist_id = 3 # Finger 1 Dist
        finger1_tip_id = 2  # Finger 1 Tip
        finger2_dist_id = 4 # Finger 2 Dist  
        finger2_tip_id = 1  # Finger 1 Tip

        # Get the saved camera and distortion matrices from calibration
        mtx = np.load('/home/nuha/kinova_ws/src/traj-control/src/camera_mtx.npy') # camera matrix
        dist = np.load('/home/nuha/kinova_ws/src/traj-control/src/dist_mtx.npy')  # distortion matrix

        # Define Aruco Dictionary 
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_1000)
        parameters = aruco.DetectorParameters_create()

        #Lists for storing marker positions
        ee_marker = []
        obj_marker = []
        finger1_dist = []
        finger1_tip = []
        finger2_dist = []
        finger2_tip = []
        finger_object_dist = []
        finger_object_pose = []
        finger1_tip1 = []
        finger1_dist1 = []
        finger2_tip1 = []
        finger2_dist1 = []

    
        #Convert ros image message to opencv image

        try:
            cv_image = self.bridge.imgmsg_to_cv2(img_msg, "bgr8")
        except CvBridgeError as e:
            print(e)

        #Cropping Image
        cv_image = cv_image[y:y+h, x:x+w]

        #Convert in gray scale
        gray = cv2.cvtColor(cv_image,cv2.COLOR_BGR2GRAY)

        #Find markers in the image 
        corners, ids, rejected = aruco.detectMarkers(image=gray, dictionary=aruco_dict, parameters=parameters, cameraMatrix=mtx, distCoeff=dist)

        if np.all(ids != None):

            rvec, tvec, __ = aruco.estimatePoseSingleMarkers(corners,marker_size, mtx, dist)
            
            for i in range(ids.size):
                #Draw reference frame for the marker
                
                # Save end-effector marker pose
                if ids[i] == ee_marker_id:
                    ee_marker = tvec[i]
                    ee_marker[1] = ee_marker[1] + 5.241 #52.41 mm offset in Y
                    ee_marker[2] = ee_marker[2] - 3.556 #35.56 mm offset in z

                # Save object marker pose
                if ids[i] == obj_marker_id:
                    obj_marker = tvec[i]
                    obj_marker[2] = obj_marker[2] - 5.5  ###Since Object height in z is 110 mm. Subtracting 55 mm brings center to object center 
                    
                # Save finger1 Dist marker pose
                if ids[i] == finger1_dist_id:
                    finger1_dist = tvec[i]
                    finger1_dist1[0] = finger1_dist[0] 
                    finger1_dist1[1] = finger1_dist[1] + 35.38
                    finger1_dist1[2] = finger1_dist[2]

                # Save finger1 tip pose
                if ids[i] == finger1_tip_id:
                    finger1_tip = tvec[i]
                    finger1_tip1[0] = finger1_tip[0] 
                    finger1_tip1[1] = finger1_tip[1] - 4.27
                    finger1_tip1[2] = finger1_tip[2]
                    
                # Save finger2 Dist marker pose
                if ids[i] == finger2_dist_id:
                    finger2_dist = tvec[i]
                    finger2_dist1[0] = finger2_dist[0] 
                    finger2_dist1[1] = finger2_dist[1] + 35.38
                    finger2_dist1[2] = finger2_dist[2]

                # Save finger2 tip pose
                if ids[i] == finger2_tip_id:
                    finger2_tip = tvec[i]
                    finger2_tip1[0] = finger2_tip[0] 
                    finger2_tip1[1] = finger2_tip[1] - 4.27
                    finger2_tip1[2] = finger2_tip[2]

                aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 2)

            #Draw Markers
            aruco.drawDetectedMarkers(cv_image, corners, ids)
            count = 0

            # For indexing
            n = len(finger_object_pose) - 3
            n_next = len(finger_object_pose)

            if len(ee_marker) > 0 and len(obj_marker) > 0 :
                # Get the pose of object with respect to end-effector 
                object_pose = [(x - y)*10.0 for x, y in zip(obj_marker, ee_marker)] # Prints in milimeters. Default is cm.

                # object_pose: [x,y,z]

                print("Object Distance: " +str(object_pose))
                count += 1
            
            if len(finger1_dist) > 0 and len(obj_marker) > 0 :
                
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger1_dist)]
                finger_object_pose.append(finger_object_pose_local[0][0])  
                finger_object_pose.append(finger_object_pose_local[0][1])
                finger_object_pose.append(finger_object_pose_local[0][2])
                print("Finger1_Proximal to Object relative pose: ", finger_object_pose[0:3])
                # print("Finger1_Proximal to Object relative pose: ", finger_object_pose[n:n_next])

                # finger1_dist to obj pose: finger_object_pose[0:3]
            
            
                # Get the distance between object and finger 1

                dist = math.sqrt(sum([x**2 for x in finger_object_pose[0:3]]))
                #dist = [math.sqrt(x)*10.0 for x in delta_pose]
                finger_object_dist.append(dist)
                print("Finger1 Dist to object: " +str(dist))
                count += 1

                # finger1_dist to object distance: finger_object_dist[0]
            
            if len(finger1_tip) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger1_tip)]
                finger_object_pose.append(finger_object_pose_local[0][0])
                finger_object_pose.append(finger_object_pose_local[0][1])
                finger_object_pose.append(finger_object_pose_local[0][2])
                print("Finger1 tip to Object relative pose: ", finger_object_pose[3:6])

                # finger1_tip to obj pose: finger_object_pose[3:6]
            
                delta_pose = 0
                # Get the distance between object and finger 
                dist1 = math.sqrt(sum([x**2 for x in finger_object_pose[3:6]]))
                finger_object_dist.append(dist1)
                print("Finger1 tip to object: " +str(dist1))
                count += 1

                # finger1_tip to object distance: finger_object_dist[1]
                
            if len(finger2_dist) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local1 = [(x - y)*10.0 for x, y in zip(obj_marker, finger2_dist)]
                finger_object_pose.append(finger_object_pose_local1[0][0])
                finger_object_pose.append(finger_object_pose_local1[0][1])
                finger_object_pose.append(finger_object_pose_local1[0][2])
                print("Finger2 Proximal to Object relative pose: ", finger_object_pose[6:9])

                # finger2_dist to object pose: finger_object_pose[6:9]
            
                dist2 = math.sqrt(sum([x**2 for x in finger_object_pose[6:9]]))
               
                # finger2_dist to object distance: finger_object_dist[2] 

                finger_object_dist.append(dist2)
                print("Finger2 Dist to object: " +str(dist2))
                count += 1
            
            if len(finger2_tip) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local2 = [(x - y)*10.0 for x, y in zip(obj_marker, finger2_tip)]
                finger_object_pose.append(finger_object_pose_local2[0][0])
                finger_object_pose.append(finger_object_pose_local2[0][1])
                finger_object_pose.append(finger_object_pose_local2[0][2])
                print("Finger2 tip to Object relative pose: ", finger_object_pose[9:12])
            
            
                # finger2_tip to object pose: finger_object_pose[6], finger_object_pose[7]
                
                # Get the distance between object and finger 
                dist3 = math.sqrt(sum([x**2 for x in finger_object_pose[9:12]]))
                
                
                # finger2_tip to object distance: finger_object_dist[3]

                finger_object_dist.append(dist3)
                # finger_object_dist.append(dist1)
                # finger_object_dist.append(dist2)

                print("Finger2 tip to object: " +str(dist3))
                count += 1
            
            m1 = (finger2_dist1[1] - finger2_dist[1])/(finger2_dist1[0] - finger2_dist[0]) 
            m2 = (finger2_tip1[1] - finger2_tip[1])/(finger2_tip1[0] - finger2_tip[0]) 
            
            if m1 > m2:
                #finger2_dist_angle = np.atan((m2- m1)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                finger2_dist_angle = np.pi*2 - np.atan((m2 - m1)/(1+ m1*m2))  ###  ->   <  this side angle of finger
            else:
                  #finger2_dist_angle = np.atan((m1 - m2)/(1+ m1*m2))  ###  <  <-  this side angle of finger
                finger2_dist_angle = np.pi*2 - np.atan((m1 - m2)/(1+ m1*m2))  ###  ->   <  this side angle of finger
                             
            m3 = (finger1_dist1[1] - finger1_dist[1])/(finger1_dist1[0] - finger1_dist[0]) 
            m4 = (finger1_tip1[1] - finger1_tip[1])/(finger1_tip1[0] - finger1_tip[0]) 
            
            if m3 > m4:
                #finger1_dist_angle = np.atan((m3 - m4)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                finger1_dist_angle = np.pi*2 - np.atan((m3 - m4)/(1+ m3*m4))  ###  ->   <  this side angle of finger
            else:
                  #finger1_dist_angle = np.atan((m4 - m3)/(1+ m3*m4))  ###  <  <-  this side angle of finger
                finger1_dist_angle = np.pi*2 - np.atan((m4 - m3)/(1+ m3*m4))  ###  ->   <  this side angle of finger  
            
            
            self.finger1_dist_angle_pub.publish(finger1_dist_angle)
            self.finger2_dist_angle_pub.publish(finger2_dist_angle)
            
            if count > 4:
                count = 0 
                if len(finger_object_dist) == 8:
                    self.finger_dist_pub.publish(finger_object_dist)
                if len(finger_object_pose) == 4:
                    self.finger_pose_pub.publish(finger_object_pose)
                if len(object_pose) == 3:
                    self.pose_pub.publish(object_pose)
                    self.marker_pub.publish(str(obj_marker_id))
            else: 
                print("Not all Markers Found")      

        #Display
        cv2.imshow('Window', cv_image)
        cv2.waitKey(3)
            
    
def main(args):
    f = ImageProcessor()
    rospy.init_node('object_pose_and_distance_estimation', anonymous=True)

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)
