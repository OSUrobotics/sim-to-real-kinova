"""
Trains on a given replay buffer.

Author: Adam Lee <jimzersml@gmail.com>

"""

# data sci
import numpy as np
import pandas as pd

# generic packages
import os
from pathlib import Path
import glob
import argparse

# our packages
from utils import state_dim_setup, lerp
from buffer import ReplayBuffer_Queue
from DDPGfD import DDPGfD

import wandb

"""
Example usage:
python train_on_replay_buffer.py --real_dir real_positional_test_v6_constant --old_policy_name policies/state_dim_26_1000_eps/policy/train_DDPGfD_kinovaGrip --new_policy_name test_irl_expert_trained
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--real_dir", type=str, required=True)  # real world data directory
    parser.add_argument("--old_policy_name", type=str, required=True)  # Existing policy
    parser.add_argument("--save_dir", type=str, default='irl_expert_trained')  # save directory
    parser.add_argument("--new_policy_name", type=str, default='irl_expert_trained')
    parser.add_argument("--policy_dir", type=str, default='policies')
    parser.add_argument("--max_action_sim", type=float, default=3)  # max action in simulation
    parser.add_argument("--max_action_real", type=float, default=6800)  # max action in real world
    parser.add_argument("--num_updates", type=int, default=1000)  # number of updates
    parser.add_argument("--batch_size", type=int, default=16)  # batch size
    parser.add_argument("--n", type=int, default=5)  # n
    parser.add_argument("--discount", type=float, default=0.995)  # batch size
    parser.add_argument("--tau", type=float,
                        default=0.0005)  # tau. try setting this to a high amount perhaps so our network moves around more???

    args = parser.parse_args()

    """
    parsing constants / inputs
    """

    real_dir = args.real_dir
    assert Path(real_dir).exists(), 'Check that the log directory ' + real_dir + ' exists.'

    load_success_only = False
    state_idx_arr = state_dim_setup('adam_sim2real_v02')
    # state_idx_arr = state_dim_setup('adam_sim2real')  # TODO: yeet this shit once we get the new policy
    # trained_policy_path = 'policies/state_dim_full_train_v01/_07_22_21_0544/policy/train_DDPGfD_kinovaGrip'
    # trained_policy_path = 'policies/state_dim_26_1000_eps/policy/train_DDPGfD_kinovaGrip'
    trained_policy_path = args.old_policy_name

    # policy_dir = 'policies/'
    # named_policy_folder = 'real_world_train_test_folder/'

    policy_path = Path(os.path.join(args.policy_dir, args.save_dir))
    policy_path.mkdir(parents=True, exist_ok=True)

    policy_save_basepath = os.path.join(policy_path, args.new_policy_name)

    """
    Load our already trained policy
    """

    modified_state_dim = len(state_idx_arr)

    kwargs = {
        "state_dim": modified_state_dim,
        "action_dim": 3,
        "max_action": args.max_action_sim,
        "batch_size": args.batch_size,
        "n": args.n,
        "discount": args.discount,
        "tau": args.tau,
        "expert_sampling_proportion": 1.0
    }

    policy = DDPGfD(**kwargs)
    policy.load(trained_policy_path)

    # set up weights and biases logging.

    wandb.init(project="kinova_grasping")

    wandb.watch([policy.actor, policy.critic, policy.actor_target, policy.critic_target], log_freq=1)

    """
    Loading replay buffer stuff
    """

    # TODO: Add relative directory
    assert Path(real_dir).exists(), 'Check that the real log directory ' + real_dir + ' exists.'

    episode_dir = os.path.join(real_dir, 'episodes/')

    # get filepaths from episodes directory.
    reward_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'reward*.npy')))
    obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'obs*.npy')))
    next_obs_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'next_obs*.npy')))
    action_filepaths = sorted(glob.glob(os.path.join(episode_dir, 'action*.npy')))

    reward_arr = np.array([np.load(filepath) for filepath in reward_filepaths]) * 50  # make the rewards all 50 instead
    obs_arr = np.array([np.load(filepath) for filepath in obs_filepaths])
    next_obs_arr = np.array([np.load(filepath) for filepath in next_obs_filepaths])
    action_arr = np.array([np.load(filepath) for filepath in action_filepaths])

    # lerp the actions to the simulator range
    action_arr = lerp(action_arr, old_min=0, old_max=args.max_action_real, new_min=0, new_max=args.max_action_sim)

    """
    Cleaning episode length
    """

    # get the first index of each episode where all the actions are 0.
    stop_index_arr = np.argmax(np.all(action_arr == 0, axis=-1), axis=-1).astype(int)

    cut_action = [action_arr[eps_idx, :stop_index] for eps_idx, stop_index in enumerate(stop_index_arr)]
    cut_reward = [np.concatenate((reward_arr[eps_idx, :stop_index - 1], reward_arr[eps_idx, -1].reshape((1,)))) for
                  eps_idx, stop_index in enumerate(
            stop_index_arr)]  # set the last index to be successful based on the last timestep. We do this because we put the reward at the very end of the episode LOL
    cut_obs = [obs_arr[eps_idx, :stop_index] for eps_idx, stop_index in enumerate(stop_index_arr)]
    cut_next_obs = [next_obs_arr[eps_idx, :stop_index] for eps_idx, stop_index in enumerate(stop_index_arr)]

    cut_dones = [np.concatenate((np.zeros((len(eps_arr) - 1,)), np.array([1]))) for eps_arr in cut_reward]
    cut_not_dones = [np.concatenate((np.ones((len(eps_arr) - 1,)), np.array([0]))) for eps_arr in cut_reward]

    """
    Feeding replay buffer into Queue-based replay buffer
    """

    # load the thing LOL
    expert_replay_buffer = ReplayBuffer_Queue(state_dim=len(state_idx_arr), action_dim=3, max_episode=100, n_steps=5)

    # feed the cookie monster
    expert_replay_buffer.store_from_replay_buffer(cut_obs, cut_action, cut_next_obs, cut_reward, cut_not_dones)

    # training loop
    for batch_idx in range(args.num_updates):
        actor_loss, critic_loss, critic_L1loss, critic_LNloss = policy.train_batch_state_already_reduced(
            episode_num=batch_idx, update_count=batch_idx,
            expert_replay_buffer=expert_replay_buffer,
            replay_buffer=None)

        wandb.log({
            'actor_loss': actor_loss,
            'critic_loss': critic_loss,
            'critic_L1loss': critic_L1loss,
            'critic_LNloss': critic_LNloss
        })

    # save policy
    policy.save(policy_save_basepath)

    print('Finished training.')
