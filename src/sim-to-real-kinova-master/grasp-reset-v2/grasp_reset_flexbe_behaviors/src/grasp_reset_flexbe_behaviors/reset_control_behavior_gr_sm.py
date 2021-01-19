#!/usr/bin/env python
# -*- coding: utf-8 -*-
###########################################################
#               WARNING: Generated code!                  #
#              **************************                 #
# Manual changes may get lost if file is generated again. #
# Only code inside the [MANUAL] tags will be kept.        #
###########################################################

from flexbe_core import Behavior, Autonomy, OperatableStateMachine, ConcurrencyContainer, PriorityContainer, Logger
from grasp_reset_flexbe_states.reset_control_state_GR import Reset_Control_State_GR
# Additional imports can be added inside the following tags
# [MANUAL_IMPORT]

# [/MANUAL_IMPORT]


'''
Created on Wed Jun 24 2020
@author: Keegan
'''
class Reset_Control_Behavior_GRSM(Behavior):
	'''
	Contains the states needed for the reset of the Grasp Reset.
	'''


	def __init__(self):
		super(Reset_Control_Behavior_GRSM, self).__init__()
		self.name = 'Reset_Control_Behavior_GR'

		# parameters of this behavior

		# references to used behaviors

		# Additional initialization code can be added inside the following tags
		# [MANUAL_INIT]
		
		# [/MANUAL_INIT]

		# Behavior comments:



	def create(self):
		# x:30 y:310, x:130 y:310
		_state_machine = OperatableStateMachine(outcomes=['continue', 'failed'], input_keys=['rotation'])
		_state_machine.userdata.rotation = 0

		# Additional creation code can be added inside the following tags
		# [MANUAL_CREATE]
		
		# [/MANUAL_CREATE]


		with _state_machine:
			# x:151 y:101
			OperatableStateMachine.add('bed_reset',
										Reset_Control_State_GR(),
										transitions={'continue': 'continue', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off},
										remapping={'rotation': 'rotation'})


		return _state_machine


	# Private functions can be added inside the following tags
	# [MANUAL_FUNC]
	
	# [/MANUAL_FUNC]
