#!/usr/bin/env python3

import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from std_msgs.msg import String, Float32
from std_msgs.msg import Bool
import numpy as np
import cv2.aruco as aruco
import sys


class ImageProcessor():
    def __init__(self):

        #cv bridge class
        self.bridge = CvBridge()

        # This is the image message subcriber. Change the topic to your camera topic (most likely realsense)
        self.image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, self.get_object_pose)
        self.test_done=rospy.Publisher("/test_finish",Bool,queue_size=1)
        
    # Callback for image processing
    def get_object_pose(self, img_msg):
    
        ##Box Pixel values in the Image##
        x = 150 # Start Pixel in Height
        y = 250 # Start Pixel in Width
        h = 600 # Height in pixels    
        w = 650 # Width in pixels
        
        # Aruko Marker Info
        marker_size = 3.6 #cm 
        
        # Marker IDs
        ee_marker_id = 608  # end-effector
        obj_marker_id = 509  # object
        finger1_dist_id = 189 # Finger 1 Dist
        finger1_tip_id = 331# Finger 1 Tip
        finger2_dist_id = 411 # Finger 2 Dist  
        finger2_tip_id = 190  # Finger 1 Tip

        # Get the saved camera and distortion matrices from calibration
        mtx = np.load('/home/mechagodzilla/sim-to-real-kinova/camera_mtx.npy') # camera matrix
        dist = np.load('/home/mechagodzilla/sim-to-real-kinova/dist_mtx.npy')  # distortion matrix


        # Define Aruco Dictionary 
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_ARUCO_ORIGINAL)
        parameters = aruco.DetectorParameters_create()

        #Lists for storing marker positions
        ee_marker = []
        obj_marker = []
    
        #Convert ros image message to opencv image
        try:
            cv_image = self.bridge.imgmsg_to_cv2(img_msg, "bgr8")
        except CvBridgeError as e:
            print(e)
        
        #Cropping Image  # TODO!!
        # cv_image = cv_image[y:y+h, x:x+w]
        
        #Convert in gray scale
        gray = cv2.cvtColor(cv_image,cv2.COLOR_BGR2GRAY)
        marker_count=0
        #Find markers in the image 
        corners, ids, rejected = aruco.detectMarkers(image=gray, dictionary=aruco_dict, parameters=parameters, cameraMatrix=mtx, distCoeff=dist)
        if np.all(ids != None):

            rvec, tvec, __ = aruco.estimatePoseSingleMarkers(corners,marker_size, mtx, dist)
            
            for i in range(ids.size):
                #Draw reference frame for the marker
                
                # Save end-effector marker pose
                if ids[i] == ee_marker_id:
                    ee_marker = tvec[i]
                    marker_count+=1
                # Save object marker pose
                if ids[i] == obj_marker_id:
                    obj_marker = tvec[i]

                if ids[i] == finger1_dist_id:
                    marker_count+=1
                if ids[i]==finger1_tip_id:
                    marker_count+=1
                if ids[i] == finger2_dist_id:
                    marker_count+=1
                if ids[i]==finger2_tip_id:
                    marker_count+=1
                aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 10)

            #Draw Markers
            aruco.drawDetectedMarkers(cv_image, corners, ids)

            if len(obj_marker) > 0 :
                rospy.set_param('Goal', "true")
                #print("Lift Detected")
                self.test_done.publish(True)
            elif marker_count > 3:
                self.test_done.publish(True)
                #print('hand without object detected')
            else:
                rospy.set_param('Goal', "false") 
                #print("No Marker Found")
                self.test_done.publish(False)
                #self.test_done.publish(False)

        #Display
        cv2.imshow('reward_detection.py window', cv_image)
        cv2.waitKey(3)
            
    
def main(args):
    f = ImageProcessor()
    rospy.init_node('reward_detection', anonymous=True)

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)
