# Install script for directory: /home/nigel/kinova_ws/src/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors

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
  include("/home/nigel/kinova_ws/build/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/nigel/kinova_ws/build/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/catkin_generated/installspace/grasp_reset_flexbe_behaviors.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_reset_flexbe_behaviors/cmake" TYPE FILE FILES
    "/home/nigel/kinova_ws/build/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/catkin_generated/installspace/grasp_reset_flexbe_behaviorsConfig.cmake"
    "/home/nigel/kinova_ws/build/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/catkin_generated/installspace/grasp_reset_flexbe_behaviorsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_reset_flexbe_behaviors" TYPE FILE FILES "/home/nigel/kinova_ws/src/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_reset_flexbe_behaviors" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/src/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/manifest")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_reset_flexbe_behaviors" TYPE DIRECTORY FILES "/home/nigel/kinova_ws/src/sim-to-real-kinova-master/grasp-reset-v2/grasp_reset_flexbe_behaviors/config")
endif()

