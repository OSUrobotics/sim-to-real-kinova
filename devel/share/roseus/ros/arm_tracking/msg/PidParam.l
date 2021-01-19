;; Auto-generated. Do not edit!


(when (boundp 'arm_tracking::PidParam)
  (if (not (find-package "ARM_TRACKING"))
    (make-package "ARM_TRACKING"))
  (shadow 'PidParam (find-package "ARM_TRACKING")))
(unless (find-package "ARM_TRACKING::PIDPARAM")
  (make-package "ARM_TRACKING::PIDPARAM"))

(in-package "ROS")
;;//! \htmlinclude PidParam.msg.html


(defclass arm_tracking::PidParam
  :super ros::object
  :slots (_kp _ki _kd ))

(defmethod arm_tracking::PidParam
  (:init
   (&key
    ((:kp __kp) 0.0)
    ((:ki __ki) 0.0)
    ((:kd __kd) 0.0)
    )
   (send-super :init)
   (setq _kp (float __kp))
   (setq _ki (float __ki))
   (setq _kd (float __kd))
   self)
  (:kp
   (&optional __kp)
   (if __kp (setq _kp __kp)) _kp)
  (:ki
   (&optional __ki)
   (if __ki (setq _ki __ki)) _ki)
  (:kd
   (&optional __kd)
   (if __kd (setq _kd __kd)) _kd)
  (:serialization-length
   ()
   (+
    ;; float64 _kp
    8
    ;; float64 _ki
    8
    ;; float64 _kd
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _kp
       (sys::poke _kp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ki
       (sys::poke _ki (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _kd
       (sys::poke _kd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _kp
     (setq _kp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ki
     (setq _ki (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _kd
     (setq _kd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get arm_tracking::PidParam :md5sum-) "972f4074b1c05b4e6ef321f04d38ec3f")
(setf (get arm_tracking::PidParam :datatype-) "arm_tracking/PidParam")
(setf (get arm_tracking::PidParam :definition-)
      "float64 kp
float64 ki
float64 kd

")



(provide :arm_tracking/PidParam "972f4074b1c05b4e6ef321f04d38ec3f")


