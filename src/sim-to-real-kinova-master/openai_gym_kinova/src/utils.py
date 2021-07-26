import numpy as np

from typing import List


def lerp(action_arr, old_min=0, old_max=3, new_min=0, new_max=6800):
    # first: scale to proper min max
    np_arr = np.array(action_arr)
    scale_factor = (new_max - new_min) / (old_max - old_min)
    scaled_arr = (np_arr - old_min) * scale_factor + new_min
    return scaled_arr


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


class Noiser:
    """
    Adds some fucking noise
    """

    def __init__(self, x_noise: List, y_noise: List, z_noise: List, roll_noise: List, pitch_noise: List,
                 yaw_noise: List, noise_range='fixed', noise_distribution='uniform'):
        self.x_noise = x_noise
        self.y_noise = y_noise
        self.z_noise = z_noise
        self.roll_noise = roll_noise
        self.pitch_noise = pitch_noise
        self.yaw_noise = yaw_noise

        self.noise_range = noise_range
        assert self.noise_range in ['random', 'fixed'], 'your noise range is wrong. see: ' + self.noise_range

        if self.noise_range == 'random':
            self.noise_distribution = noise_distribution
            assert self.noise_distribution in ['uniform',
                                               'normal'], 'your noise distribution is wrong. see: ' + self.noise_distribution
            # and then assume the lists are length 2
            for noise_arr in [x_noise, y_noise, z_noise, roll_noise, pitch_noise, yaw_noise]:
                assert len(noise_arr) == 2, 'one of your noise arrays is not length 2. should be a min and max'
        elif self.noise_range == 'fixed':
            # go through every permutation
            self.noise_permutation_counter = 0
            self.reset_counter = 0

            # this is doggy doo list comprehension no working
            self.noise_permutation_arr = [np.array([x, y, z, roll, pitch, yaw]) for x in x_noise for y in y_noise for z in z_noise
                                          for roll in roll_noise for pitch in pitch_noise for yaw in yaw_noise]
            # self.noise_permutation_arr = []
            # for x in x_noise:
            #     for y in y_noise:
            #         for z in z_noise:
            #             for roll in roll_noise:
            #                 for pitch in pitch_noise:
            #                     for yaw in yaw_noise:
            #                         self.noise_permutation_arr.append(np.array([x, y, z, roll, pitch, yaw]))

            print('============== ALL LA PERMS')
            print(self.noise_permutation_arr)

    def sample_noise(self):
        """
        Returns noise as a numpy array.

        If the noise range is from fixed values, a reset counter and permutation counter system is provided.
        TODO: write some more docs on how the permutation counter and reset counter works.

        Returns
        -------

        """
        if self.noise_range == 'random':

            if self.noise_distribution == 'uniform':
                x = np.random.uniform(low=self.x_noise[0], high=self.x_noise[1])
                y = np.random.uniform(low=self.y_noise[0], high=self.y_noise[1])
                z = np.random.uniform(low=self.z_noise[0], high=self.z_noise[1])
                roll = np.random.uniform(low=self.roll_noise[0], high=self.roll_noise[1])
                pitch = np.random.uniform(low=self.pitch_noise[0], high=self.pitch_noise[1])
                yaw = np.random.uniform(low=self.yaw_noise[0], high=self.yaw_noise[1])

            elif self.noise_distribution == 'normal':
                # oop write this later
                x = np.random.choice(self.x_noise)
                y = np.random.choice(self.y_noise)
                z = np.random.choice(self.z_noise)
                roll = np.random.choice(self.roll_noise)
                pitch = np.random.choice(self.pitch_noise)
                yaw = np.random.choice(self.yaw_noise)

            return np.array([x, y, z, roll, pitch, yaw])

        elif self.noise_range == 'fixed':
            if self.noise_permutation_counter == len(self.noise_permutation_arr):
                self.noise_permutation_counter = 0
                self.reset_counter += 1

            # grab the permutation
            noise_arr = self.noise_permutation_arr[self.noise_permutation_counter]

            # increment position in permutation arr
            self.noise_permutation_counter += 1

            return noise_arr, self.noise_permutation_counter, self.reset_counter
