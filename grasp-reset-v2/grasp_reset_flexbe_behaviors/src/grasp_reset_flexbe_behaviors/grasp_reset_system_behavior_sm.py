#!/usr/bin/env python
# -*- coding: utf-8 -*-
###########################################################
#               WARNING: Generated code!                  #
#              **************************                 #
# Manual changes may get lost if file is generated again. #
# Only code inside the [MANUAL] tags will be kept.        #
###########################################################

from flexbe_core import Behavior, Autonomy, OperatableStateMachine, ConcurrencyContainer, PriorityContainer, Logger
from grasp_reset_flexbe_behaviors.test_control_behavior_gr_sm import Test_Control_Behavior_GRSM
from grasp_reset_flexbe_behaviors.trial_control_behavior_gr_sm import Trial_Control_Behavior_GRSM
from grasp_reset_flexbe_behaviors.reset_control_behavior_gr_sm import Reset_Control_Behavior_GRSM
from grasp_reset_flexbe_behaviors.position_behavior_gr_sm import Position_Behavior_GRSM
# Additional imports can be added inside the following tags
# [MANUAL_IMPORT]

# [/MANUAL_IMPORT]


'''
Created on Sat Jun 13 2020
@author: Keegan
'''
class Grasp_Reset_System_BehaviorSM(Behavior):
	'''
	Behavior that contains all necessary behaviors and states for the grasp reset to complete a full operation of tests.
	'''


	def __init__(self):
		super(Grasp_Reset_System_BehaviorSM, self).__init__()
		self.name = 'Grasp_Reset_System_Behavior'

		# parameters of this behavior

		# references to used behaviors
		self.add_behavior(Test_Control_Behavior_GRSM, 'Test_Control_Behavior_GR')
		self.add_behavior(Trial_Control_Behavior_GRSM, 'Trial_Control_Behavior_GR')
		self.add_behavior(Reset_Control_Behavior_GRSM, 'Reset_Control_Behavior_GR')
		self.add_behavior(Position_Behavior_GRSM, 'Position_Behavior_GR')

		# Additional initialization code can be added inside the following tags
		# [MANUAL_INIT]
		
		# [/MANUAL_INIT]

		# Behavior comments:



	def create(self):
		# x:839 y:80, x:48 y:202
		_state_machine = OperatableStateMachine(outcomes=['finished', 'failed'])

		# Additional creation code can be added inside the following tags
		# [MANUAL_CREATE]
		
		# [/MANUAL_CREATE]


		with _state_machine:
			# x:382 y:17
			OperatableStateMachine.add('Test_Control_Behavior_GR',
										self.use_behavior(Test_Control_Behavior_GRSM, 'Test_Control_Behavior_GR'),
										transitions={'continue': 'Trial_Control_Behavior_GR', 'failed': 'failed', 'tests_completed': 'finished'},
										autonomy={'continue': Autonomy.Inherit, 'failed': Autonomy.Inherit, 'tests_completed': Autonomy.Inherit},
										remapping={'number_of_trials': 'number_of_trials'})

			# x:382 y:144
			OperatableStateMachine.add('Trial_Control_Behavior_GR',
										self.use_behavior(Trial_Control_Behavior_GRSM, 'Trial_Control_Behavior_GR'),
										transitions={'continue': 'Position_Behavior_GR', 'failed': 'failed', 'trials_complete': 'Test_Control_Behavior_GR'},
										autonomy={'continue': Autonomy.Inherit, 'failed': Autonomy.Inherit, 'trials_complete': Autonomy.Inherit},
										remapping={'number_of_trials': 'number_of_trials', 'rotation': 'rotation'})

			# x:651 y:396
			OperatableStateMachine.add('Reset_Control_Behavior_GR',
										self.use_behavior(Reset_Control_Behavior_GRSM, 'Reset_Control_Behavior_GR'),
										transitions={'continue': 'Trial_Control_Behavior_GR', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Inherit, 'failed': Autonomy.Inherit},
										remapping={'rotation': 'rotation'})

			# x:147 y:392
			OperatableStateMachine.add('Position_Behavior_GR',
										self.use_behavior(Position_Behavior_GRSM, 'Position_Behavior_GR'),
										transitions={'continue': 'Reset_Control_Behavior_GR', 'aborted': 'failed'},
										autonomy={'continue': Autonomy.Inherit, 'aborted': Autonomy.Inherit})


		return _state_machine


	# Private functions can be added inside the following tags
	# [MANUAL_FUNC]
	
	# [/MANUAL_FUNC]
