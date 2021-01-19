;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::AddPoseToCartesianTrajectory)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'AddPoseToCartesianTrajectory (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORY")
  (make-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORY"))
(unless (find-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORYREQUEST")
  (make-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORYREQUEST"))
(unless (find-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORYRESPONSE")
  (make-package "KINOVA_MSGS::ADDPOSETOCARTESIANTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::AddPoseToCartesianTrajectoryRequest
  :super ros::object
  :slots (_X _Y _Z _ThetaX _ThetaY _ThetaZ ))

(defmethod kinova_msgs::AddPoseToCartesianTrajectoryRequest
  (:init
   (&key
    ((:X __X) 0.0)
    ((:Y __Y) 0.0)
    ((:Z __Z) 0.0)
    ((:ThetaX __ThetaX) 0.0)
    ((:ThetaY __ThetaY) 0.0)
    ((:ThetaZ __ThetaZ) 0.0)
    )
   (send-super :init)
   (setq _X (float __X))
   (setq _Y (float __Y))
   (setq _Z (float __Z))
   (setq _ThetaX (float __ThetaX))
   (setq _ThetaY (float __ThetaY))
   (setq _ThetaZ (float __ThetaZ))
   self)
  (:X
   (&optional __X)
   (if __X (setq _X __X)) _X)
  (:Y
   (&optional __Y)
   (if __Y (setq _Y __Y)) _Y)
  (:Z
   (&optional __Z)
   (if __Z (setq _Z __Z)) _Z)
  (:ThetaX
   (&optional __ThetaX)
   (if __ThetaX (setq _ThetaX __ThetaX)) _ThetaX)
  (:ThetaY
   (&optional __ThetaY)
   (if __ThetaY (setq _ThetaY __ThetaY)) _ThetaY)
  (:ThetaZ
   (&optional __ThetaZ)
   (if __ThetaZ (setq _ThetaZ __ThetaZ)) _ThetaZ)
  (:serialization-length
   ()
   (+
    ;; float32 _X
    4
    ;; float32 _Y
    4
    ;; float32 _Z
    4
    ;; float32 _ThetaX
    4
    ;; float32 _ThetaY
    4
    ;; float32 _ThetaZ
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _X
       (sys::poke _X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Y
       (sys::poke _Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Z
       (sys::poke _Z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ThetaX
       (sys::poke _ThetaX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ThetaY
       (sys::poke _ThetaY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ThetaZ
       (sys::poke _ThetaZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _X
     (setq _X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Y
     (setq _Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Z
     (setq _Z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ThetaX
     (setq _ThetaX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ThetaY
     (setq _ThetaY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ThetaZ
     (setq _ThetaZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass kinova_msgs::AddPoseToCartesianTrajectoryResponse
  :super ros::object
  :slots ())

(defmethod kinova_msgs::AddPoseToCartesianTrajectoryResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass kinova_msgs::AddPoseToCartesianTrajectory
  :super ros::object
  :slots ())

(setf (get kinova_msgs::AddPoseToCartesianTrajectory :md5sum-) "e831d993faea563f6fe69d7db9b384c9")
(setf (get kinova_msgs::AddPoseToCartesianTrajectory :datatype-) "kinova_msgs/AddPoseToCartesianTrajectory")
(setf (get kinova_msgs::AddPoseToCartesianTrajectory :request) kinova_msgs::AddPoseToCartesianTrajectoryRequest)
(setf (get kinova_msgs::AddPoseToCartesianTrajectory :response) kinova_msgs::AddPoseToCartesianTrajectoryResponse)

(defmethod kinova_msgs::AddPoseToCartesianTrajectoryRequest
  (:response () (instance kinova_msgs::AddPoseToCartesianTrajectoryResponse :init)))

(setf (get kinova_msgs::AddPoseToCartesianTrajectoryRequest :md5sum-) "e831d993faea563f6fe69d7db9b384c9")
(setf (get kinova_msgs::AddPoseToCartesianTrajectoryRequest :datatype-) "kinova_msgs/AddPoseToCartesianTrajectoryRequest")
(setf (get kinova_msgs::AddPoseToCartesianTrajectoryRequest :definition-)
      "float32 X
float32 Y
float32 Z
float32 ThetaX
float32 ThetaY
float32 ThetaZ
---

")

(setf (get kinova_msgs::AddPoseToCartesianTrajectoryResponse :md5sum-) "e831d993faea563f6fe69d7db9b384c9")
(setf (get kinova_msgs::AddPoseToCartesianTrajectoryResponse :datatype-) "kinova_msgs/AddPoseToCartesianTrajectoryResponse")
(setf (get kinova_msgs::AddPoseToCartesianTrajectoryResponse :definition-)
      "float32 X
float32 Y
float32 Z
float32 ThetaX
float32 ThetaY
float32 ThetaZ
---

")



(provide :kinova_msgs/AddPoseToCartesianTrajectory "e831d993faea563f6fe69d7db9b384c9")


