;; Auto-generated. Do not edit!


(when (boundp 'arm_tracking::PidUpdate)
  (if (not (find-package "ARM_TRACKING"))
    (make-package "ARM_TRACKING"))
  (shadow 'PidUpdate (find-package "ARM_TRACKING")))
(unless (find-package "ARM_TRACKING::PIDUPDATE")
  (make-package "ARM_TRACKING::PIDUPDATE"))

(in-package "ROS")
;;//! \htmlinclude PidUpdate.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass arm_tracking::PidUpdate
  :super ros::object
  :slots (_header _pid_param _error _integ_error _delta_error _response ))

(defmethod arm_tracking::PidUpdate
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pid_param __pid_param) (instance arm_tracking::PidParam :init))
    ((:error __error) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:integ_error __integ_error) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:delta_error __delta_error) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:response __response) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pid_param __pid_param)
   (setq _error __error)
   (setq _integ_error __integ_error)
   (setq _delta_error __delta_error)
   (setq _response __response)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pid_param
   (&rest __pid_param)
   (if (keywordp (car __pid_param))
       (send* _pid_param __pid_param)
     (progn
       (if __pid_param (setq _pid_param (car __pid_param)))
       _pid_param)))
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:integ_error
   (&optional __integ_error)
   (if __integ_error (setq _integ_error __integ_error)) _integ_error)
  (:delta_error
   (&optional __delta_error)
   (if __delta_error (setq _delta_error __delta_error)) _delta_error)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; arm_tracking/PidParam _pid_param
    (send _pid_param :serialization-length)
    ;; float64[] _error
    (* 8    (length _error)) 4
    ;; float64[] _integ_error
    (* 8    (length _integ_error)) 4
    ;; float64[] _delta_error
    (* 8    (length _delta_error)) 4
    ;; float64[] _response
    (* 8    (length _response)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; arm_tracking/PidParam _pid_param
       (send _pid_param :serialize s)
     ;; float64[] _error
     (write-long (length _error) s)
     (dotimes (i (length _error))
       (sys::poke (elt _error i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _integ_error
     (write-long (length _integ_error) s)
     (dotimes (i (length _integ_error))
       (sys::poke (elt _integ_error i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _delta_error
     (write-long (length _delta_error) s)
     (dotimes (i (length _delta_error))
       (sys::poke (elt _delta_error i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _response
     (write-long (length _response) s)
     (dotimes (i (length _response))
       (sys::poke (elt _response i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; arm_tracking/PidParam _pid_param
     (send _pid_param :deserialize buf ptr-) (incf ptr- (send _pid_param :serialization-length))
   ;; float64[] _error
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _error (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _error i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _integ_error
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _integ_error (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _integ_error i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _delta_error
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _delta_error (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _delta_error i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _response
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _response (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _response i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get arm_tracking::PidUpdate :md5sum-) "9372ece7e9f74def456f1090966e8315")
(setf (get arm_tracking::PidUpdate :datatype-) "arm_tracking/PidUpdate")
(setf (get arm_tracking::PidUpdate :definition-)
      "Header header
#kp,kd,ki
arm_tracking/PidParam pid_param
float64[] error
float64[] integ_error
float64[] delta_error

#kp*e + kd*delta_e + ki*integ_e
float64[] response

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: arm_tracking/PidParam
float64 kp
float64 ki
float64 kd

")



(provide :arm_tracking/PidUpdate "9372ece7e9f74def456f1090966e8315")


