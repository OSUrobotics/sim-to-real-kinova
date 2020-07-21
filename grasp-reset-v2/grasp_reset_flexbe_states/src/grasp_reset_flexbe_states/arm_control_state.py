#!/usr/bin/env python
import rospy
from std_msgs.msg import Int32
from flexbe_core import EventState, Logger
from flexbe_core.proxy import ProxyPublisher
from flexbe_core.proxy import ProxySubscriberCached

class Arm_Control_State_GR(EventState):
        '''
        Arm control takes in the trial information from Test control and on a succesful completion starts
        the reset.
 
        TODO: More complex information and better ways to call things also better description. 

        -- direction  int       TEMPORARY: Determines a succesful (1) or unsuccesful (0) outcome for testing purposes

        ># number_of_trials     Trial information (currently just an int)

        <= continue             All actions completed
        <= failed               Trial control failed to initialize or call something TODO: Proper error checking
        <= completed            All Trials have been succesfully completed, go back to Test control           

        '''

        def __init__(self):
            # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
            super(Arm_Control_State_GR, self).__init__(outcomes = ["continue", "failed"])


            self._pub = ProxyPublisher({"sim2real/reset_status": Int32})
            self._sub = ProxySubscriberCached({"sim2real/reset": Int32})
            #rospy.init_node('reset_control', anonymous=True) 

        def execute(self, userdata):
            if self._sub.has_msg("sim2real/reset"):
                msg = self._sub.get_last_msg("sim2real/reset")
                self._sub.remove_last_msg("sim2real/reset")
                if(msg.data == 1):
                    return "continue"            


        def on_enter(self, userdata):
            self._pub.publish("sim2real/reset_status", 1)

            