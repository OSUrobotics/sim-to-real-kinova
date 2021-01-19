;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::RunCOMParametersEstimation)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'RunCOMParametersEstimation (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATION")
  (make-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATION"))
(unless (find-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATIONREQUEST")
  (make-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATIONREQUEST"))
(unless (find-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATIONRESPONSE")
  (make-package "KINOVA_MSGS::RUNCOMPARAMETERSESTIMATIONRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::RunCOMParametersEstimationRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::RunCOMParametersEstimationRequest
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

(defclass kinova_msgs::RunCOMParametersEstimationResponse
  :super ros::object
  :slots (_result ))

(defmethod kinova_msgs::RunCOMParametersEstimationResponse
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

(defclass kinova_msgs::RunCOMParametersEstimation
  :super ros::object
  :slots ())

(setf (get kinova_msgs::RunCOMParametersEstimation :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::RunCOMParametersEstimation :datatype-) "kinova_msgs/RunCOMParametersEstimation")
(setf (get kinova_msgs::RunCOMParametersEstimation :request) kinova_msgs::RunCOMParametersEstimationRequest)
(setf (get kinova_msgs::RunCOMParametersEstimation :response) kinova_msgs::RunCOMParametersEstimationResponse)

(defmethod kinova_msgs::RunCOMParametersEstimationRequest
  (:response () (instance kinova_msgs::RunCOMParametersEstimationResponse :init)))

(setf (get kinova_msgs::RunCOMParametersEstimationRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::RunCOMParametersEstimationRequest :datatype-) "kinova_msgs/RunCOMParametersEstimationRequest")
(setf (get kinova_msgs::RunCOMParametersEstimationRequest :definition-)
      "---
string result

")

(setf (get kinova_msgs::RunCOMParametersEstimationResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::RunCOMParametersEstimationResponse :datatype-) "kinova_msgs/RunCOMParametersEstimationResponse")
(setf (get kinova_msgs::RunCOMParametersEstimationResponse :definition-)
      "---
string result

")



(provide :kinova_msgs/RunCOMParametersEstimation "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


