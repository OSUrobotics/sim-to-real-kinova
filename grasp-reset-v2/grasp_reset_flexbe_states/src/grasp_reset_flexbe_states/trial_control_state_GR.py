#!/usr/bin/env python
import rospy

from flexbe_core import EventState, Logger


class Trial_Control_State_GR(EventState):
        '''
        Trial control takes in the trial information from Test control and on a succesful completion starts
        the Data Control. If all trials are completed then it will loop back to Test control. Direction is
        used for determining a successful and unsuccseful outcome for testing purposed but will need to be
        replaced with a different measure of success once it becomes more fleshed out. 
        TODO: More complex information for trials 

        -- direction  int       TEMPORARY: Determines a succesful (1) or unsuccesful (0) outcome for testing purposes

        ># number_of_trials     Trial information (currently just an int)

        <= continue             All actions completed
        <= failed               Trial control failed to initialize or call something TODO: Proper error checking
        <= completed            All Trials have been succesfully completed, go back to Test control           

        '''

        def __init__(self, direction, rotation):
            # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
            super(Trial_Control_State_GR, self).__init__(outcomes = ["continue", "failed", "complete"], input_keys=["number_of_trials"], output_keys=["rotation"])

            # Store state parameters for later use.
            self._direction = direction
            self._number_of_trials = None
            self._rotation = rotation


        def execute(self, userdata):
            #if trials remain return continue, if not return complete, if direction is 0 return failed
            if(self._direction == 1 and self._number_of_trials > 0):
                #print(self._number_of_trials)
                self._number_of_trials -= 1
                userdata.rotation = self._rotation
                return "continue"

            elif(self._direction == 1 and self._number_of_trials <= 0):
                self._number_of_trials = None
                return "complete"

            elif(self._direction == 0):
                return "failed"


        def on_enter(self, userdata):
            #Initializes class variable from userdata, has to be done outside of constructor 
            if(self._number_of_trials is None and userdata.number_of_trials is not None):
                self._number_of_trials = userdata.number_of_trials
