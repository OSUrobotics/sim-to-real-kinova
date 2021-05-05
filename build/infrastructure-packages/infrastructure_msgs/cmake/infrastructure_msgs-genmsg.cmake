# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "infrastructure_msgs: 16 messages, 0 services")

set(MSG_I_FLAGS "-Iinfrastructure_msgs:/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg;-Iinfrastructure_msgs:/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(infrastructure_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" "actionlib_msgs/GoalStatus:infrastructure_msgs/StageResult:infrastructure_msgs/StageActionFeedback:infrastructure_msgs/StageActionResult:infrastructure_msgs/StageActionGoal:infrastructure_msgs/StageGoal:actionlib_msgs/GoalID:infrastructure_msgs/StageFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" "actionlib_msgs/GoalID:infrastructure_msgs/StageGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:infrastructure_msgs/StageResult:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:infrastructure_msgs/StageFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" "actionlib_msgs/GoalStatus:infrastructure_msgs/DataCollectionActionFeedback:infrastructure_msgs/DataCollectionGoal:infrastructure_msgs/DataCollectionResult:infrastructure_msgs/DataCollectionActionGoal:actionlib_msgs/GoalID:infrastructure_msgs/DataCollectionActionResult:infrastructure_msgs/DataCollectionFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" "actionlib_msgs/GoalID:infrastructure_msgs/DataCollectionGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:infrastructure_msgs/DataCollectionResult:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:infrastructure_msgs/DataCollectionFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" ""
)

get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_custom_target(_infrastructure_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "infrastructure_msgs" "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_cpp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(infrastructure_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(infrastructure_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(infrastructure_msgs_generate_messages infrastructure_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_cpp _infrastructure_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(infrastructure_msgs_gencpp)
add_dependencies(infrastructure_msgs_gencpp infrastructure_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS infrastructure_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_eus(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(infrastructure_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(infrastructure_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(infrastructure_msgs_generate_messages infrastructure_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_eus _infrastructure_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(infrastructure_msgs_geneus)
add_dependencies(infrastructure_msgs_geneus infrastructure_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS infrastructure_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_lisp(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(infrastructure_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(infrastructure_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(infrastructure_msgs_generate_messages infrastructure_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_lisp _infrastructure_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(infrastructure_msgs_genlisp)
add_dependencies(infrastructure_msgs_genlisp infrastructure_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS infrastructure_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_nodejs(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(infrastructure_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(infrastructure_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(infrastructure_msgs_generate_messages infrastructure_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_nodejs _infrastructure_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(infrastructure_msgs_gennodejs)
add_dependencies(infrastructure_msgs_gennodejs infrastructure_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS infrastructure_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)
_generate_msg_py(infrastructure_msgs
  "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(infrastructure_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(infrastructure_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(infrastructure_msgs_generate_messages infrastructure_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/full_kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg" NAME_WE)
add_dependencies(infrastructure_msgs_generate_messages_py _infrastructure_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(infrastructure_msgs_genpy)
add_dependencies(infrastructure_msgs_genpy infrastructure_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS infrastructure_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/infrastructure_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(infrastructure_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(infrastructure_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/infrastructure_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(infrastructure_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(infrastructure_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/infrastructure_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(infrastructure_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(infrastructure_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/infrastructure_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(infrastructure_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(infrastructure_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/infrastructure_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(infrastructure_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(infrastructure_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
