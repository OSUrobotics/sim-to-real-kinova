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

        self.translation_errors = []  # in some metric space unit lol
        self.quaternion_distances = []  # these are just rotation differences, in radians

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

    def record_starting_position(self, obs, info):
        """
        Record the starting position of the object. Feed in the variables from the first time step.
        TODO: incorporate this with log_single_step when it's the first step detected?? (auto)
        TODO: pareshs code

        Parameters
        ----------
        obs - the observation

        Returns
        -------

        """
        # TODO: Grab the XYZ position of the object
        # Step 0: set up the base rotation

        # Step 1.1: Get XYZ position of the object
        obj_pos = obs[15:18]  # TODO: NOTE THE REAL LIFE ERROR IN SOME SEPARATE EXPERIMENTS
        # Step 1.2: Get XYZ position of the end effector JK it's at 0 0 0 <=== whats the hard coding?
        end_effector_pos = np.array([0, 0, 0])

        # Step 1.3: Get orientation of the end effector (and make sure the XYZ is 0 0 0?)
        curr_pose_unformatted = info['curr_pose']
        curr_pose = np.array([curr_pose_unformatted.position.x, curr_pose_unformatted.position.y, curr_pose_unformatted.position.z, curr_pose_unformatted.orientation.x, curr_pose_unformatted.orientation.y, curr_pose_unformatted.orientation.z, curr_pose_unformatted.orientation.w])
        curr_orientation = curr_pose[-4:]
        start_pose = info['start_pose']  # this is already an array
        start_orientation = start_pose[-4:]

        # Step 2: Calculate translation error from optimal grasp (place on x axis).
        # curr_pose_pos = np.array(curr_pose[:3])
        # start_pose_pos = np.array(start_pose[:3])
        # pos_delta = curr_pose_pos - start_pose_pos
        # translation_error = np.sqrt(np.sum(pos_delta ** 2))

        pos_delta = obj_pos - end_effector_pos
        translation_error = np.sqrt(np.sum(pos_delta ** 2))

        # Step 2.1: Turn translation error negative if x is negative as well
        x_delta = obj_pos[0] - end_effector_pos[0]
        if x_delta < 0:
            translation_error = -translation_error

        # Step 3: Calculate quaternion distance (y axis) - between WHAT? base rotation? I guess base rotation is [pi/2, 0, 0] since we do 90deg roll on the x-axis of the base frame
        # Step 4: Yeah what is the rotation?
        quaternion_dot_prod = np.dot(start_orientation, curr_orientation)
        angle_difference = np.arccos(quaternion_dot_prod)  # in degrees
        quat_distance = np.rad2deg(angle_difference)  # in radians

        # Last step: Place in a class wide variable, that can be used to generate a plot.
        # Note: You'll want to keep track of successes over multiple episodes as well.

        self.translation_errors.append(translation_error)
        self.quaternion_distances.append(quat_distance)

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
