# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kinova_msgs: 36 messages, 12 services")

set(MSG_I_FLAGS "-Ikinova_msgs:/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg;-Ikinova_msgs:/home/nigel/kinova_ws/devel/share/kinova_msgs/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kinova_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" "kinova_msgs/ArmJointAnglesResult:kinova_msgs/ArmJointAnglesActionFeedback:kinova_msgs/ArmJointAnglesActionGoal:kinova_msgs/ArmJointAnglesGoal:kinova_msgs/ArmJointAnglesActionResult:std_msgs/Header:kinova_msgs/JointAngles:actionlib_msgs/GoalStatus:kinova_msgs/ArmJointAnglesFeedback:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:kinova_msgs/ArmJointAnglesGoal:kinova_msgs/JointAngles"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" "kinova_msgs/ArmJointAnglesResult:std_msgs/Header:kinova_msgs/JointAngles:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" "std_msgs/Header:kinova_msgs/ArmJointAnglesFeedback:actionlib_msgs/GoalStatus:kinova_msgs/JointAngles:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" "kinova_msgs/JointAngles"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" "kinova_msgs/JointAngles"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" "kinova_msgs/JointAngles"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" "kinova_msgs/ArmPoseFeedback:kinova_msgs/ArmPoseResult:kinova_msgs/ArmPoseActionFeedback:kinova_msgs/ArmPoseActionGoal:kinova_msgs/ArmPoseGoal:kinova_msgs/ArmPoseActionResult:geometry_msgs/PoseStamped:geometry_msgs/Pose:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" "kinova_msgs/ArmPoseGoal:geometry_msgs/PoseStamped:geometry_msgs/Pose:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" "kinova_msgs/ArmPoseResult:geometry_msgs/PoseStamped:geometry_msgs/Pose:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" "kinova_msgs/ArmPoseFeedback:geometry_msgs/PoseStamped:geometry_msgs/Pose:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" "geometry_msgs/Pose:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" "geometry_msgs/Pose:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" "geometry_msgs/Pose:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" "kinova_msgs/Arm_KinovaPoseFeedback:kinova_msgs/Arm_KinovaPoseActionGoal:kinova_msgs/Arm_KinovaPoseActionFeedback:kinova_msgs/Arm_KinovaPoseActionResult:std_msgs/Header:kinova_msgs/Arm_KinovaPoseGoal:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kinova_msgs/Arm_KinovaPoseResult:kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:kinova_msgs/Arm_KinovaPoseGoal:kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kinova_msgs/Arm_KinovaPoseResult:kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" "kinova_msgs/Arm_KinovaPoseFeedback:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" "kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" "kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" "kinova_msgs/KinovaPose"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" "kinova_msgs/SetFingersPositionResult:kinova_msgs/FingerPosition:kinova_msgs/SetFingersPositionActionFeedback:kinova_msgs/SetFingersPositionActionResult:std_msgs/Header:actionlib_msgs/GoalStatus:kinova_msgs/SetFingersPositionActionGoal:kinova_msgs/SetFingersPositionGoal:actionlib_msgs/GoalID:kinova_msgs/SetFingersPositionFeedback"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" "kinova_msgs/SetFingersPositionGoal:std_msgs/Header:actionlib_msgs/GoalID:kinova_msgs/FingerPosition"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" "kinova_msgs/SetFingersPositionResult:kinova_msgs/FingerPosition:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" "kinova_msgs/FingerPosition:std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:kinova_msgs/SetFingersPositionFeedback"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" "kinova_msgs/FingerPosition"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" "kinova_msgs/FingerPosition"
)

get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" "kinova_msgs/FingerPosition"
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_custom_target(_kinova_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_msgs" "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_cpp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)

### Generating Services
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_cpp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
)

### Generating Module File
_generate_module_cpp(kinova_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kinova_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kinova_msgs_generate_messages kinova_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_cpp _kinova_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_msgs_gencpp)
add_dependencies(kinova_msgs_gencpp kinova_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_msg_eus(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)

### Generating Services
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)
_generate_srv_eus(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
)

### Generating Module File
_generate_module_eus(kinova_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kinova_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kinova_msgs_generate_messages kinova_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_eus _kinova_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_msgs_geneus)
add_dependencies(kinova_msgs_geneus kinova_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_msg_lisp(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)

### Generating Services
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)
_generate_srv_lisp(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
)

### Generating Module File
_generate_module_lisp(kinova_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kinova_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kinova_msgs_generate_messages kinova_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_lisp _kinova_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_msgs_genlisp)
add_dependencies(kinova_msgs_genlisp kinova_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_msg_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)

### Generating Services
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)
_generate_srv_nodejs(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
)

### Generating Module File
_generate_module_nodejs(kinova_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kinova_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kinova_msgs_generate_messages kinova_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_nodejs _kinova_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_msgs_gennodejs)
add_dependencies(kinova_msgs_gennodejs kinova_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg;/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_msg_py(kinova_msgs
  "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)

### Generating Services
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)
_generate_srv_py(kinova_msgs
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
)

### Generating Module File
_generate_module_py(kinova_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kinova_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kinova_msgs_generate_messages kinova_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/FingerPosition.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointAngles.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/JointTorque.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/KinovaPose.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocity.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/PoseVelocityWithFingers.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/msg/CartesianForce.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmJointAnglesFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/ArmPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/Arm_KinovaPoseFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionAction.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionActionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionGoal.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionResult.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/devel/share/kinova_msgs/msg/SetFingersPositionFeedback.msg" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Start.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/Stop.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/HomeArm.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetForceControlParams.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetEndEffectorOffset.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetNullSpaceModeState.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlMode.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/SetTorqueControlParameters.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ClearTrajectories.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/ZeroTorques.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/AddPoseToCartesianTrajectory.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_msgs/srv/RunCOMParametersEstimation.srv" NAME_WE)
add_dependencies(kinova_msgs_generate_messages_py _kinova_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_msgs_genpy)
add_dependencies(kinova_msgs_genpy kinova_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(kinova_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(kinova_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(kinova_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(kinova_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(kinova_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(kinova_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(kinova_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(kinova_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(kinova_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(kinova_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
