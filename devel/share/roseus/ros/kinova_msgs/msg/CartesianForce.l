;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::CartesianForce)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'CartesianForce (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::CARTESIANFORCE")
  (make-package "KINOVA_MSGS::CARTESIANFORCE"))

(in-package "ROS")
;;//! \htmlinclude CartesianForce.msg.html


(defclass kinova_msgs::CartesianForce
  :super ros::object
  :slots (_force_x _force_y _force_z _torque_x _torque_y _torque_z ))

(defmethod kinova_msgs::CartesianForce
  (:init
   (&key
    ((:force_x __force_x) 0.0)
    ((:force_y __force_y) 0.0)
    ((:force_z __force_z) 0.0)
    ((:torque_x __torque_x) 0.0)
    ((:torque_y __torque_y) 0.0)
    ((:torque_z __torque_z) 0.0)
    )
   (send-super :init)
   (setq _force_x (float __force_x))
   (setq _force_y (float __force_y))
   (setq _force_z (float __force_z))
   (setq _torque_x (float __torque_x))
   (setq _torque_y (float __torque_y))
   (setq _torque_z (float __torque_z))
   self)
  (:force_x
   (&optional __force_x)
   (if __force_x (setq _force_x __force_x)) _force_x)
  (:force_y
   (&optional __force_y)
   (if __force_y (setq _force_y __force_y)) _force_y)
  (:force_z
   (&optional __force_z)
   (if __force_z (setq _force_z __force_z)) _force_z)
  (:torque_x
   (&optional __torque_x)
   (if __torque_x (setq _torque_x __torque_x)) _torque_x)
  (:torque_y
   (&optional __torque_y)
   (if __torque_y (setq _torque_y __torque_y)) _torque_y)
  (:torque_z
   (&optional __torque_z)
   (if __torque_z (setq _torque_z __torque_z)) _torque_z)
  (:serialization-length
   ()
   (+
    ;; float32 _force_x
    4
    ;; float32 _force_y
    4
    ;; float32 _force_z
    4
    ;; float32 _torque_x
    4
    ;; float32 _torque_y
    4
    ;; float32 _torque_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _force_x
       (sys::poke _force_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _force_y
       (sys::poke _force_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _force_z
       (sys::poke _force_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_x
       (sys::poke _torque_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_y
       (sys::poke _torque_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque_z
       (sys::poke _torque_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _force_x
     (setq _force_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _force_y
     (setq _force_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _force_z
     (setq _force_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_x
     (setq _torque_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_y
     (setq _torque_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque_z
     (setq _torque_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get kinova_msgs::CartesianForce :md5sum-) "b01974557c40b776cdb7003057779989")
(setf (get kinova_msgs::CartesianForce :datatype-) "kinova_msgs/CartesianForce")
(setf (get kinova_msgs::CartesianForce :definition-)
      "float32 force_x
float32 force_y
float32 force_z
float32 torque_x
float32 torque_y
float32 torque_z

")



(provide :kinova_msgs/CartesianForce "b01974557c40b776cdb7003057779989")


