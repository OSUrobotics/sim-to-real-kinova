#!/usr/bin/env python3

# above: look at the shebang. it's in python 3.

"""
Author: Adam Lee (or... run git blame to find the latest edits)


"""

# standard packages
import time
import os
from typing import List

# ros and kinova stuff
import rospy
from kinova_msgs.msg import FingerPosition
from std_msgs.msg import String, Float32, Float32MultiArray, Int32, MultiArrayDimension
from std_msgs.msg import Bool

# data science packages
import numpy as np

from logger import Logger

# the actual openai gym
from kinova_gripper_env import KinovaGripper_Env

# the DDPGfD thingy
from DDPGfD import DDPGfD

rel_dirname = os.path.dirname(__file__)


def lerp(action_arr, old_min=0, old_max=3, new_min=0, new_max=6800):
    # first: scale to proper min max
    np_arr = np.array(action_arr)
    scale_factor = (new_max - new_min) / (old_max - old_min)
    scaled_arr = (np_arr - old_min) * scale_factor + new_min
    return scaled_arr


class Agent:
    """
    base action class
    """

    def __init__(self):
        return

    def act(self, obs):
        return


class RandomAgent(Agent):
    """
    shitty action class
    """

    def __init__(self, options: List):
        super(Agent, self).__init__()

        self.options = options

    def act(self, obs):
        """
        lmao pick some random shit
        """
        action = np.array(list([np.random.choice(self.options)]) * 3)
        return action


class ContinuousRandomAgent(Agent):
    """
    shitty action class
    """

    def __init__(self, min_speed, max_speed):
        super(Agent, self).__init__()

        self.min_speed = min_speed
        self.max_speed = max_speed

    def act(self, obs):
        """
        lmao pick some random shit
        """
        action = np.random.uniform(self.min_speed, self.max_speed, size=(3,))
        return action


class ConstantAgent(Agent):
    """
    shitty action class
    """

    def __init__(self, speed):
        super(Agent, self).__init__()

        self.speed = speed  # should be 0-6800

    def act(self, obs):
        """
        constant close
        """
        action = np.array([self.speed] * 3)
        return action


