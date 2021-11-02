"""
From https://github.com/PhilipZRH/ferm/blob/de990bf0c916f9d81861cdff210137fa7f67d0ce/video.py#L5
"""

import imageio
import os


class VideoRecorder(object):
    """
    Records a video.
    """

    # TODO: what FPS should we use? (depends on our rospy.rate)
    # TODO: NEED TO FIX THE COLOR ON THE IMAGE WELP
    def __init__(self, dir_name, height=1080, width=1920, camera_id=0, fps=30):
        """
        Initialize the video recorder

        Parameters
        ----------
        dir_name - where to save the video
        height - height of the video. not actually used anywhere
        width - width of the video. not actually used anywhere
        camera_id - camera id of the video. not actually used anywhere
        fps - frames per second of the source. this will affect the gif speed relative to number of images
        """
        self.dir_name = dir_name
        self.height = height
        self.width = width
        self.camera_id = camera_id
        self.fps = fps
        self.frames = []
        self.enabled = False  # switch for turning on video recorder

    def init(self, enabled=True):
        """
        Turn on the video recorder.

        Parameters
        ----------
        enabled

        Returns
        -------

        """
        self.frames = []
        self.enabled = self.dir_name is not None and enabled

    def record_image(self, image):
        """
        Record a single image to eventually be turned into the video

        Parameters
        ----------
        image - RGB image, numpy array

        Returns
        -------

        """
        self.frames.append(image)

    def save(self, file_name):
        """
        Saves a video in GIF format in the directory specified at initialization

        Parameters
        ----------
        file_name - file name. should not have any extensions.

        Returns
        -------

        """
        if self.enabled:
            path = os.path.join(self.dir_name, file_name + '.gif')
            imageio.mimsave(path, self.frames, fps=self.fps)
