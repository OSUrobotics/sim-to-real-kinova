;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::PoseVelocityWithFingers)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'PoseVelocityWithFingers (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::POSEVELOCITYWITHFINGERS")
  (make-package "KINOVA_MSGS::POSEVELOCITYWITHFINGERS"))

(in-package "ROS")
;;//! \htmlinclude PoseVelocityWithFingers.msg.html


(defclass kinova_msgs::PoseVelocityWithFingers
  :super ros::object
  :slots (_twist_linear_x _twist_linear_y _twist_linear_z _twist_angular_x _twist_angular_y _twist_angular_z _fingers_closure_percentage ))

(defmethod kinova_msgs::PoseVelocityWithFingers
  (:init
   (&key
    ((:twist_linear_x __twist_linear_x) 0.0)
    ((:twist_linear_y __twist_linear_y) 0.0)
    ((:twist_linear_z __twist_linear_z) 0.0)
    ((:twist_angular_x __twist_angular_x) 0.0)
    ((:twist_angular_y __twist_angular_y) 0.0)
    ((:twist_angular_z __twist_angular_z) 0.0)
    ((:fingers_closure_percentage __fingers_closure_percentage) 0.0)
    )
   (send-super :init)
   (setq _twist_linear_x (float __twist_linear_x))
   (setq _twist_linear_y (float __twist_linear_y))
   (setq _twist_linear_z (float __twist_linear_z))
   (setq _twist_angular_x (float __twist_angular_x))
   (setq _twist_angular_y (float __twist_angular_y))
   (setq _twist_angular_z (float __twist_angular_z))
   (setq _fingers_closure_percentage (float __fingers_closure_percentage))
   self)
  (:twist_linear_x
   (&optional __twist_linear_x)
   (if __twist_linear_x (setq _twist_linear_x __twist_linear_x)) _twist_linear_x)
  (:twist_linear_y
   (&optional __twist_linear_y)
   (if __twist_linear_y (setq _twist_linear_y __twist_linear_y)) _twist_linear_y)
  (:twist_linear_z
   (&optional __twist_linear_z)
   (if __twist_linear_z (setq _twist_linear_z __twist_linear_z)) _twist_linear_z)
  (:twist_angular_x
   (&optional __twist_angular_x)
   (if __twist_angular_x (setq _twist_angular_x __twist_angular_x)) _twist_angular_x)
  (:twist_angular_y
   (&optional __twist_angular_y)
   (if __twist_angular_y (setq _twist_angular_y __twist_angular_y)) _twist_angular_y)
  (:twist_angular_z
   (&optional __twist_angular_z)
   (if __twist_angular_z (setq _twist_angular_z __twist_angular_z)) _twist_angular_z)
  (:fingers_closure_percentage
   (&optional __fingers_closure_percentage)
   (if __fingers_closure_percentage (setq _fingers_closure_percentage __fingers_closure_percentage)) _fingers_closure_percentage)
  (:serialization-length
   ()
   (+
    ;; float32 _twist_linear_x
    4
    ;; float32 _twist_linear_y
    4
    ;; float32 _twist_linear_z
    4
    ;; float32 _twist_angular_x
    4
    ;; float32 _twist_angular_y
    4
    ;; float32 _twist_angular_z
    4
    ;; float32 _fingers_closure_percentage
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _twist_linear_x
       (sys::poke _twist_linear_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _twist_linear_y
       (sys::poke _twist_linear_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _twist_linear_z
       (sys::poke _twist_linear_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _twist_angular_x
       (sys::poke _twist_angular_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _twist_angular_y
       (sys::poke _twist_angular_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _twist_angular_z
       (sys::poke _twist_angular_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fingers_closure_percentage
       (sys::poke _fingers_closure_percentage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _twist_linear_x
     (setq _twist_linear_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _twist_linear_y
     (setq _twist_linear_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _twist_linear_z
     (setq _twist_linear_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _twist_angular_x
     (setq _twist_angular_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _twist_angular_y
     (setq _twist_angular_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _twist_angular_z
     (setq _twist_angular_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fingers_closure_percentage
     (setq _fingers_closure_percentage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get kinova_msgs::PoseVelocityWithFingers :md5sum-) "2788ab35d01df923e0e72d7c730c2511")
(setf (get kinova_msgs::PoseVelocityWithFingers :datatype-) "kinova_msgs/PoseVelocityWithFingers")
(setf (get kinova_msgs::PoseVelocityWithFingers :definition-)
      "float32 twist_linear_x
float32 twist_linear_y
float32 twist_linear_z
float32 twist_angular_x
float32 twist_angular_y
float32 twist_angular_z
float32 fingers_closure_percentage

")



(provide :kinova_msgs/PoseVelocityWithFingers "2788ab35d01df923e0e72d7c730c2511")


