#!/usr/bin/env python
# -*- coding: utf-8 -*-
###########################################################
#               WARNING: Generated code!                  #
#              **************************                 #
# Manual changes may get lost if file is generated again. #
# Only code inside the [MANUAL] tags will be kept.        #
###########################################################

from flexbe_core import Behavior, Autonomy, OperatableStateMachine, ConcurrencyContainer, PriorityContainer, Logger
from grasp_reset_flexbe_states.test_control_state_GR import Test_Control_State_GR
# Additional imports can be added inside the following tags
# [MANUAL_IMPORT]

# [/MANUAL_IMPORT]


'''
Created on Thu Jun 11 2020
@author: Keegan
'''
class Test_Control_Behavior_GRSM(Behavior):
	'''
	This Behavior contains the Monitor_State and the Test_Control state. This is where the initial test information will be passed in and Test_control will store it as userdata.

TODO:
In the future an additional state might be useful for further processsing test information from a file or another source before storing it as userdata.
	'''


	def __init__(self):
		super(Test_Control_Behavior_GRSM, self).__init__()
		self.name = 'Test_Control_Behavior_GR'

		# parameters of this behavior
		self.add_parameter('direction', 1)
		self.add_parameter('num_trials', 1)
		self.add_parameter('num_tests', 1)

		# references to used behaviors

		# Additional initialization code can be added inside the following tags
		# [MANUAL_INIT]
		
		# [/MANUAL_INIT]

		# Behavior comments:



	def create(self):
		# x:836 y:130, x:639 y:366, x:855 y:267
		_state_machine = OperatableStateMachine(outcomes=['continue', 'failed', 'tests_completed'], output_keys=['number_of_trials'])
		_state_machine.userdata.number_of_trials = 0

		# Additional creation code can be added inside the following tags
		# [MANUAL_CREATE]
		
		# [/MANUAL_CREATE]


		with _state_machine:
			# x:262 y:106
			OperatableStateMachine.add('Test_control_GR',
										Test_Control_State_GR(direction=self.direction, num_trials=self.num_trials, num_tests=self.num_tests),
										transitions={'continue': 'continue', 'failed': 'failed', 'completed': 'tests_completed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off, 'completed': Autonomy.Off},
										remapping={'number_of_trials': 'number_of_trials'})


		return _state_machine


	# Private functions can be added inside the following tags
	# [MANUAL_FUNC]
	
	# [/MANUAL_FUNC]
