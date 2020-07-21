# grasp_reset_behaviors
## This repo contains all grasp_reset-specific states and behaviors.

### Dependencies: 
rosserial_arduino

FlexBE Behavior Engine

### Install:

#### Rosserial_arduino:
To set up rosserial_arduino it is easiest to follow the wiki:
http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup

Remember to run the command if on linux:
```
sudo usermod -a -G dialout $USER
```
This will let arduino communicate with your serial port

#### FlexBe:
In src folder:
```
sudo apt install ros-$ROS_DISTRO-flexbe-behavior-engine
git clone https://github.com/FlexBE/flexbe_app.git
catkin build
source devel/setup.bash
```

#### Install this Package:
```
git clone https://github.com/Keeganfn/grasp-reset-v2.git
```

#### How to use it:
To just bring up flexbe gui run:
```
roslaunch flexbe_app flexbe_ocs.launch
```
To run the whole package while hooked into testbed run:
```
roslaunch grasp_reset_flexbe_behaviors grasp_reset.launch
```
Select Runtime Control -> Load Behavior -> Grasp_Reset_System_Behavior -> Runtime Control -> Enter number of trials -> Execute

