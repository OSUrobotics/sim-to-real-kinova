#!/usr/bin/env python

import numpy as np
import cv2 
import glob
import cv2.aruco as aruco
import math

#termination criteria
criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER,30,0.001)

#prepare object points,like (0,0,0), (2,0,0) ...., (6,5,0)
object_p = np.zeros((6*7,3), np.float32)
object_p[:,:2] = np.mgrid[0:7, 0:6].T.reshape(-1,2)

#Array to store object points and image points from all the images
object_points = [] # 3D point in real world space
img_points = [] # 2D points in image plane

#Square size : This is the square size of the checkerboard boxes in meters
# size = 0.025 #m or 25 cm 


images = glob.glob('/home/nuha/kinova_ws/src/traj-control/images/*.jpg')

for fname in images:
    img = cv2.imread(fname)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Find chess board corners
    ret, corners = cv2.findChessboardCorners(gray, (7,6), None)

    # If found, add object points, image points (after refining them)
    if ret == True:
        object_points.append(object_p)

        corners2 = cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),criteria)
        img_points.append(corners2)

        #Draw and display the corners
        img = cv2.drawChessboardCorners(img, (7,6), corners2, ret)
        cv2.imshow('img',img)
        cv2.waitKey(500)


# Get all the relevant matrices
ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(object_points, img_points, gray.shape[::-1],None,None)

print('Camera Matrix:')
print(mtx)
np.save('camera_mtx.npy', mtx)

print('Distortion Matrix:')
print(dist)
np.save('dist_mtx.npy', dist)

