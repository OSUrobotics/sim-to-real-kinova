#!/usr/bin/env python
import rospy
from std_msgs.msg import Int32
from flexbe_core import EventState, Logger
from flexbe_core.proxy import ProxyPublisher
from flexbe_core.proxy import ProxySubscriberCached

class Reset_Control_State_GR(EventState):
        '''
        Reset control takes in the trial information from Test control and on a succesful completion starts
        the Data Control. If all trials are completed then it will loop back to Test control. Direction is
        used for determining a successful and unsuccseful outcome for testing purposed but will need to be
        replaced with a different measure of success once it becomes more fleshed out. 
        TODO: More complex information for trials, update info

        -- direction  int       TEMPORARY: Determines a succesful (1) or unsuccesful (0) outcome for testing purposes

        ># number_of_trials     Trial information (currently just an int)

        <= continue             All actions completed
        <= failed               Trial control failed to initialize or call something TODO: Proper error checking
        <= completed            All Trials have been succesfully completed, go back to Test control           

        '''

        def __init__(self):
            # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
            super(Reset_Control_State_GR, self).__init__(outcomes = ["continue", "failed"], input_keys=["rotation"])

            # Store state parameters for later use.
            self._rotation = None


            self._pub = ProxyPublisher({"reset_start": Int32})
            self._sub = ProxySubscriberCached({"reset_complete": Int32})
            #rospy.init_node('reset_control', anonymous=True) 

        def execute(self, userdata):
            #publish to arduino

            #while(1):
            if self._sub.has_msg("reset_complete"):
                msg = self._sub.get_last_msg("reset_complete")
                print(msg)
                # in case you want to make sure the same message is not processed twice:
                self._sub.remove_last_msg("reset_complete")
                return "continue"            


        def on_enter(self, userdata):
            #self._rotation = 5
            #Initializes class variable from userdata, has to be done outside of constructor 
            if(self._rotation is None and userdata.rotation is not None):
                self._rotation = userdata.rotation

            self._pub.publish("reset_start", self._rotation)

            