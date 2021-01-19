# sim-to-real-kinova
Simulation to Real Implementation on Kinova Arm




# Object Pose Estimation

- Install OpenCV and cv_bridge using the following commands:

      $ sudo apt-get install ros-your-distro-vision-opencv
  
      $ sudo apt-get install ros-your-distro-cv-bridge

- Create a package in your workspace with the required dependencies by running the following command:
  
      $ catkin_create_pkg package-name rospy roscpp opencv2 cv_bridge std_msgs sensor_msgs

- Put pose_estimation.py and camera_cal.py in the src folder

- Change line 24 in camera_cal.py to the directory you have saved your camera caliberation images. (Note: Make sure to take atleast 30 images)

- Run camera_cal.py to generate the required camera matrices. They will be saved as camera_mtx.npy and dist_mtx.npy in the same directory

- Run roscore and your camera image publisher node
 
- Change line 24 in pose_estimation.py to subscribe to your camera topic

- Change line 38 and 39 in pose_estimation.py to the directory where camera_mtx.npy and dist_mtx.npy is saved in order to import them

- Object pose is published on the topic /object_pose as Float32

- Marker pose is published on the topic /marker_id as String
