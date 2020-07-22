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


#### Testbed Instructions to run with code:
```
1.) Upload testbed arduino code to the arduino
2.) Turn on the Testbed by pressing the large green start button until you hear it click (its kind of sticky you have to press pretty hard)
3.) The testbed will do a startup sequence, wait until it has completely stopped moving
4.) roslaunch grasp_reset_flexbe_behaviors grasp_reset.launch
4a.) Make sure you are not getting any serial port errors in the terminal (if you are its most likely a problem with permissions) You should just see Behavior Mirror ready and Behavior engine ready in green.
5.) Launch anything else that you need to run the experiment
6.) Select Runtime Control -> Load Behavior -> Grasp_Reset_System_Behavior -> Runtime Control -> Enter number of trials -> Execute
7.) The testbed will publish a 1 to the topic sim2real/reset_status that should signal for your arm sequence to begin. Once the testbed gets a message of 1 on the sim2real/reset topic it will begin its reset cycle. Once the testbed has completed its reset the cycle will continue until the number of trials is reached.

Good luck!

```




