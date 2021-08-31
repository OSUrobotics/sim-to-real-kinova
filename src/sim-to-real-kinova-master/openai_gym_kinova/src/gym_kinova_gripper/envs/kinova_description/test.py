from mujoco_py import MjViewer, load_model_from_path, MjSim
# import gym
import os
rel_dirname = os.path.dirname(__file__)

filepath = os.path.join(rel_dirname, "j2s7s300_end_effector_v1_CubeM.xml")
filepath = os.path.join(rel_dirname, "j2s7s300_end_effector_v1_CylinderM.xml")
filepath = os.path.join(rel_dirname, "j2s7s300_end_effector_v1_Cone1M.xml")
filepath = os.path.join(rel_dirname, "j2s7s300_end_effector_v1_Vase1M.xml")

print('filepath: ', filepath)

model = load_model_from_path(filepath)
robot = MjSim(model)
viewer = MjViewer(robot)
viewer.cam.fixedcamid = 0
viewer.cam.type = 2  # constant for CAMERA_FIXED
while True:
	# robot.render(camera_name='camera')
	viewer.render()