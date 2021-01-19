;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::SetTorqueControlParameters)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'SetTorqueControlParameters (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERS")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERS"))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERSREQUEST")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERSREQUEST"))
(unless (find-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERSRESPONSE")
  (make-package "KINOVA_MSGS::SETTORQUECONTROLPARAMETERSRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::SetTorqueControlParametersRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::SetTorqueControlParametersRequest
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

(defclass kinova_msgs::SetTorqueControlParametersResponse
  :super ros::object
  :slots (_result ))

(defmethod kinova_msgs::SetTorqueControlParametersResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass kinova_msgs::SetTorqueControlParameters
  :super ros::object
  :slots ())

(setf (get kinova_msgs::SetTorqueControlParameters :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::SetTorqueControlParameters :datatype-) "kinova_msgs/SetTorqueControlParameters")
(setf (get kinova_msgs::SetTorqueControlParameters :request) kinova_msgs::SetTorqueControlParametersRequest)
(setf (get kinova_msgs::SetTorqueControlParameters :response) kinova_msgs::SetTorqueControlParametersResponse)

(defmethod kinova_msgs::SetTorqueControlParametersRequest
  (:response () (instance kinova_msgs::SetTorqueControlParametersResponse :init)))

(setf (get kinova_msgs::SetTorqueControlParametersRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::SetTorqueControlParametersRequest :datatype-) "kinova_msgs/SetTorqueControlParametersRequest")
(setf (get kinova_msgs::SetTorqueControlParametersRequest :definition-)
      "---
string result

")

(setf (get kinova_msgs::SetTorqueControlParametersResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::SetTorqueControlParametersResponse :datatype-) "kinova_msgs/SetTorqueControlParametersResponse")
(setf (get kinova_msgs::SetTorqueControlParametersResponse :definition-)
      "---
string result

")



(provide :kinova_msgs/SetTorqueControlParameters "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


