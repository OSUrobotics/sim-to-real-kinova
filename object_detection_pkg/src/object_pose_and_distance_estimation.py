#!/usr/bin/env python

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from std_msgs.msg import String, Float32
import numpy as np
import cv2.aruco as aruco
import sys


class ImageProcessor():
    def __init__(self):
        # Object pose publisher
        self.pose_pub = rospy.Publisher("/object_pose", Float32, queue_size=10)
        # Marker ID publisher 
        self.marker_pub = rospy.Publisher('/marker_id', String, queue_size=10)
        # Finger object distance publisher
        self.finger_dist_pub = rospy.Publisher("/finger_dist", Float32, queue_size=10)
        self.finger_pose_pub = rospy.Publisher("/finger_pose", Float32, queue_size=10)

        #cv bridge class
        self.bridge = CvBridge()

        # This is the image message subcriber. Change the topic to your camera topic (most likely realsense)
        self.image_sub = rospy.Subscriber('/camera/color/image_raw', Image, self.get_object_pose)
        
    # Callback for image processing
    def get_object_pose(self, img_msg):
        # Aruko Marker Info
        marker_size = 5 #cm 

        # Marker IDs
        ee_marker_id = 0    # end-effector
        obj_marker_id = 1   # object
        finger1_dist_id = 3 # Finger 1 Dist
        finger1_tip_id = 4  # Finger 1 Tip
        finger2_dist_id = 5 # Finger 2 Dist  
        finger2_tip_id = 6  # Finger 1 Tip

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

    
        #Convert ros image message to opencv image

        try:
            cv_image = self.bridge.imgmsg_to_cv2(img_msg, "bgr8")
        except CvBridgeError as e:
            print(e)

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

                # Save object marker pose
                if ids[i] == obj_marker_id:
                    obj_marker = tvec[i]
                    obj_marker[2] = obj_marker[2] - 5.5  ###Since Object height in z is 110 mm. Subtracting 55 mm brings center to object center 
                    
                # Save finger1 Dist marker pose
                if ids[i] == finger1_dist_id:
                    finger1_dist = tvec[i]

                # Save finger1 tip pose
                if ids[i] == finger1_tip_id:
                    finger1_tip = tvec[i]
                    
                # Save finger2 Dist marker pose
                if ids[i] == finger2_dist_id:
                    finger2_dist = tvec[i]

                # Save finger2 tip pose
                if ids[i] == finger2_tip_id:
                    finger2_tip = tvec[i]

                aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 10)

            #Draw Markers
            aruco.drawDetectedMarkers(cv_image, corners, ids)
            count = 0

            if len(ee_marker) > 0 and len(obj_marker) > 0 :
                # Get the pose of object with respect to end-effector 
                object_pose = [(x - y)*10.0 for x, y in zip(obj_marker, ee_marker)] # Prints in milimeters. Default is cm.
                print("Object Distance: " +str(object_pose))
                count += 1
                
            if len(finger1_dist) > 0 and len(obj_marker) > 0 :
                
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger1_dist)]
                finger_object_pose.append(finger_object_pose_local)         
            
                delta_pose = 0
                # Get the distance between object and finger 
                for x, y in zip(obj_marker, finger1_dist):
                    delta_pose += (x - y)*(x - y)
                dist = sqrt(delta_pose)*10.0
                finger_object_dist.append(dist)
                print("Finger1 Dist to object: " +str(dist))
                count += 1
            
            if len(finger1_tip) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger1_tip)]
                finger_object_pose.append(finger_object_pose_local)
            
                delta_pose = 0
                # Get the distance between object and finger 
                for x, y in zip(obj_marker, finger1_tip):
                    delta_pose += (x - y)*(x - y)
                dist = sqrt(delta_pose)*10.0
                finger_object_dist.append(dist)
                print("Finger1 tip to object: " +str(dist))
                count += 1
                
            if len(finger2_dist) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger2_dist)]
                finger_object_pose.append(finger_object_pose_local)
            
                delta_pose = 0
                # Get the distance between object and finger 
                for x, y in zip(obj_marker, finger2_dist):
                    delta_pose += (x - y)*(x - y)
                dist = sqrt(delta_pose)*10.0
                finger_object_dist.append(dist)
                print("Finger2 Dist to object: " +str(dist))
                count += 1
            
            if len(finger2_tip) > 0 and len(obj_marker) > 0 :
            
                finger_object_pose_local = [(x - y)*10.0 for x, y in zip(obj_marker, finger2_tip)]
                finger_object_pose.append(finger_object_pose_local)
            
                delta_pose = 0
                # Get the distance between object and finger 
                for x, y in zip(obj_marker, finger2_tip):
                    delta_pose += (x - y)*(x - y)
                dist = sqrt(delta_pose)*10.0
                finger_object_dist.append(dist)
                print("Finger2 tip to object: " +str(dist))
                count += 1
            
            if count > 4:
                count = 0   
                self.finger_dist_pub.publish(finger_object_dist)
                self.finger_pose_pub.publish(finger_object_pose)
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
