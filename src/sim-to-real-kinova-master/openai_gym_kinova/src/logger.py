import os
from pathlib import Path

import numpy as np
# import pandas as pd  # eventually... we will write csvs.
from PIL import Image, ImageDraw, ImageFont

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

    def __init__(self, log_dir, use_video=True, config='rl', start_episode_num=1):
        """
        Initialize logging class

        Parameters
        ----------
        log_dir - the log directory
        use_video - whether to record video as well
        config - misc variable for naming which losses and metrics to record
        """
        self._log_dir = log_dir
        self._episode_dir = os.path.join(self._log_dir, 'episodes/')
        self._use_video = use_video
        self.rel_dirname = os.path.dirname(__file__)

        # create a path for the log directory
        path = Path(self._log_dir)
        path.mkdir(parents=True, exist_ok=True)
        print(path)

        episodes_path = Path(self._episode_dir)
        episodes_path.mkdir(parents=True, exist_ok=True)

        if use_video:  # if we are using video, make a directory for the video
            self.video_path_name = os.path.join(self._log_dir, 'video/')
            video_path = Path(self.video_path_name)
            video_path.mkdir(parents=True, exist_ok=True)

            # note: FPS is hardcoded to 30 == 30hz
            # note: height and width is hardcoded to 1080x1920. see your camera for your dimensions.
            self.video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920, camera_id=0,
                                                fps=30)
            self.debug_video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920,
                                                      camera_id=0,
                                                      fps=30)

        # marker telling us whether we should record the current episode
        self.record_curr_episode = True
        self.episode_num = start_episode_num

        self.buffer_size = 0

        self.tmp_action = []
        self.tmp_obs = []
        self.tmp_next_obs = []
        self.tmp_reward = []
        self.tmp_done = []

        self.translation_errors = []  # in some metric space unit lol
        self.quaternion_distances = []  # these are just rotation differences, in radians

        self.start_pose = np.zeros((7,))  # this will be replaced in record_starting_position
        self.noise_arr = np.zeros((6,))  # this will be replaced in record_starting_position

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
            self.debug_video_recorder.init(enabled=True)

    def record_starting_position(self, obs, info, noise_info=None, simulator=False):
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

        if not simulator:

            # Step 1.3: Get orientation of the end effector (and make sure the XYZ is 0 0 0?)
            curr_pose_unformatted = info['curr_pose']
            curr_pose = np.array(
                [curr_pose_unformatted.position.x, curr_pose_unformatted.position.y, curr_pose_unformatted.position.z,
                 curr_pose_unformatted.orientation.x, curr_pose_unformatted.orientation.y,
                 curr_pose_unformatted.orientation.z, curr_pose_unformatted.orientation.w])
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

            # add start pose and noise info
            self.start_pose = start_pose
        else:
            self.start_pose = info['start_pose']

        if noise_info is not None:
            # TODO: figure out if we need to store start position, noises, and if we want to store in a csv.
            curr_noise_arr = np.array(
                [noise_info['x_noise'], noise_info['y_noise'], noise_info['z_noise'], noise_info['roll_noise'],
                 noise_info['pitch_noise'], noise_info['yaw_noise']])
            self.noise_arr = curr_noise_arr

            # TODO: I just made the realization that your pose doesn't really matter. just your last 4 things for hand orientation. see th


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

        # increment buffer size
        self.buffer_size += 1

        # record image if recording video
        if self._use_video:
            img = info['curr_image']
            # note: two versions of video recorder. one that records with just the raw info, one that records with diagnostics.
            self.video_recorder.record_image(img)

            text_overlay = 'Timestep: ' + str(self.buffer_size) + '\n' + 'Action: ' + str(
                action.round(decimals=3)) + '\n' + 'Obs: ' + str(obs.round(decimals=3)) + '\n' + \
                           'Reward: ' + str(reward) + '\n' + 'Done: ' + str(done) + '\n' + 'Start Noise: ' + str(self.noise_arr)

            font_filepath = os.path.join(self.rel_dirname, 'fonts/arial.ttf')
            font = ImageFont.truetype(font_filepath, 26)

            # Assumes RGB!
            pil_img = Image.fromarray(img, 'RGB')
            draw = ImageDraw.Draw(pil_img)

            # h = pil_img.size[1]
            # draw.text((0, h-(h/4)), text_overlay, (255,255,255), font=font)
            draw.text((0, 0), text_overlay, (255, 255, 255), font=font)

            self.debug_video_recorder.record_image(pil_img)

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

        translation_errors = np.array(self.translation_errors)  # in some metric space unit lol
        quaternion_distances = np.array(self.quaternion_distances)

        # print('SIZES')
        # print(len(self.tmp_action))
        # print(action.shape)
        # print(action)

        # save a buffer of the singular episode
        # why do we save each replay buffer individually? because each episode will have varying lengths. we tradeoff single file storage for this
        np.save(os.path.join(self._episode_dir, 'action_' + str(self.episode_num).zfill(3) + '.npy'), action)
        np.save(os.path.join(self._episode_dir, 'obs_' + str(self.episode_num).zfill(3) + '.npy'), obs)
        np.save(os.path.join(self._episode_dir, 'next_obs_' + str(self.episode_num).zfill(3) + '.npy'), next_obs)
        np.save(os.path.join(self._episode_dir, 'reward_' + str(self.episode_num).zfill(3) + '.npy'), reward)
        np.save(os.path.join(self._episode_dir, 'done_' + str(self.episode_num).zfill(3) + '.npy'), done)

        np.save(os.path.join(self._episode_dir, 'translation_err_' + str(self.episode_num).zfill(3) + '.npy'), translation_errors)
        np.save(os.path.join(self._episode_dir, 'quat_dist_' + str(self.episode_num).zfill(3) + '.npy'), quaternion_distances)

        # TODO: save start pose, noises, and other things. maybe in a csv?
        # noise and start pose are already numpy arrs
        np.save(os.path.join(self._episode_dir, 'start_pose_' + str(self.episode_num).zfill(3) + '.npy'), self.start_pose)
        np.save(os.path.join(self._episode_dir, 'noise_arr_' + str(self.episode_num).zfill(3) + '.npy'), self.noise_arr)

        # reset the arrays
        self.tmp_action = []
        self.tmp_obs = []
        self.tmp_next_obs = []
        self.tmp_reward = []
        self.tmp_done = []

        self.translation_errors = []  # in some metric space unit lol
        self.quaternion_distances = []  # these are just rotation differences, in radians

        # since start pose and noise arr will be overwritten, we don't need to worry about resetting those

        if self._use_video:
            print('SAVING!!!')
            # save the video
            self.video_recorder.save('video_' + str(self.episode_num))
            # this is bad practice, but just make a new video recorder lol
            self.video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920, camera_id=0,
                                                fps=30)

            self.debug_video_recorder.save('debug_video_' + str(self.episode_num))
            # this is bad practice, but just make a new video recorder lol
            self.debug_video_recorder = VideoRecorder(dir_name=self.video_path_name, height=1080, width=1920, camera_id=0,
                                                fps=30)

        self.episode_num += 1
        self.buffer_size = 0

        self.record_curr_episode = False

        return True
