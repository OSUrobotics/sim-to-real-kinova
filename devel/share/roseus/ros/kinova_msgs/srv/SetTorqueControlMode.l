;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::SetTorqueControlMode)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'SetTorqueControlMode (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLMODE")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLMODE"))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLMODEREQUEST")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLMODEREQUEST"))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLMODERESPONSE")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLMODERESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::SetTorqueControlModeRequest
  :super ros::object
  :slots (_state ))

(defmethod kinova_msgs::SetTorqueControlModeRequest
  (:init
   (&key
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; uint16 _state
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _state
       (write-word _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _state
     (setq _state (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass kinova_msgs::SetTorqueControlModeResponse
  :super ros::object
  :slots ())

(defmethod kinova_msgs::SetTorqueControlModeResponse
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

(defclass kinova_msgs::SetTorqueControlMode
  :super ros::object
  :slots ())

(setf (get kinova_msgs::SetTorqueControlMode :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetTorqueControlMode :datatype-) "kinova_msgs/SetTorqueControlMode")
(setf (get kinova_msgs::SetTorqueControlMode :request) kinova_msgs::SetTorqueControlModeRequest)
(setf (get kinova_msgs::SetTorqueControlMode :response) kinova_msgs::SetTorqueControlModeResponse)

(defmethod kinova_msgs::SetTorqueControlModeRequest
  (:response () (instance kinova_msgs::SetTorqueControlModeResponse :init)))

(setf (get kinova_msgs::SetTorqueControlModeRequest :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetTorqueControlModeRequest :datatype-) "kinova_msgs/SetTorqueControlModeRequest")
(setf (get kinova_msgs::SetTorqueControlModeRequest :definition-)
      "uint16 state
---

")

(setf (get kinova_msgs::SetTorqueControlModeResponse :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetTorqueControlModeResponse :datatype-) "kinova_msgs/SetTorqueControlModeResponse")
(setf (get kinova_msgs::SetTorqueControlModeResponse :definition-)
      "uint16 state
---

")



(provide :kinova_msgs/SetTorqueControlMode "891b541ef99af7889d0f22a062410be8")


