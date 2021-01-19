;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::ClearTrajectories)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'ClearTrajectories (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::CLEARTRAJECTORIES")
  (make-package "KINOVA_MSGS::CLEARTRAJECTORIES"))
(unless (find-package "KINOVA_MSGS::CLEARTRAJECTORIESREQUEST")
  (make-package "KINOVA_MSGS::CLEARTRAJECTORIESREQUEST"))
(unless (find-package "KINOVA_MSGS::CLEARTRAJECTORIESRESPONSE")
  (make-package "KINOVA_MSGS::CLEARTRAJECTORIESRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::ClearTrajectoriesRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::ClearTrajectoriesRequest
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

(defclass kinova_msgs::ClearTrajectoriesResponse
  :super ros::object
  :slots (_result ))

(defmethod kinova_msgs::ClearTrajectoriesResponse
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

(defclass kinova_msgs::ClearTrajectories
  :super ros::object
  :slots ())

(setf (get kinova_msgs::ClearTrajectories :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ClearTrajectories :datatype-) "kinova_msgs/ClearTrajectories")
(setf (get kinova_msgs::ClearTrajectories :request) kinova_msgs::ClearTrajectoriesRequest)
(setf (get kinova_msgs::ClearTrajectories :response) kinova_msgs::ClearTrajectoriesResponse)

(defmethod kinova_msgs::ClearTrajectoriesRequest
  (:response () (instance kinova_msgs::ClearTrajectoriesResponse :init)))

(setf (get kinova_msgs::ClearTrajectoriesRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ClearTrajectoriesRequest :datatype-) "kinova_msgs/ClearTrajectoriesRequest")
(setf (get kinova_msgs::ClearTrajectoriesRequest :definition-)
      "---
string result

")

(setf (get kinova_msgs::ClearTrajectoriesResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ClearTrajectoriesResponse :datatype-) "kinova_msgs/ClearTrajectoriesResponse")
(setf (get kinova_msgs::ClearTrajectoriesResponse :definition-)
      "---
string result

")



(provide :kinova_msgs/ClearTrajectories "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


