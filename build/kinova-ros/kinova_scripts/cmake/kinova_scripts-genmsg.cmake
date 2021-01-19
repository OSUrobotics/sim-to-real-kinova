# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "kinova_scripts: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(kinova_scripts_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_custom_target(_kinova_scripts_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_scripts" "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" ""
)

get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_custom_target(_kinova_scripts_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "kinova_scripts" "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_scripts
)
_generate_srv_cpp(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_scripts
)

### Generating Module File
_generate_module_cpp(kinova_scripts
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_scripts
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(kinova_scripts_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(kinova_scripts_generate_messages kinova_scripts_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_cpp _kinova_scripts_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_cpp _kinova_scripts_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_scripts_gencpp)
add_dependencies(kinova_scripts_gencpp kinova_scripts_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_scripts_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_scripts
)
_generate_srv_eus(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_scripts
)

### Generating Module File
_generate_module_eus(kinova_scripts
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_scripts
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(kinova_scripts_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(kinova_scripts_generate_messages kinova_scripts_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_eus _kinova_scripts_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_eus _kinova_scripts_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_scripts_geneus)
add_dependencies(kinova_scripts_geneus kinova_scripts_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_scripts_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_scripts
)
_generate_srv_lisp(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_scripts
)

### Generating Module File
_generate_module_lisp(kinova_scripts
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_scripts
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(kinova_scripts_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(kinova_scripts_generate_messages kinova_scripts_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_lisp _kinova_scripts_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_lisp _kinova_scripts_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_scripts_genlisp)
add_dependencies(kinova_scripts_genlisp kinova_scripts_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_scripts_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_scripts
)
_generate_srv_nodejs(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_scripts
)

### Generating Module File
_generate_module_nodejs(kinova_scripts
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_scripts
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(kinova_scripts_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(kinova_scripts_generate_messages kinova_scripts_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_nodejs _kinova_scripts_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_nodejs _kinova_scripts_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_scripts_gennodejs)
add_dependencies(kinova_scripts_gennodejs kinova_scripts_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_scripts_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts
)
_generate_srv_py(kinova_scripts
  "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts
)

### Generating Module File
_generate_module_py(kinova_scripts
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(kinova_scripts_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(kinova_scripts_generate_messages kinova_scripts_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/Joint_angles.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_py _kinova_scripts_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nigel/kinova_ws/src/kinova-ros/kinova_scripts/srv/New_pose.srv" NAME_WE)
add_dependencies(kinova_scripts_generate_messages_py _kinova_scripts_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(kinova_scripts_genpy)
add_dependencies(kinova_scripts_genpy kinova_scripts_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS kinova_scripts_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_scripts)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/kinova_scripts
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(kinova_scripts_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_scripts)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/kinova_scripts
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(kinova_scripts_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_scripts)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/kinova_scripts
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(kinova_scripts_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_scripts)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/kinova_scripts
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(kinova_scripts_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/kinova_scripts
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(kinova_scripts_generate_messages_py std_msgs_generate_messages_py)
endif()
