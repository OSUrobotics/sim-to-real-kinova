#!/usr/bin/env python
# -*- coding: utf-8 -*-
###########################################################
#               WARNING: Generated code!                  #
#              **************************                 #
# Manual changes may get lost if file is generated again. #
# Only code inside the [MANUAL] tags will be kept.        #
###########################################################

from flexbe_core import Behavior, Autonomy, OperatableStateMachine, ConcurrencyContainer, PriorityContainer, Logger
from grasp_reset_flexbe_states.trial_control_state_GR import Trial_Control_State_GR
# Additional imports can be added inside the following tags
# [MANUAL_IMPORT]

# [/MANUAL_IMPORT]


'''
Created on Mon Jun 15 2020
@author: Keegan
'''
class Trial_Control_Behavior_GRSM(Behavior):
	'''
	Contains Trial_Control which keeps track of the number of trials and if trials remains continues to Data_Control where the data recording begins before moving to next behavior.
	'''


	def __init__(self):
		super(Trial_Control_Behavior_GRSM, self).__init__()
		self.name = 'Trial_Control_Behavior_GR'

		# parameters of this behavior
		self.add_parameter('rotation', 0)

		# references to used behaviors

		# Additional initialization code can be added inside the following tags
		# [MANUAL_INIT]
		
		# [/MANUAL_INIT]

		# Behavior comments:



	def create(self):
		# x:845 y:121, x:342 y:314, x:139 y:350
		_state_machine = OperatableStateMachine(outcomes=['continue', 'failed', 'trials_complete'], input_keys=['number_of_trials'], output_keys=['rotation'])
		_state_machine.userdata.number_of_trials = 0
		_state_machine.userdata.rotation = 0

		# Additional creation code can be added inside the following tags
		# [MANUAL_CREATE]
		
		# [/MANUAL_CREATE]


		with _state_machine:
			# x:174 y:110
			OperatableStateMachine.add('trial_control_GR',
										Trial_Control_State_GR(direction=1, rotation=self.rotation),
										transitions={'continue': 'continue', 'failed': 'failed', 'complete': 'trials_complete'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off, 'complete': Autonomy.Off},
										remapping={'number_of_trials': 'number_of_trials', 'rotation': 'rotation'})


		return _state_machine


	# Private functions can be added inside the following tags
	# [MANUAL_FUNC]
	
	# [/MANUAL_FUNC]
