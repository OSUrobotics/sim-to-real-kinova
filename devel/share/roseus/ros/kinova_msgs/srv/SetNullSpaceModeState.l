;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::SetNullSpaceModeState)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'SetNullSpaceModeState (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::SETNULLSPACEMODESTATE")
  (make-package "KINOVA_MSGS::SETNULLSPACEMODESTATE"))
(unless (find-package "KINOVA_MSGS::SETNULLSPACEMODESTATEREQUEST")
  (make-package "KINOVA_MSGS::SETNULLSPACEMODESTATEREQUEST"))
(unless (find-package "KINOVA_MSGS::SETNULLSPACEMODESTATERESPONSE")
  (make-package "KINOVA_MSGS::SETNULLSPACEMODESTATERESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::SetNullSpaceModeStateRequest
  :super ros::object
  :slots (_state ))

(defmethod kinova_msgs::SetNullSpaceModeStateRequest
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

(defclass kinova_msgs::SetNullSpaceModeStateResponse
  :super ros::object
  :slots ())

(defmethod kinova_msgs::SetNullSpaceModeStateResponse
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

(defclass kinova_msgs::SetNullSpaceModeState
  :super ros::object
  :slots ())

(setf (get kinova_msgs::SetNullSpaceModeState :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetNullSpaceModeState :datatype-) "kinova_msgs/SetNullSpaceModeState")
(setf (get kinova_msgs::SetNullSpaceModeState :request) kinova_msgs::SetNullSpaceModeStateRequest)
(setf (get kinova_msgs::SetNullSpaceModeState :response) kinova_msgs::SetNullSpaceModeStateResponse)

(defmethod kinova_msgs::SetNullSpaceModeStateRequest
  (:response () (instance kinova_msgs::SetNullSpaceModeStateResponse :init)))

(setf (get kinova_msgs::SetNullSpaceModeStateRequest :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetNullSpaceModeStateRequest :datatype-) "kinova_msgs/SetNullSpaceModeStateRequest")
(setf (get kinova_msgs::SetNullSpaceModeStateRequest :definition-)
      "uint16 state
---

")

(setf (get kinova_msgs::SetNullSpaceModeStateResponse :md5sum-) "891b541ef99af7889d0f22a062410be8")
(setf (get kinova_msgs::SetNullSpaceModeStateResponse :datatype-) "kinova_msgs/SetNullSpaceModeStateResponse")
(setf (get kinova_msgs::SetNullSpaceModeStateResponse :definition-)
      "uint16 state
---

")



(provide :kinova_msgs/SetNullSpaceModeState "891b541ef99af7889d0f22a062410be8")


