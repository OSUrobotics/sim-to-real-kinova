#!/usr/bin/env python

###############
# Author: Paresh HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA
# Purpose: Simulation to Real Implementation on Kinova
# Summer 2020
###############

import rospy
from kinova_msgs.msg import FingerPosition
from kinova_gripper_env import KinovaGripper_Env
import time
from std_msgs.msg import String, Float32, Float32MultiArray, Int32, MultiArrayDimension
from std_msgs.msg import Bool

class controller():
    def __init__(self):
        self.test_done=False
        self.route_done=False
        
    def route(self,msg):
        self.route_done=msg.data
        
    def test(self,msg):
        #print('test_finished')
        self.test_done=msg.data
        
if __name__ == '__main__':
    rospy.init_node('grasp_classifier_test')
    try:
        rospy.sleep(2.0)
        print("Starting Testing of Grasp Classifier")
        #[5.292494707992289, 4.617425449602426, 6.262907998639722, 1.1245324203011362, 10.581492152841088, 4.773212383888791, 12.698122519807571],\
        robot_grasp_joints=[[5.194395038710349, 4.61755328133475, 6.258866918001637, 1.1237466546215082, 10.583468218369926, 4.77062485657367, 12.701494081747612],\
                    [5.301863708707188, 4.642172075083661, 6.25642586454647, 1.0640270648102172, 10.638482734904347, 4.773731167669139, 12.787761326306331],\
                    [5.1712862572995135, 4.612319104528309, 6.258938290718851, 1.1500339187933535, 10.562352546718905, 4.76536884184629, 12.666124106678053],\
                    [5.283578977294923, 4.655589613287698, 6.2539922679423565, 1.0363660089900546, 10.668026778773251, 4.774261669358283, 12.831719463259178],\
                    [5.291669660686583, 4.620667581913489, 6.259802220176472, 1.1244778254987895, 10.582222924244205, 4.775655035240613, 12.699355030760062],\
                    [5.31152459187756, 4.6414903058445995, 6.256269270674373, 1.0651639017005448, 10.636814530797523, 4.775946917696085, 12.78615064647905],\
                    [5.231036406884313, 4.623028207903735, 6.256276194893207, 1.1181681310861193, 10.588668839346633, 4.7726222273912295, 12.710124854208342],\
                    [5.190161145209341, 4.60857097161013, 6.263025710359904, 1.1623586288440768, 10.551653030723402, 4.765531827305003, 12.649429282436563],\
                    [5.180549796835245, 4.616609457044426, 6.257989140106346, 1.1261925017666372, 10.581176834568023, 4.765731031754541, 12.69837072642117]]
        env = KinovaGripper_Env()
        rospy.set_param('exec_done', "false")
        cont=controller()
        finger_close_percent = rospy.get_param('close_percent')
        rospy.Subscriber('/route_finish',Bool,cont.route)
        done=rospy.Subscriber('/test_finish',Bool,cont.test)
        hand=rospy.Publisher('/hand_control',String,queue_size=1)
        collector=rospy.Publisher('/data_to_save',Float32MultiArray, queue_size=10)
        finger_pos = FingerPosition()
        finger_pos.finger1 = 0
        finger_pos.finger2 = 0
        finger_pos.finger3 = 0
        count = 0
        reset_mechanism=rospy.Publisher('reset_start',Int32,queue_size=1)
        #reset_mechanism.publish(1)
        i=0
        abba=[5.31152459187756, 4.6414903058445995, 6.256269270674373, 1.0651639017005448, 10.636814530797523, 4.775946917696085, 12.78615064647905]
        for i in range(10):
            a=True
            b=True
            c=True
            input('start test?')
            start=time.time()
            timer=time.time()+120000
            hand.publish('o')
            rospy.sleep(2)
            reset_mechanism.publish(1)
            while c:
                if ((time.time()-start)>=10)&(a):
                    print('moving to start position')
                    env.go_to_home(robot_grasp_joints[i])
                    a=False
                if cont.route_done:
                    rospy.sleep(4)
                    data2=env.get_obs()
                    print('route done, closing the hand')
                    hand.publish('c')
                    cont.route_done=False
                    timer=time.time()
                if ((time.time()-timer)>7)&(b):
                    data=env.get_obs()
                    print('this is what data is in graps classifier test',data)
                    print('hand closed and aruco stuff settled, moving to the goal')
                    env.go_to_goal()
                    b=False
                if (cont.test_done) & (not(a)) & (not(b)):
                    c=False
                    result=rospy.get_param('Goal')
                    if result=='true':
                         data.append(1.0)
                    else:
                        data.append(0.0)
                    print('end result is ',result)
                    print('this is what data is after appending the value',data)
            publisher=Float32MultiArray()
            publisher.layout.dim.append(MultiArrayDimension())
            publisher.layout.dim[0].label = 'pregrasp_data'
            publisher.layout.dim[0].size = len(data2)
            publisher.layout.dim[0].stride = len(data2)
            publisher.data=data2
            collector.publish(publisher)
            publisher=Float32MultiArray()
            publisher.layout.dim.append(MultiArrayDimension())
            publisher.layout.dim[0].label = 'obs_and_result'
            publisher.layout.dim[0].size = len(data)
            publisher.layout.dim[0].stride = len(data)
            publisher.data=data
            print('ending data',data)
            collector.publish(publisher)
            
            '''
                if finger_pos.finger1 < (finger_close_percent)-10:
                    finger_pos.finger1 = finger_pos.finger1 + 10
                    finger_pos.finger2 = finger_pos.finger2 + 10
                    finger_pos.finger3 = finger_pos.finger3 + 10               
                    _, reward, _, _ = env.step(finger_pos)                
                elif count == 0:
                    count = 1
            '''
                #env.go_to_goal()
            #else:
            #    print("Goal Reached Terminate execution")        

        print('test finished')
    except rospy.ROSInterruptException:
        print('program interrupted before completion')

