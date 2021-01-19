;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::SetForceControlParams)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'SetForceControlParams (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::SETFORCECONTROLPARAMS")
  (make-package "KINOVA_MSGS::SETFORCECONTROLPARAMS"))
(unless (find-package "KINOVA_MSGS::SETFORCECONTROLPARAMSREQUEST")
  (make-package "KINOVA_MSGS::SETFORCECONTROLPARAMSREQUEST"))
(unless (find-package "KINOVA_MSGS::SETFORCECONTROLPARAMSRESPONSE")
  (make-package "KINOVA_MSGS::SETFORCECONTROLPARAMSRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass kinova_msgs::SetForceControlParamsRequest
  :super ros::object
  :slots (_inertia_linear _inertia_angular _damping_linear _damping_angular _force_min_linear _force_min_angular _force_max_linear _force_max_angular ))

(defmethod kinova_msgs::SetForceControlParamsRequest
  (:init
   (&key
    ((:inertia_linear __inertia_linear) (instance geometry_msgs::Vector3 :init))
    ((:inertia_angular __inertia_angular) (instance geometry_msgs::Vector3 :init))
    ((:damping_linear __damping_linear) (instance geometry_msgs::Vector3 :init))
    ((:damping_angular __damping_angular) (instance geometry_msgs::Vector3 :init))
    ((:force_min_linear __force_min_linear) (instance geometry_msgs::Vector3 :init))
    ((:force_min_angular __force_min_angular) (instance geometry_msgs::Vector3 :init))
    ((:force_max_linear __force_max_linear) (instance geometry_msgs::Vector3 :init))
    ((:force_max_angular __force_max_angular) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _inertia_linear __inertia_linear)
   (setq _inertia_angular __inertia_angular)
   (setq _damping_linear __damping_linear)
   (setq _damping_angular __damping_angular)
   (setq _force_min_linear __force_min_linear)
   (setq _force_min_angular __force_min_angular)
   (setq _force_max_linear __force_max_linear)
   (setq _force_max_angular __force_max_angular)
   self)
  (:inertia_linear
   (&rest __inertia_linear)
   (if (keywordp (car __inertia_linear))
       (send* _inertia_linear __inertia_linear)
     (progn
       (if __inertia_linear (setq _inertia_linear (car __inertia_linear)))
       _inertia_linear)))
  (:inertia_angular
   (&rest __inertia_angular)
   (if (keywordp (car __inertia_angular))
       (send* _inertia_angular __inertia_angular)
     (progn
       (if __inertia_angular (setq _inertia_angular (car __inertia_angular)))
       _inertia_angular)))
  (:damping_linear
   (&rest __damping_linear)
   (if (keywordp (car __damping_linear))
       (send* _damping_linear __damping_linear)
     (progn
       (if __damping_linear (setq _damping_linear (car __damping_linear)))
       _damping_linear)))
  (:damping_angular
   (&rest __damping_angular)
   (if (keywordp (car __damping_angular))
       (send* _damping_angular __damping_angular)
     (progn
       (if __damping_angular (setq _damping_angular (car __damping_angular)))
       _damping_angular)))
  (:force_min_linear
   (&rest __force_min_linear)
   (if (keywordp (car __force_min_linear))
       (send* _force_min_linear __force_min_linear)
     (progn
       (if __force_min_linear (setq _force_min_linear (car __force_min_linear)))
       _force_min_linear)))
  (:force_min_angular
   (&rest __force_min_angular)
   (if (keywordp (car __force_min_angular))
       (send* _force_min_angular __force_min_angular)
     (progn
       (if __force_min_angular (setq _force_min_angular (car __force_min_angular)))
       _force_min_angular)))
  (:force_max_linear
   (&rest __force_max_linear)
   (if (keywordp (car __force_max_linear))
       (send* _force_max_linear __force_max_linear)
     (progn
       (if __force_max_linear (setq _force_max_linear (car __force_max_linear)))
       _force_max_linear)))
  (:force_max_angular
   (&rest __force_max_angular)
   (if (keywordp (car __force_max_angular))
       (send* _force_max_angular __force_max_angular)
     (progn
       (if __force_max_angular (setq _force_max_angular (car __force_max_angular)))
       _force_max_angular)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _inertia_linear
    (send _inertia_linear :serialization-length)
    ;; geometry_msgs/Vector3 _inertia_angular
    (send _inertia_angular :serialization-length)
    ;; geometry_msgs/Vector3 _damping_linear
    (send _damping_linear :serialization-length)
    ;; geometry_msgs/Vector3 _damping_angular
    (send _damping_angular :serialization-length)
    ;; geometry_msgs/Vector3 _force_min_linear
    (send _force_min_linear :serialization-length)
    ;; geometry_msgs/Vector3 _force_min_angular
    (send _force_min_angular :serialization-length)
    ;; geometry_msgs/Vector3 _force_max_linear
    (send _force_max_linear :serialization-length)
    ;; geometry_msgs/Vector3 _force_max_angular
    (send _force_max_angular :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _inertia_linear
       (send _inertia_linear :serialize s)
     ;; geometry_msgs/Vector3 _inertia_angular
       (send _inertia_angular :serialize s)
     ;; geometry_msgs/Vector3 _damping_linear
       (send _damping_linear :serialize s)
     ;; geometry_msgs/Vector3 _damping_angular
       (send _damping_angular :serialize s)
     ;; geometry_msgs/Vector3 _force_min_linear
       (send _force_min_linear :serialize s)
     ;; geometry_msgs/Vector3 _force_min_angular
       (send _force_min_angular :serialize s)
     ;; geometry_msgs/Vector3 _force_max_linear
       (send _force_max_linear :serialize s)
     ;; geometry_msgs/Vector3 _force_max_angular
       (send _force_max_angular :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _inertia_linear
     (send _inertia_linear :deserialize buf ptr-) (incf ptr- (send _inertia_linear :serialization-length))
   ;; geometry_msgs/Vector3 _inertia_angular
     (send _inertia_angular :deserialize buf ptr-) (incf ptr- (send _inertia_angular :serialization-length))
   ;; geometry_msgs/Vector3 _damping_linear
     (send _damping_linear :deserialize buf ptr-) (incf ptr- (send _damping_linear :serialization-length))
   ;; geometry_msgs/Vector3 _damping_angular
     (send _damping_angular :deserialize buf ptr-) (incf ptr- (send _damping_angular :serialization-length))
   ;; geometry_msgs/Vector3 _force_min_linear
     (send _force_min_linear :deserialize buf ptr-) (incf ptr- (send _force_min_linear :serialization-length))
   ;; geometry_msgs/Vector3 _force_min_angular
     (send _force_min_angular :deserialize buf ptr-) (incf ptr- (send _force_min_angular :serialization-length))
   ;; geometry_msgs/Vector3 _force_max_linear
     (send _force_max_linear :deserialize buf ptr-) (incf ptr- (send _force_max_linear :serialization-length))
   ;; geometry_msgs/Vector3 _force_max_angular
     (send _force_max_angular :deserialize buf ptr-) (incf ptr- (send _force_max_angular :serialization-length))
   ;;
   self)
  )

(defclass kinova_msgs::SetForceControlParamsResponse
  :super ros::object
  :slots ())

(defmethod kinova_msgs::SetForceControlParamsResponse
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

(defclass kinova_msgs::SetForceControlParams
  :super ros::object
  :slots ())

(setf (get kinova_msgs::SetForceControlParams :md5sum-) "5c0999be3d1c60dba47ea0b2fd08231e")
(setf (get kinova_msgs::SetForceControlParams :datatype-) "kinova_msgs/SetForceControlParams")
(setf (get kinova_msgs::SetForceControlParams :request) kinova_msgs::SetForceControlParamsRequest)
(setf (get kinova_msgs::SetForceControlParams :response) kinova_msgs::SetForceControlParamsResponse)

(defmethod kinova_msgs::SetForceControlParamsRequest
  (:response () (instance kinova_msgs::SetForceControlParamsResponse :init)))

(setf (get kinova_msgs::SetForceControlParamsRequest :md5sum-) "5c0999be3d1c60dba47ea0b2fd08231e")
(setf (get kinova_msgs::SetForceControlParamsRequest :datatype-) "kinova_msgs/SetForceControlParamsRequest")
(setf (get kinova_msgs::SetForceControlParamsRequest :definition-)
      "geometry_msgs/Vector3 inertia_linear
geometry_msgs/Vector3 inertia_angular
geometry_msgs/Vector3 damping_linear
geometry_msgs/Vector3 damping_angular
geometry_msgs/Vector3 force_min_linear
geometry_msgs/Vector3 force_min_angular
geometry_msgs/Vector3 force_max_linear
geometry_msgs/Vector3 force_max_angular

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

(setf (get kinova_msgs::SetForceControlParamsResponse :md5sum-) "5c0999be3d1c60dba47ea0b2fd08231e")
(setf (get kinova_msgs::SetForceControlParamsResponse :datatype-) "kinova_msgs/SetForceControlParamsResponse")
(setf (get kinova_msgs::SetForceControlParamsResponse :definition-)
      "geometry_msgs/Vector3 inertia_linear
geometry_msgs/Vector3 inertia_angular
geometry_msgs/Vector3 damping_linear
geometry_msgs/Vector3 damping_angular
geometry_msgs/Vector3 force_min_linear
geometry_msgs/Vector3 force_min_angular
geometry_msgs/Vector3 force_max_linear
geometry_msgs/Vector3 force_max_angular

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



(provide :kinova_msgs/SetForceControlParams "5c0999be3d1c60dba47ea0b2fd08231e")