def state_dim_setup(state_dim_option):
    """
    Returns an array of indices that can be used on a full observation to only grab relevant state dimensions
    Input: The argument of which state_range option to use.
    Output: Numpy array of indices
    """

    # Setup state dimensional parts here
    '''
    Local obs, all in local coordinates (from the center of the palm)
    (18,) Finger Pos                                        0-17: (0: x, 1: y, 2: z) "f1_prox", (3-5) "f2_prox", (6-8) "f3_prox", (9-11) "f1_dist", (12-14) "f2_dist", (15-17) "f3_dist"
    (3,) Wrist Pos                                          18-20 (18: x, 19: y, 20: z)
    (3,) Obj Pos                                            21-23 (21: x, 22: y, 23: z)
    (9,) Joint States                                       24-32
    (3,) Obj Size                                           33-35
    (12,) Finger Object Distance                            36-47

    36) "f1_prox"
    37) "f1_prox_1"
    38) "f2_prox"
    39) "f2_prox_1"
    40) "f3_prox"
    41) "f3_prox_1"
    42) "f1_dist"
    43) "f1_dist_1"
    44) "f2_dist"
    45) "f2_dist_1"
    46) "f3_dist"
    47) "f3_dist_1"

    Note: NONE vs "_1" meaning: On each finger there are two red dots. The "_1" is the ones closer to the center


    (2,) X and Z angle                                      48-49
    (17,) Rangefinder data                                  50-66
    (3,) Gravity vector in local coordinates                67-69
    (3,) Object location based on rangefinder data          70-72
    (1,) Ratio of the area of the side of the shape to the open portion of the side of the hand    73
    (1,) Ratio of the area of the top of the shape to the open portion of the top of the hand    74
    (6, ) Finger dot product  75) "f1_prox", 76) "f2_prox", 77) "f3_prox", 78) "f1_dist", 79) "f2_dist", 80) "f3_dist"  75-80
    (1, ) Dot product (wrist) 81
    '''

    finger_pos_idx = np.arange(0, 18)
    f1_prox_pos_idx = np.array([3, 4, 5])
    f2_prox_pos_idx = np.array([6, 7, 8])
    f1_dist_pos_idx = np.array([12, 13, 14])
    f2_dist_pos_idx = np.array([15, 16, 17])
    last_6_joint_states_idx = np.arange(27, 33)

    wrist_pos_idx = np.arange(18, 21)
    obj_pos_idx = np.arange(21, 24)
    joint_states_idx = np.arange(24, 33)
    obj_size_idx = np.arange(33, 36)
    finger_obj_dist_idx = np.arange(36, 48)

    finger_obj_dist_f1_prox_1 = np.array([37])
    finger_obj_dist_f2_prox_1 = np.array([39])
    finger_obj_dist_f1_dist_1 = np.array([43])
    finger_obj_dist_f2_dist_1 = np.array([45])

    x_z_angle_idx = np.arange(48, 50)
    rangefinder_data_idx = np.arange(50, 67)
    gravity_vector_in_local_coords = np.arange(67, 70)
    object_location_rangefinder = np.arange(70, 73)
    ratio_sideshape_sidehand = np.array([73])
    ratio_topshape_tophand = np.array([74])
    f1_prox_idx = np.array([75])
    f2_prox_idx = np.array([76])
    f3_prox_idx = np.array([77])
    f1_dist_idx = np.array([78])
    f2_dist_idx = np.array([79])
    f3_dist_idx = np.array([80])
    dot_prod_wrist = np.array([81])

    # create mappings for state dimension mapping
    state_dim_idx_arr_dict = {
        'all': np.arange(82),
        'nigel_rangefinder': np.concatenate((obj_pos_idx, rangefinder_data_idx, obj_size_idx), axis=0),
        'nigel_norangefinder': np.concatenate((obj_pos_idx, finger_obj_dist_idx, obj_size_idx), axis=0),
        'all_real': np.concatenate((f1_prox_pos_idx, f2_prox_pos_idx, f1_dist_pos_idx, f2_dist_pos_idx, obj_pos_idx,
                                    last_6_joint_states_idx, obj_size_idx, finger_obj_dist_idx)),
        #  wrist 3 + finger pos 12 + obj size 3 + last joint states 6 + obj pos 3 + finger obj dist 4
        'adam_sim2real': np.concatenate((f1_dist_pos_idx, f1_prox_pos_idx, f2_dist_pos_idx, f2_prox_pos_idx,
                                         wrist_pos_idx, obj_pos_idx, last_6_joint_states_idx, obj_size_idx,
                                         finger_obj_dist_f1_dist_1, finger_obj_dist_f1_prox_1,
                                         finger_obj_dist_f2_dist_1, finger_obj_dist_f2_prox_1))
        # this one is based on sim2real
    }

    assert state_dim_option in state_dim_idx_arr_dict.keys()

    res_state_idx_arr = state_dim_idx_arr_dict[state_dim_option]

    return res_state_idx_arr


class RLAgent(Agent):
    """
    action class based on trained RL agent
    """

    def __init__(self, trained_policy_path):
        super(Agent, self).__init__()

        state_idx_arr = state_dim_setup('adam_sim2real')
        self.modified_state_dim = len(state_idx_arr)

        # Set dimensions for state and action spaces - policy initialization
        # state_dim = 82  # State dimension dependent on the length of the state space
        self.action_dim = 3  # env.action_space.shape[0]
        self.max_action = 3.0  # this is hardcoded from our simulation environment

        self.max_action_real_world = 6800  # this is hardcoded from real life

        kwargs = {
            "state_dim": self.modified_state_dim,
            "action_dim": self.action_dim,
            "max_action": self.max_action
        }

        self.policy = DDPGfD(**kwargs)

        self.policy.load(trained_policy_path)

    def act(self, obs):
        """
        lmao pick some random shit
        """
        rl_action = self.policy.select_action(obs)
        scaled_action = lerp(rl_action, old_min=-self.max_action, old_max=self.max_action,
                             new_min=-self.max_action_real_world,
                             new_max=self.max_action_real_world)

        print('observation shape:', obs.shape)
        print('original action:', rl_action)

        return scaled_action


