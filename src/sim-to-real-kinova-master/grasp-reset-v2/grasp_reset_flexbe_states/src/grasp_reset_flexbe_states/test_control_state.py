#!/usr/bin/env python
import rospy

from flexbe_core import EventState, Logger


class Test_Control_State(EventState):
        '''
        Test control takes in the test information through parameters and outputs them as userdata.
        In the future a more complex state or function for parsing test info for complicated states
        will be necessary. Direction is used for determining a successful and unsuccseful outcome for
        testing purposed but will need to be replaced with a different measure of success once it becomes 
        more fleshed out. 
        TODO: find a better format for test and trial information

        -- direction  int       TEMPORARY: Determines a succesful (1) or unsuccesful (0) outcome for testing purposes
        -- num_trials int       Number of trials for each test TODO: Replace with array with more info 
        -- num_tests  int       Number of tests TODO: Replace with array with more info 

        #> number_of_trials     Number of trials for test

        <= continue             All actions completed
        <= failed               Test control failed to initialize or call something TODO: Proper error checking
        <= completed            All tests in queue have been succesfully completed, system wide exit            

        '''

        def __init__(self, direction, num_trials, num_tests):
            # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
            super(Test_Control_State, self).__init__(outcomes = ["continue", "failed", "completed"], output_keys=["number_of_trials"])

            # Store state parameters for later use.
            self._direction = direction
            self._num_trials = num_trials
            self._num_tests = num_tests


        def execute(self, userdata):
            #returns continue if tests remain, if none remain returns completed, if direction is 0 returns failed
            if(self._direction == 1 and self._num_tests > 0):
                self._num_tests -= 1
                userdata.number_of_trials = self._num_trials
                return "continue"

            elif(self._direction == 1 and self._num_tests <= 0):
                return "completed"

            elif(self._direction == 0):
                return "failed"
