# data science packages
import numpy as np
from typing import List

from utils import lerp, state_dim_setup
from DDPGfD import DDPGfD


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


class RLAgent(Agent):
    """
    action class based on trained RL agent
    """

    def __init__(self, trained_policy_path, state_dim_config='adam_sim2real_v02', real_world=True):
        super(Agent, self).__init__()

        self.state_idx_arr = state_dim_setup(state_dim_config)
        # print('length of state idx arr: ', self.state_idx_arr.shape)
        self.modified_state_dim = len(self.state_idx_arr)

        # Set dimensions for state and action spaces - policy initialization
        # state_dim = 82  # State dimension dependent on the length of the state space
        self.action_dim = 3  # env.action_space.shape[0]
        self.max_action = 1.5  # this is hardcoded from our simulation environment

        self.max_action_real_world = 3400  # this is hardcoded from real life

        self.real_world = real_world

        kwargs = {
            "state_dim": self.modified_state_dim,
            "action_dim": self.action_dim,
            "max_action": self.max_action,
            "batch_size": 1  # use a batch size of 1 for the updates...
        }

        self.policy = DDPGfD(**kwargs)

        self.policy.load(trained_policy_path)

    def act(self, obs):
        """
        lmao pick some random shit
        """

        mod_obs = obs
        # print('lol', obs.shape)
        if not self.real_world:
            mod_obs = obs[self.state_idx_arr]

        rl_action = self.policy.select_action(mod_obs)

        print('observation shape:', mod_obs.shape)
        print('original action:', rl_action)

        if self.real_world:
            rl_action = lerp(rl_action, old_min=-self.max_action, old_max=self.max_action,
                             new_min=-self.max_action_real_world,
                             new_max=self.max_action_real_world)

        return rl_action