if __name__ == '__main__':
    rospy.init_node('openai_gym_kinova')

    try:
        # TODO: instead of sleeping, listen to a "ready" channel or service.
        rospy.sleep(5.0)

        # TODO Note: if some shit breaks, add stuff here
        print('Starting file: main_experiment.py')

        # load OpenAI Gym env
        env = KinovaGripper_Env()

        # this parameter keeps the kinova_gripper_env running in ROS wrapper code
        rospy.set_param('exec_done', 'false')

        # this controller lets us manually set off the joint velocity controller
        finish_velocity_controller_pub = rospy.Publisher('/finish_velocity_controller', Bool, queue_size=1)

        # load agent
        trained_policy_path = 'policies/state_dim_full_train_v01/_07_22_21_0544/policy/train_DDPGfD_kinovaGrip'

        print('relative path:', rel_dirname)

        # agent = RandomAgent([0, 1700, 3400])
        # agent = RLAgent(trained_policy_path=os.path.join(rel_dirname, trained_policy_path))
        agent = ConstantAgent(6800)

        # load logger
        # log_dir = '/home/mechagodzilla/sim-to-real-kinova/rl_agent_v1_logs/'
        log_dir = os.path.join(rel_dirname, 'constant_agent_logs/')
        logger = Logger(log_dir=log_dir, use_video=True)

        max_timesteps = 100

        input('Press enter to start trials...')

        rate = rospy.Rate(30)

        for trial_idx in range(10):

            _ = env.reset(x_noise=0.03, y_noise=-0.02, z_noise=0, roll_noise=0, pitch_noise=0,
                          yaw_noise=-np.pi / 12)  # NOTE: THE OBSERVATION FROM HERE DOESN'T CONTAIN THE OBJECT LOL

            done = False

            # input('Trial ' + str(trial_idx) + ' | ' + 'Press enter to add positional noise...')
            #
            # env.add_positional_noise(0.025, -0.025, 0)
            #
            # input('Press enter to add orientation noise')
            #
            # env.add_orientational_noise(0, 0, np.pi / 12)  # wrt to the base i believe

            input('Press enter to start grasp attempt')

            rospy.loginfo('=================starting grabbing stage')

            logger.record_current_episode(True)  # set recording on

            obs = env.get_obs()  # get the most recent observation
            info = env.get_info()

            logger.record_starting_position(obs, info)

            for timestep_idx in range(max_timesteps):  # or turn this into for loop
                print('timestep:', timestep_idx)
                action = agent.act(obs)
                print('THE ACTION IS:', action)
                next_obs, reward, done, info = env.step(action)

                if done or timestep_idx == max_timesteps - 1:
                    rospy.loginfo('=== stopping the closing of fingers...')
                    finish_velocity_controller_pub.publish(True)
                    break

                # grab the image from subscriber
                # call the logger here

                logger.log_single_step(action, obs, next_obs, reward, done, info)

                rate.sleep()

                obs = next_obs

            # once set as done, check reward
            reward = env.check_reward()

            logger.log_single_step(action, obs, next_obs, reward, done, info)

            # while not rospy.get_param('finish_reward_check'):
            #     rospy.loginfo('waiting for reward...')
            #     rospy.sleep(1)

            print("trial:", trial_idx, "reward:", reward)
            logger.finish_recording()  # log the episode and save video

        print('End of testbed.')

        rospy.spin()


    except rospy.ROSInterruptException:
        print('ERROR: Program interrupted before completion')

    print('adam_gym_test.py finished.')
