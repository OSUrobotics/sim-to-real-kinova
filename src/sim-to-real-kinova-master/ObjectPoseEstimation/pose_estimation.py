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
		self.pose_pub = rospy.Publisher("object_pose", Float32, queue_size=10)
		# Marker ID publisher 
		self.marker_pub = rospy.Publisher('marker_id', String, queue_size=10)

		#cv bridge class
		self.bridge = CvBridge()

		# This is the image message subcriber. Change the topic to your camera topic (most likely realsense)
		self.image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, self.get_object_pose)
		
	# Callback for image processing
	def get_object_pose(self, img_msg):

 
		# Aruko Marker Info
		marker_size = 5 #cm 

		# Marker IDs
		ee_marker_id = 0  # end-effector
		obj_marker_id = 1 # object 

		# Get the saved camera and distortion matrices from calibration
		mtx = np.load('/home/nuha/kinova_ws/src/traj-control/src/camera_mtx.npy') # camera matrix
		dist = np.load('/home/nuha/kinova_ws/src/traj-control/src/dist_mtx.npy')  # distortion matrix

		# Define Aruco Dictionary 
		aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_1000)
		parameters = aruco.DetectorParameters_create()

		#Lists for storing marker positions
		ee_marker = []
		obj_marker = []

	
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

				aruco.drawAxis(cv_image, mtx, dist, rvec[i], tvec[i], 10)

			#Draw Markers
			aruco.drawDetectedMarkers(cv_image, corners, ids)

			# print('obj: ', obj_marker)
			# print('ee: ', ee_marker)

			if len(ee_marker) > 0 and len(obj_marker) > 0 :
				# Get the pose of object with respect to end-effector 
				delta_pose = [(x - y)*10.0 for x, y in zip(obj_marker, ee_marker)] # Prints in milimeters. Default is cm.
				print(delta_pose)

				self.pose_pub.publish(delta_pose)
				self.marker_pub.publish(str(obj_marker_id))
			else: 
				print("No Marker Found")

			
			

		#Display
		cv2.imshow('Window', cv_image)
		cv2.waitKey(3)
			
	
def main(args):
	f = ImageProcessor()
	rospy.init_node('pose_estimation', anonymous=True)

	try:
		rospy.spin()
	except KeyboardInterrupt:
		print("Shutting down")
	cv2.destroyAllWindows()


if __name__ == '__main__':
	main(sys.argv)
