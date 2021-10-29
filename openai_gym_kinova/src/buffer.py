import torch
from pathlib import Path
import random
import numpy as np
import os


# step 1: import replay buffer. or just paste the whole thing in
class ReplayBuffer_Queue(object):
    def __init__(self, state_dim, action_dim, max_episode=10000, n_steps=5):
        self.max_episode = max_episode  # Maximum number of episodes, limit to when we remove old episodes
        self.size = 0  # Full size of the replay buffer (number of entries over all episodes)
        self.episodes_count = 0  # Number of episodes that have occurred (may be more than max replay buffer side)
        self.replay_ep_num = 0  # Number of episodes currently in the replay buffer
        self.episodes = [[]]  # Keep track of episode start/finish indexes
        self.timesteps_count = 0  # Keeps track of the number of timesteps within an episode for sampling purposed

        # each of these are a queue
        self.state = [[]]
        self.action = [[]]
        self.next_state = [[]]
        self.reward = [[]]
        self.not_done = [[]]

        self.policy_action = [[]]  # Actual action output by the policy actor network
        self.action_noise = [[]]  # Noise added to the action output by the policy

        self.finger_reward = [[]]
        self.grasp_reward = [[]]
        self.lift_reward = [[]]
        self.n_steps = n_steps

        self.orientation_indexes = []  # Hand pose variation and noise

        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        print('======================== LETS FUCKING GO')

    def add(self, state, action, next_state, reward, done):

        """
        Assume there's a numpy array
        """
        self.state[-1].append(state)
        self.action[-1].append(action)
        self.next_state[-1].append(next_state)
        self.reward[-1].append(reward)
        self.not_done[-1].append(1. - done)

        self.size += 1
        self.timesteps_count += 1

    def remove_episode(self, idx=0):
        """
        Remove the oldest episode from the replay buffer (FIFO)
        """
        self.state.pop(idx)
        self.action.pop(idx)
        self.next_state.pop(idx)
        self.reward.pop(idx)
        self.not_done.pop(idx)
        self.episodes.pop(idx)

        # Only pop from these lists if they have been added to
        if len(self.orientation_indexes) > 0:
            self.orientation_indexes.pop(idx)
        if len(self.policy_action) > 0:
            self.policy_action.pop(idx)
        if len(self.action_noise) > 0:
            self.action_noise.pop(idx)

        self.replay_ep_num -= 1

        # If we have popped off the final episode, initialize the arrays as a nested list
        if len(self.state) == 0:
            self.state = [[]]
            self.action = [[]]
            self.next_state = [[]]
            self.reward = [[]]
            self.not_done = [[]]
            self.episodes = [[]]  # Keep track of episode start/finish indexes
            self.orientation_indexes = []

    def add_episode(self, start):
        """
        Remove old
        Initialize np array
        """
        # call it when each episode starts
        if start:
            self.episodes[-1].append(self.timesteps_count)
        # call it when each episode ends
        else:
            self.episodes[-1].append(self.timesteps_count)
            self.episodes.append([])
            self.timesteps_count = 0  # Reset count of timesteps within an episode
        return

    def add_orientation_idx_to_replay(self, idx):
        """ Add orientation noise for each episode """
        # Appends for each episode
        self.orientation_indexes.append(idx)

    def sample(self):
        """ Sample one episode from replay buffer, learn from full trajectory """

        """"""
        # Choose one random episode between [0,episode_count)
        episode_idx = random.choice(np.arange(0, self.replay_ep_num))

        # Get the beginning timestep index and the ending timestep index within an episode
        selected_indexes = np.arange(self.episodes[episode_idx][0], self.episodes[episode_idx][1])

        return (
            torch.FloatTensor([self.state[episode_idx][x] for x in selected_indexes]).to(self.device),
            torch.FloatTensor([self.action[episode_idx][x] for x in selected_indexes]).to(self.device),
            torch.FloatTensor([self.next_state[episode_idx][x] for x in selected_indexes]).to(self.device),
            torch.FloatTensor([self.reward[episode_idx][x] for x in selected_indexes]).to(self.device),
            torch.FloatTensor([self.not_done[episode_idx][x] for x in selected_indexes]).to(self.device)
        )

    def sample_batch_nstep(self, batch_size):
        """ Samples batch size of replay buffer trajectories for learning using n-step returns """
        # Initialize arrays
        state_arr = []
        action_arr = []
        next_state_arr = []
        reward_arr = []
        not_done_arr = []

        if batch_size == 0 or self.replay_ep_num == 0 or self.replay_ep_num < batch_size:
            print('ending early')
            return (
                torch.FloatTensor(state_arr).to(self.device),
                torch.FloatTensor(action_arr).to(self.device),
                torch.FloatTensor(next_state_arr).to(self.device),
                torch.FloatTensor(reward_arr).to(self.device),
                torch.FloatTensor(not_done_arr).to(self.device)
            )

        # List of randomly-selected episode indices based on current number of episodes
        episode_idx_arr = np.random.randint(max(1, self.replay_ep_num - 1), size=batch_size)

        for idx in episode_idx_arr:
            # Get episode length (number of time steps)
            episode_len = len(self.state[idx])

            # get the ceiling idx. note the stagger b/c of n steps. the 1 is so that we don't pick 0 as an index (see next part)
            ceiling = episode_len - self.n_steps

            # Get the trajectory from starting index to n_steps later
            trajectory_arr_idx = []

            for num in range(ceiling - 1):
                start_idx = num  # np.random.randint(ceiling) --> use this for random sampling
                trajectory_arr_idx.append(np.arange(start_idx, start_idx + self.n_steps))

            trajectory_arr_idx.append(np.arange(ceiling, ceiling + self.n_steps))

            temp_state = np.array(self.state[idx])
            temp_action = np.array(self.action[idx])
            temp_next_state = np.array(self.next_state[idx])
            temp_reward = np.array(self.reward[idx])
            temp_not_done = np.array(self.not_done[idx])

            for row in trajectory_arr_idx:
                state_arr.append(temp_state[row])
                action_arr.append(temp_action[row])
                next_state_arr.append(temp_next_state[row])
                reward_arr.append(temp_reward[row])
                not_done_arr.append(temp_not_done[row])


        cuda_state_arr = torch.FloatTensor(state_arr).to(self.device)
        cuda_action_arr = torch.FloatTensor(action_arr).to(self.device)
        cuda_next_state_arr = torch.FloatTensor(next_state_arr).to(self.device)
        cuda_reward_arr = torch.FloatTensor(reward_arr).to(self.device)
        cuda_not_done_arr = torch.FloatTensor(not_done_arr).to(self.device)

        return (
            cuda_state_arr,
            cuda_action_arr,
            cuda_next_state_arr,
            cuda_reward_arr,
            cuda_not_done_arr
        )

    def replace(self, reward, done):
        """
        Used to replace the last time step of an episode
        to include lift reward and set the done bit as True
        @param reward: The updated lift reward value
        @param done: The updated done bit value
        """

        if len(self.reward) == 0 or len(self.reward[-1]) == 0:
            print("We cannot replace the reward as for this episode as we have not done any transitions!")
            return 0

        if not done:
            print("Can only replace last time step of the latest episode")
            raise ValueError

        # Current episode index
        episode_idx = len(self.reward) - 1  # self.replay_ep_num - 1
        # Current reward index
        idx = len(self.reward[episode_idx]) - 1
        old_reward = self.reward[episode_idx][idx]
        self.reward[episode_idx][idx] = reward
        self.not_done[episode_idx][idx] = 1. - float(done)

        # increment episode count
        self.episodes_count += 1
        self.replay_ep_num += 1
        # print("ADDED DONE BIT")

        # Append empty list to start new row for an episode
        self.state.append([])
        self.action.append([])
        self.next_state.append([])
        self.reward.append([])
        self.not_done.append([])

        self.policy_action.append([])
        self.action_noise.append([])

        # If over max number of episodes for replay buffer
        if self.replay_ep_num > self.max_episode:
            self.remove_episode()

        return old_reward

    def save_replay_buffer(self, save_filepath):
        """ Save replay buffer to saving directory """
        save_path = Path(save_filepath)
        save_path.mkdir(parents=True, exist_ok=True)
        save_filepath += "/"

        print("Saving replay buffer...")
        np.save(save_filepath + "state", self.state)
        np.save(save_filepath + "action", self.action)
        np.save(save_filepath + "next_state", self.next_state)
        np.save(save_filepath + "reward", self.reward)
        np.save(save_filepath + "not_done", self.not_done)

        np.save(save_filepath + "policy_action", self.policy_action)
        np.save(save_filepath + "action_noise", self.action_noise)

        np.save(save_filepath + "episodes", self.episodes)  # Keep track of episode start/finish indexes
        np.save(save_filepath + "episodes_info",
                [self.max_episode, self.size, self.episodes_count,
                 self.replay_ep_num])
        np.save(save_filepath + "orientation_indexes",
                self.orientation_indexes)  # Keep track of orientation noise at each timestep
        # max_episode: Maximum number of episodes, limit to when we remove old episodes
        # size: Full size of the replay buffer (number of entries over all episodes)
        # episodes_count: Number of episodes that have occurred (may be more than max replay buffer side)
        # replay_ep_num: Number of episodes currently in the replay buffer
        return save_filepath

    def evaluate_replay_reward(self, reward):
        """ Check the contents of the reward values stored within the replay buffer
        replay_buffer: replay buffer to evaluate
        filepath: filepath where replay buffer is stored (for recording purposes)
        returns: Text to describe the reward contents (recorded in the info.txt file)
        """
        non_zero_count = 0
        finger_reward_count = 0
        grasp_reward_count = 0
        lift_reward_count = 0
        num_rows = 0
        num_elems = 0
        i = 0

        in_check = 0

        for row in reward:
            num_rows += 1
            for elem in row:
                num_elems += 1
                if elem != 0:
                    non_zero_count += 1
                    if elem < 5:
                        finger_reward_count += 1
                    elif elem < 10:
                        grasp_reward_count += 1
                    elif elem > 49:
                        lift_reward_count += 1

            # print("in_check: ",in_check)

            i += 1
        # episode_idx_arr = random.sample(success_idx, 200) # Just successful indexes

        text = "\nnon_zero_reward:  " + str(non_zero_count)
        text += "\nfinger_reward_count:  " + str(finger_reward_count)
        text += "\ngrasp_reward_count:  " + str(grasp_reward_count)
        text += "\nlift_reward_count:  " + str(lift_reward_count)
        text += "\nnum_rows:  " + str(num_rows)

        return text, num_elems

    def store_saved_data_into_replay(self, filepath, sample_size=None):
        """ Restore replay buffer from saved location
        filepath: Filepath of the stored replay buffer
        sample_size: Number of episodes to get from the end of the replay buffer (most recent experience)
        """
        if filepath is None or os.path.isdir(filepath) is False:
            print("Replay buffer not found!! filepath: ", filepath)
            quit()

        print("In store_saved_data_into_replay, filepath: ", filepath)

        expert_state = np.load(filepath + "state.npy", allow_pickle=True).astype('object')
        expert_action = np.load(filepath + "action.npy", allow_pickle=True).astype('object')
        expert_next_state = np.load(filepath + "next_state.npy", allow_pickle=True).astype('object')
        expert_reward = np.load(filepath + "reward.npy", allow_pickle=True).astype('object')
        expert_not_done = np.load(filepath + "not_done.npy", allow_pickle=True).astype('object')

        policy_action_path = Path(filepath + "policy_action.npy")
        if policy_action_path.is_file():
            expert_policy_action = np.load(filepath + "policy_action.npy", allow_pickle=True).astype('object')
        else:
            expert_policy_action = np.array([[]])

        expert_action_path = Path(filepath + "action_noise.npy")
        if expert_action_path.is_file():
            expert_action_noise = np.load(filepath + "action_noise.npy", allow_pickle=True).astype('object')
        else:
            expert_action_noise = np.array([[]])

        expert_episodes = np.load(filepath + "episodes.npy", allow_pickle=True).astype(
            'object')  # Keep track of episode start/finish indexes
        expert_episodes_info = np.load(filepath + "episodes_info.npy", allow_pickle=True)
        # Hand pose orientation per time step per episode
        orient_file = Path(filepath + "orientation_indexes.npy")
        if orient_file.is_file():
            expert_orientation_indexes = np.load(filepath + "orientation_indexes.npy", allow_pickle=True).astype \
                ('object')
            self.orientation_indexes = expert_orientation_indexes.tolist()

        if sample_size is not None:
            expert_state = expert_state[-sample_size:]
            expert_action = expert_action[-sample_size:]
            expert_next_state = expert_next_state[-sample_size:]
            expert_reward = expert_reward[-sample_size:]
            expert_not_done = expert_not_done[-sample_size:]

            expert_policy_action = expert_policy_action[-sample_size:]
            expert_action_noise = expert_action_noise[-sample_size:]
            expert_episodes = expert_episodes[-sample_size:]
            expert_episodes_info = expert_episodes_info[-sample_size:]
            expert_orientation_indexes = expert_orientation_indexes[-sample_size:]

        # If first replay buffer is being added, set to exact values
        if self.size == 0:
            self.state = expert_state.tolist()
            self.action = expert_action.tolist()
            self.next_state = expert_next_state.tolist()
            self.reward = expert_reward.tolist()
            self.not_done = expert_not_done.tolist()
            self.episodes = expert_episodes.tolist()

            self.policy_action = expert_policy_action.tolist()
            self.action_noise = expert_action_noise.tolist()
        else:
            # Otherwise, extend current replay buffer with new replay data
            # Convert numpy array to list and set to replay buffer
            self.state.extend(expert_state.tolist())
            self.action.extend(expert_action.tolist())
            self.next_state.extend(expert_next_state.tolist())
            self.reward.extend(expert_reward.tolist())
            self.not_done.extend(expert_not_done.tolist())
            self.episodes.extend(expert_episodes.tolist())

            self.policy_action.extend(expert_policy_action.tolist())
            self.action_noise.extend(expert_action_noise.tolist())

        # Print out the values stored within the reward array of the replay buffer
        reward_text, num_elems = self.evaluate_replay_reward(self.reward)

        if sample_size is not None:
            self.max_episode += sample_size
            self.size += num_elems
            self.episodes_count += sample_size
            self.replay_ep_num += sample_size
        else:
            self.max_episode += expert_episodes_info[0]
            self.size += expert_episodes_info[1]
            self.episodes_count += expert_episodes_info[2]
            self.replay_ep_num += expert_episodes_info[3]

        # max_episode: Maximum number of episodes, limit to when we remove old episodes
        # size: Full size of the replay buffer (number of entries over all episodes)
        # episodes_count: Number of episodes that have occurred (may be more than max replay buffer side)
        # replay_ep_num: Number of episodes currently in the replay buffer

        text = ""
        text += "\nREPLAY BUFFER: "
        text += "\nfilepath: " + filepath
        text += "\nreplay_buffer.replay_ep_num:  " + str(self.replay_ep_num)
        text += "\nreplay_buffer.size:  " + str(self.size)
        text += "\nreplay_buffer.timesteps_count:  " + str(self.timesteps_count)
        text += reward_text

        print(text)

        # If there is a trailing empty entry [], remove it
        if len(self.reward[-1]) == 0:
            self.remove_episode(-1)

        return text

    def store_from_replay_buffer(self, state_arr, action_arr, next_state_arr, reward_arr, not_done_arr, flipped_done=False):
        """
        I'm super fucking lazy so here's a way to manually set the values of the replay buffer. Use this general function to load existing buffer queues into this structure.

        Make sure all your arrs are in the shape (episodes, timesteps, item dimensionality).
        The outer list is regular Python list, but the inner lists are numpy arrs

        Parameters
        ----------
        state_arr
        action_arr
        next_state_arr
        reward_arr
        not_done_arr: make sure these are floats. 1 and 0
        flipped_done

        Returns
        -------
        nothing

        """

        self.state = state_arr
        self.action = action_arr
        self.next_state = next_state_arr
        self.reward = reward_arr
        self.not_done = not_done_arr
        self.episodes = [np.array([0, len(arr) - 1]) for arr in self.reward]

        # because episodes count can be more than the max replay buffer size...
        self.episodes_count = len(self.reward)
        self.replay_ep_num = len(self.reward)

        self.size = sum([len(arr) for arr in self.reward])  # episodes * length of each episode. variable sized episodes


