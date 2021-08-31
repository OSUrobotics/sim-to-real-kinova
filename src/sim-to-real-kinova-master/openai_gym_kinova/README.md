# openai kinova gym wrapper

wrapper for controlling grasp strategies with RL in real life.

### Evaluating the RL algorithm:

#### Simulation

Terminal A:

```
cd ~/
conda deactivate
. kinova_venv/bin/activate

cd ~/sim-to-real-kinova/src/sim-to-real-kinova-master/openai_gym_kinova/src
python main_experiment_sim.py --config_name <YOUR CONFIGURATION YAML FILE HERE>
```

#### Real world

Create 3 terminals:

Terminal A:

```
roscore
```

Terminal B:

```
cd ~/
conda deactivate
. kinova_venv/bin/activate

cd ~/sim-to-real-kinova
source devel/setup.bash
roslaunch kinova_bringup kinova_robot.launch kinova_robotType:=j2s7s300
```

Terminal C:

```
cd ~/
conda deactivate
. kinova_venv/bin/activate

cd ~/sim-to-real-kinova
source devel/setup.bash
roslaunch j2s7s300_moveit_config j2s7s300_demo.launch
```



Then, go to `main_experiment.py` in the `openai_gym_kinova/src/` folder. Change line `81` from `filename = <something>` to `filename = <name_of_config_in_experiment_configs_folder.yaml>`

Afterwards, run this command. NOTE: If you want to start a new experiment, you don't have to reset terminals A-C, just D.

Terminal D:

```
cd ~/
conda deactivate
. kinova_venv/bin/activate

cd ~/sim-to-real-kinova
source devel/setup.bash
roslaunch openai_gym_kinova main_experiment.launch
```



### Changing experiment configurations:

Configs are located in `openai_gym_kinova/experiment_configs/` folder. Feel free to change `experiment_configs`.

#### Params:

`experiment_name`: The experiment name, and the logging directory where logs will be contained.

##### `controller` params:

`type`: type of controller. `constant`, `rl` are the only two working options

`speed`: In the real world, this is between 0-6800. In the simulation, this is between 0 and 3. Max speeds close in 1 second. Half speeds close in 2.

`options`: deprecated list of speed options for `discrete_random` controller - ignore.

`distribution`: deprecated noise distribution type for `continuous_random` controller - ignore.

`policy_filepath`: filepath of policy. assumes some pattern along the lines of `_actor`, `_critic`, etc. will be appended directly to the end of the policy filepath string.

`live_training`: sim specific config. turns on live training after each episode.

`state_dim_setup`: sim specific config. name of specific state space to use.

##### `logger` params:

`use_logger`: whether to use the logger or not.

`use_video`: whether to save gifs of episodes or not.

`log_dir`: deprecated, logging directory for logging class

##### `noise` params:

`noise_range`: type of positional+orientational noise to conduct. just stick to `fixed_list` and feed in your manual noises (more described later)

`noise_distribution`: deprecated, related to the noise distribution of continuous noise

`fixed_list`: feed in an array of 6 element arrays in the following format: `[x_noise, y_noise, z_noise, roll_noise, pitch_noise, yaw_noise]`

`x_noise`: deprecated, for random from lists. possible x noise permuations.

`y_noise`: deprecated, for random from lists. possible y noise permuations.

`z_noise`: deprecated, for random from lists. possible z noise permuations.

`roll_noise`: deprecated, for random from lists. possible roll noise permuations.

`pitch_noise`: deprecated, for random from lists. possible pitch noise permuations.

`yaw_noise`: deprecated, for random from lists. possible yaw noise permuations.

##### miscellaneous params (at the bottom):

`max_timesteps`: maximum timesteps in lifting phase.

`shape`: string corresponding to the shape used in the grasp. can only pick one from `CubeM, CylinderM, Cone1M, Vase1M`



### Running analysis scripts + comparison scripts

For a single experiment of analysis:

`python3 visualize_irl.py --log_dir <name of your logging directory>`

Logging directory can be either simulation or real world logs. This generates:

1. graph of successes over x+y position from origin grasp position
2. graph of successes comparing euclidean distance from origin (starting pos) and quaternion rotation distance in hand orientation from normal grasp position.
3. a `csv` of xyz noises, success, euclidean translation error, quaternion rotation distance



For comparing two folders to another:

`python3 compare_sim_to_real_analysis.py --real_dir <name of real world log dir> --sim_dir <name of simulation log dir> --results_dir <desired logging directory> --compare_gifs`

This generates:

1. comparison graph of successes over x+y position from origin grasp position
2. comparison graph of observation variables used
3. comparison graph of object path in xyz position from palm. incredibly noisy IRL
4. if `--compare_gifs` flag is used: side-by-side gifs of real world and simulation grasps

