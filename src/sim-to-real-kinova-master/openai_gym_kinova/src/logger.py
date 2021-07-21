import os
from pathlib import Path

import numpy as np
# import pandas as pd  # eventually... we will write csvs.
from video import VideoRecorder

# from torch.utils.tensorboard import SummaryWriter

FORMAT_CONFIG = {
    'rl': {
        'train': [
            ('episode', 'E', 'int'), ('step', 'S', 'int'),
            ('duration', 'D', 'time'), ('episode_reward', 'R', 'float'),
            ('batch_reward', 'BR', 'float'), ('actor_loss', 'A_LOSS', 'float'),
            ('critic_loss', 'CR_LOSS', 'float')
        ],
        'eval': [('step', 'S', 'int'), ('mean_episode_reward', 'MER', 'float'), ('success_rate', 'SR', 'float')]
    }
}


class Logger(object):
    """
    A class for logging stuff
    """

    def __init__(self, log_dir, use_video=True, config='rl'):
        """
        Initialize logging class

        Parameters
        ----------
        log_dir - the log directory
        use_video - whether to record video as well
        config - misc variable for naming which losses and metrics to record
        """
        self._log_dir = log_dir
        self._use_video = use_video

        # create a path for the log directory
        path = Path(self._log_dir)
        path.mkdir(parents=True, exist_ok=True)
        print(path)

        if use_video:  # if we are using video, make a directory for the video
            self.video_path_name = os.path.join(self._log_dir, 'video/')
            video_path = Path(self.video_path_name)
            video_path.mkdir(parents=True, exist_ok=True)

            self.video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920, camera_id=0,
                                                fps=4)

        # marker telling us whether we should record the current episode
        self.record_curr_episode = True
        self.episode_num = 1

        self.tmp_action = []
        self.tmp_obs = []
        self.tmp_next_obs = []
        self.tmp_reward = []
        self.tmp_done = []

    def record_current_episode(self, record_episode=True):
        """
        Flag the current episode for recording.

        Parameters
        ----------
        record_episode - boolean
        """
        self.record_curr_episode = record_episode
        if self._use_video:
            self.video_recorder.init(enabled=True)

    def log_single_step(self, action, obs, next_obs, reward, done, info):
        """
        Log a single step in the episode

        Parameters
        ----------
        action
        obs
        next_obs
        reward
        done
        info

        Returns
        -------

        """
        if not self.record_curr_episode:
            print("NOT RECORDING CURRENT EPISODE!")
            return

        # ensure that everything is numpy array...

        self.tmp_action.append(action)
        self.tmp_obs.append(obs)
        self.tmp_next_obs.append(next_obs)
        self.tmp_reward.append(reward)
        self.tmp_done.append(done)

        # record image if recording video
        if self._use_video:
            img = info['curr_image']
            self.video_recorder.record_image(img)

    def finish_recording(self):
        """
        To be called at the end of an episode. Saves numpy arrays of the episode specific replay buffer.
        If specified earlier, video is saved as GIF.

        Returns
        -------

        """
        # Finishes the current recording and saves it. Returns False if some error occurs
        # TODO: try catch or actually return false

        # convert all the temp stuff to numpy arrays
        action = np.array(self.tmp_action)
        obs = np.array(self.tmp_obs)
        next_obs = np.array(self.tmp_next_obs)
        reward = np.array(self.tmp_reward)
        done = np.array(self.tmp_done)

        # print('SIZES')
        # print(len(self.tmp_action))
        # print(action.shape)
        # print(action)

        # save a buffer of the singular episode
        # TODO: why isn't this saving lol. look in the conversion, it probably has somethign to do with that
        np.save(os.path.join(self._log_dir, 'action_' + str(self.episode_num) + '.npy'), action)
        np.save(os.path.join(self._log_dir, 'obs_' + str(self.episode_num) + '.npy'), obs)
        np.save(os.path.join(self._log_dir, 'next_obs_' + str(self.episode_num) + '.npy'), next_obs)
        np.save(os.path.join(self._log_dir, 'reward_' + str(self.episode_num) + '.npy'), reward)
        np.save(os.path.join(self._log_dir, 'done_' + str(self.episode_num) + '.npy'), done)

        # reset the arrays
        self.tmp_action = []
        self.tmp_obs = []
        self.tmp_next_obs = []
        self.tmp_reward = []
        self.tmp_done = []

        if self._use_video:
            print('SAVING!!!')
            # save the video
            self.video_recorder.save('video_' + str(self.episode_num))
            # this is bad practice, but just make a new video recorder lol
            self.video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920, camera_id=0,
                                                fps=4)

        self.episode_num += 1

        self.record_curr_episode = False

        return True
