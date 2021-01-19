;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::SetEndEffectorOffset)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'SetEndEffectorOffset (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::SETENDEFFECTOROFFSET")
  (make-package "KINOVA_MSGS::SETENDEFFECTOROFFSET"))
(unless (find-package "KINOVA_MSGS::SETENDEFFECTOROFFSETREQUEST")
  (make-package "KINOVA_MSGS::SETENDEFFECTOROFFSETREQUEST"))
(unless (find-package "KINOVA_MSGS::SETENDEFFECTOROFFSETRESPONSE")
  (make-package "KINOVA_MSGS::SETENDEFFECTOROFFSETRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass kinova_msgs::SetEndEffectorOffsetRequest
  :super ros::object
  :slots (_status _offset ))

(defmethod kinova_msgs::SetEndEffectorOffsetRequest
  (:init
   (&key
    ((:status __status) 0)
    ((:offset __offset) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _status (round __status))
   (setq _offset __offset)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:offset
   (&rest __offset)
   (if (keywordp (car __offset))
       (send* _offset __offset)
     (progn
       (if __offset (setq _offset (car __offset)))
       _offset)))
  (:serialization-length
   ()
   (+
    ;; uint16 _status
    2
    ;; geometry_msgs/Vector3 _offset
    (send _offset :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _status
       (write-word _status s)
     ;; geometry_msgs/Vector3 _offset
       (send _offset :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _status
     (setq _status (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; geometry_msgs/Vector3 _offset
     (send _offset :deserialize buf ptr-) (incf ptr- (send _offset :serialization-length))
   ;;
   self)
  )

(defclass kinova_msgs::SetEndEffectorOffsetResponse
  :super ros::object
  :slots ())

(defmethod kinova_msgs::SetEndEffectorOffsetResponse
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

(defclass kinova_msgs::SetEndEffectorOffset
  :super ros::object
  :slots ())

(setf (get kinova_msgs::SetEndEffectorOffset :md5sum-) "7a5c04366489f137e01b31118dcce900")
(setf (get kinova_msgs::SetEndEffectorOffset :datatype-) "kinova_msgs/SetEndEffectorOffset")
(setf (get kinova_msgs::SetEndEffectorOffset :request) kinova_msgs::SetEndEffectorOffsetRequest)
(setf (get kinova_msgs::SetEndEffectorOffset :response) kinova_msgs::SetEndEffectorOffsetResponse)

(defmethod kinova_msgs::SetEndEffectorOffsetRequest
  (:response () (instance kinova_msgs::SetEndEffectorOffsetResponse :init)))

(setf (get kinova_msgs::SetEndEffectorOffsetRequest :md5sum-) "7a5c04366489f137e01b31118dcce900")
(setf (get kinova_msgs::SetEndEffectorOffsetRequest :datatype-) "kinova_msgs/SetEndEffectorOffsetRequest")
(setf (get kinova_msgs::SetEndEffectorOffsetRequest :definition-)
      "uint16 status
geometry_msgs/Vector3 offset

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

")

(setf (get kinova_msgs::SetEndEffectorOffsetResponse :md5sum-) "7a5c04366489f137e01b31118dcce900")
(setf (get kinova_msgs::SetEndEffectorOffsetResponse :datatype-) "kinova_msgs/SetEndEffectorOffsetResponse")
(setf (get kinova_msgs::SetEndEffectorOffsetResponse :definition-)
      "uint16 status
geometry_msgs/Vector3 offset

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---

")



(provide :kinova_msgs/SetEndEffectorOffset "7a5c04366489f137e01b31118dcce900")


