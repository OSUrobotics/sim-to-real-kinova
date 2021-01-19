# Install script for directory: /home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nigel/kinova_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/msg" TYPE FILE FILES
    "/home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DoorSensors.msg"
    "/home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs/msg/DataTimestamps.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/action" TYPE FILE FILES
    "/home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs/action/Stage.action"
    "/home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs/action/DataCollection.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/msg" TYPE FILE FILES
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageAction.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageActionGoal.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageActionResult.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageActionFeedback.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageGoal.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageResult.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/StageFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/msg" TYPE FILE FILES
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionAction.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionGoal.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionResult.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionActionFeedback.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionGoal.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionResult.msg"
    "/home/nigel/kinova_ws/devel/share/infrastructure_msgs/msg/DataCollectionFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/cmake" TYPE FILE FILES "/home/nigel/kinova_ws/build/infrastructure-packages/infrastructure_msgs/catkin_generated/installspace/infrastructure_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/devel/include/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/devel/share/roseus/ros/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/devel/share/common-lisp/ros/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/devel/share/gennodejs/ros/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/nigel/kinova_ws/devel/lib/python3/dist-packages/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/devel/lib/python3/dist-packages/infrastructure_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/nigel/kinova_ws/build/infrastructure-packages/infrastructure_msgs/catkin_generated/installspace/infrastructure_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/cmake" TYPE FILE FILES "/home/nigel/kinova_ws/build/infrastructure-packages/infrastructure_msgs/catkin_generated/installspace/infrastructure_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs/cmake" TYPE FILE FILES
    "/home/nigel/kinova_ws/build/infrastructure-packages/infrastructure_msgs/catkin_generated/installspace/infrastructure_msgsConfig.cmake"
    "/home/nigel/kinova_ws/build/infrastructure-packages/infrastructure_msgs/catkin_generated/installspace/infrastructure_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/infrastructure_msgs" TYPE FILE FILES "/home/nigel/kinova_ws/src/infrastructure-packages/infrastructure_msgs/package.xml")
endif()

