;; Auto-generated. Do not edit!


(when (boundp 'arm_tracking::TrackedPose)
  (if (not (find-package "ARM_TRACKING"))
    (make-package "ARM_TRACKING"))
  (shadow 'TrackedPose (find-package "ARM_TRACKING")))
(unless (find-package "ARM_TRACKING::TRACKEDPOSE")
  (make-package "ARM_TRACKING::TRACKEDPOSE"))

(in-package "ROS")
;;//! \htmlinclude TrackedPose.msg.html


(defclass arm_tracking::TrackedPose
  :super ros::object
  :slots (_robot_base_rvec _robot_base_tvec _robot_ef_rvec _robot_ef_tvec _workpiece_rvec _workpiece_tvec _workpiece_corners_x _workpiece_corners_y _robot_ef_corners_x _robot_ef_corners_y ))

(defmethod arm_tracking::TrackedPose
  (:init
   (&key
    ((:robot_base_rvec __robot_base_rvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:robot_base_tvec __robot_base_tvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:robot_ef_rvec __robot_ef_rvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:robot_ef_tvec __robot_ef_tvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:workpiece_rvec __workpiece_rvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:workpiece_tvec __workpiece_tvec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:workpiece_corners_x __workpiece_corners_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:workpiece_corners_y __workpiece_corners_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:robot_ef_corners_x __robot_ef_corners_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:robot_ef_corners_y __robot_ef_corners_y) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _robot_base_rvec __robot_base_rvec)
   (setq _robot_base_tvec __robot_base_tvec)
   (setq _robot_ef_rvec __robot_ef_rvec)
   (setq _robot_ef_tvec __robot_ef_tvec)
   (setq _workpiece_rvec __workpiece_rvec)
   (setq _workpiece_tvec __workpiece_tvec)
   (setq _workpiece_corners_x __workpiece_corners_x)
   (setq _workpiece_corners_y __workpiece_corners_y)
   (setq _robot_ef_corners_x __robot_ef_corners_x)
   (setq _robot_ef_corners_y __robot_ef_corners_y)
   self)
  (:robot_base_rvec
   (&optional __robot_base_rvec)
   (if __robot_base_rvec (setq _robot_base_rvec __robot_base_rvec)) _robot_base_rvec)
  (:robot_base_tvec
   (&optional __robot_base_tvec)
   (if __robot_base_tvec (setq _robot_base_tvec __robot_base_tvec)) _robot_base_tvec)
  (:robot_ef_rvec
   (&optional __robot_ef_rvec)
   (if __robot_ef_rvec (setq _robot_ef_rvec __robot_ef_rvec)) _robot_ef_rvec)
  (:robot_ef_tvec
   (&optional __robot_ef_tvec)
   (if __robot_ef_tvec (setq _robot_ef_tvec __robot_ef_tvec)) _robot_ef_tvec)
  (:workpiece_rvec
   (&optional __workpiece_rvec)
   (if __workpiece_rvec (setq _workpiece_rvec __workpiece_rvec)) _workpiece_rvec)
  (:workpiece_tvec
   (&optional __workpiece_tvec)
   (if __workpiece_tvec (setq _workpiece_tvec __workpiece_tvec)) _workpiece_tvec)
  (:workpiece_corners_x
   (&optional __workpiece_corners_x)
   (if __workpiece_corners_x (setq _workpiece_corners_x __workpiece_corners_x)) _workpiece_corners_x)
  (:workpiece_corners_y
   (&optional __workpiece_corners_y)
   (if __workpiece_corners_y (setq _workpiece_corners_y __workpiece_corners_y)) _workpiece_corners_y)
  (:robot_ef_corners_x
   (&optional __robot_ef_corners_x)
   (if __robot_ef_corners_x (setq _robot_ef_corners_x __robot_ef_corners_x)) _robot_ef_corners_x)
  (:robot_ef_corners_y
   (&optional __robot_ef_corners_y)
   (if __robot_ef_corners_y (setq _robot_ef_corners_y __robot_ef_corners_y)) _robot_ef_corners_y)
  (:serialization-length
   ()
   (+
    ;; float64[] _robot_base_rvec
    (* 8    (length _robot_base_rvec)) 4
    ;; float64[] _robot_base_tvec
    (* 8    (length _robot_base_tvec)) 4
    ;; float64[] _robot_ef_rvec
    (* 8    (length _robot_ef_rvec)) 4
    ;; float64[] _robot_ef_tvec
    (* 8    (length _robot_ef_tvec)) 4
    ;; float64[] _workpiece_rvec
    (* 8    (length _workpiece_rvec)) 4
    ;; float64[] _workpiece_tvec
    (* 8    (length _workpiece_tvec)) 4
    ;; float64[] _workpiece_corners_x
    (* 8    (length _workpiece_corners_x)) 4
    ;; float64[] _workpiece_corners_y
    (* 8    (length _workpiece_corners_y)) 4
    ;; float64[] _robot_ef_corners_x
    (* 8    (length _robot_ef_corners_x)) 4
    ;; float64[] _robot_ef_corners_y
    (* 8    (length _robot_ef_corners_y)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _robot_base_rvec
     (write-long (length _robot_base_rvec) s)
     (dotimes (i (length _robot_base_rvec))
       (sys::poke (elt _robot_base_rvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _robot_base_tvec
     (write-long (length _robot_base_tvec) s)
     (dotimes (i (length _robot_base_tvec))
       (sys::poke (elt _robot_base_tvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _robot_ef_rvec
     (write-long (length _robot_ef_rvec) s)
     (dotimes (i (length _robot_ef_rvec))
       (sys::poke (elt _robot_ef_rvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _robot_ef_tvec
     (write-long (length _robot_ef_tvec) s)
     (dotimes (i (length _robot_ef_tvec))
       (sys::poke (elt _robot_ef_tvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _workpiece_rvec
     (write-long (length _workpiece_rvec) s)
     (dotimes (i (length _workpiece_rvec))
       (sys::poke (elt _workpiece_rvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _workpiece_tvec
     (write-long (length _workpiece_tvec) s)
     (dotimes (i (length _workpiece_tvec))
       (sys::poke (elt _workpiece_tvec i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _workpiece_corners_x
     (write-long (length _workpiece_corners_x) s)
     (dotimes (i (length _workpiece_corners_x))
       (sys::poke (elt _workpiece_corners_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _workpiece_corners_y
     (write-long (length _workpiece_corners_y) s)
     (dotimes (i (length _workpiece_corners_y))
       (sys::poke (elt _workpiece_corners_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _robot_ef_corners_x
     (write-long (length _robot_ef_corners_x) s)
     (dotimes (i (length _robot_ef_corners_x))
       (sys::poke (elt _robot_ef_corners_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _robot_ef_corners_y
     (write-long (length _robot_ef_corners_y) s)
     (dotimes (i (length _robot_ef_corners_y))
       (sys::poke (elt _robot_ef_corners_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _robot_base_rvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_base_rvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_base_rvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _robot_base_tvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_base_tvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_base_tvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _robot_ef_rvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_ef_rvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_ef_rvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _robot_ef_tvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_ef_tvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_ef_tvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _workpiece_rvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _workpiece_rvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _workpiece_rvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _workpiece_tvec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _workpiece_tvec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _workpiece_tvec i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _workpiece_corners_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _workpiece_corners_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _workpiece_corners_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _workpiece_corners_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _workpiece_corners_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _workpiece_corners_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _robot_ef_corners_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_ef_corners_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_ef_corners_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _robot_ef_corners_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_ef_corners_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _robot_ef_corners_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get arm_tracking::TrackedPose :md5sum-) "339ac58acc7c50a83fc20359186dc24d")
(setf (get arm_tracking::TrackedPose :datatype-) "arm_tracking/TrackedPose")
(setf (get arm_tracking::TrackedPose :definition-)
      "float64[] robot_base_rvec
float64[] robot_base_tvec
float64[] robot_ef_rvec
float64[] robot_ef_tvec
float64[] workpiece_rvec
float64[] workpiece_tvec
#workpiece marker corner x coordinates
float64[] workpiece_corners_x 
#workpiece marker corner y coordinates
float64[] workpiece_corners_y 

#robot ef marker corner x coordinates
float64[] robot_ef_corners_x 
#robot ef marker corner y coordinates
float64[] robot_ef_corners_y 

")



(provide :arm_tracking/TrackedPose "339ac58acc7c50a83fc20359186dc24d")


