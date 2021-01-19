;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::ZeroTorques)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'ZeroTorques (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::ZEROTORQUES")
  (make-package "KINOVA_MSGS::ZEROTORQUES"))
(unless (find-package "KINOVA_MSGS::ZEROTORQUESREQUEST")
  (make-package "KINOVA_MSGS::ZEROTORQUESREQUEST"))
(unless (find-package "KINOVA_MSGS::ZEROTORQUESRESPONSE")
  (make-package "KINOVA_MSGS::ZEROTORQUESRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::ZeroTorquesRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::ZeroTorquesRequest
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

(defclass kinova_msgs::ZeroTorquesResponse
  :super ros::object
  :slots (_result ))

(defmethod kinova_msgs::ZeroTorquesResponse
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

(defclass kinova_msgs::ZeroTorques
  :super ros::object
  :slots ())

(setf (get kinova_msgs::ZeroTorques :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ZeroTorques :datatype-) "kinova_msgs/ZeroTorques")
(setf (get kinova_msgs::ZeroTorques :request) kinova_msgs::ZeroTorquesRequest)
(setf (get kinova_msgs::ZeroTorques :response) kinova_msgs::ZeroTorquesResponse)

(defmethod kinova_msgs::ZeroTorquesRequest
  (:response () (instance kinova_msgs::ZeroTorquesResponse :init)))

(setf (get kinova_msgs::ZeroTorquesRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ZeroTorquesRequest :datatype-) "kinova_msgs/ZeroTorquesRequest")
(setf (get kinova_msgs::ZeroTorquesRequest :definition-)
      "---
string result

")

(setf (get kinova_msgs::ZeroTorquesResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get kinova_msgs::ZeroTorquesResponse :datatype-) "kinova_msgs/ZeroTorquesResponse")
(setf (get kinova_msgs::ZeroTorquesResponse :definition-)
      "---
string result

")



(provide :kinova_msgs/ZeroTorques "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


