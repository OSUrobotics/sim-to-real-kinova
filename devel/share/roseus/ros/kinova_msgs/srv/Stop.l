;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::Stop)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'Stop (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::STOP")
  (make-package "KINOVA_MSGS::STOP"))
(unless (find-package "KINOVA_MSGS::STOPREQUEST")
  (make-package "KINOVA_MSGS::STOPREQUEST"))
(unless (find-package "KINOVA_MSGS::STOPRESPONSE")
  (make-package "KINOVA_MSGS::STOPRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::StopRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::StopRequest
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

(defclass kinova_msgs::StopResponse
  :super ros::object
  :slots (_stop_result ))

(defmethod kinova_msgs::StopResponse
  (:init
   (&key
    ((:stop_result __stop_result) "")
    )
   (send-super :init)
   (setq _stop_result (string __stop_result))
   self)
  (:stop_result
   (&optional __stop_result)
   (if __stop_result (setq _stop_result __stop_result)) _stop_result)
  (:serialization-length
   ()
   (+
    ;; string _stop_result
    4 (length _stop_result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _stop_result
       (write-long (length _stop_result) s) (princ _stop_result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _stop_result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _stop_result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass kinova_msgs::Stop
  :super ros::object
  :slots ())

(setf (get kinova_msgs::Stop :md5sum-) "585dc4164508d473dff8f8b67a05d2ad")
(setf (get kinova_msgs::Stop :datatype-) "kinova_msgs/Stop")
(setf (get kinova_msgs::Stop :request) kinova_msgs::StopRequest)
(setf (get kinova_msgs::Stop :response) kinova_msgs::StopResponse)

(defmethod kinova_msgs::StopRequest
  (:response () (instance kinova_msgs::StopResponse :init)))

(setf (get kinova_msgs::StopRequest :md5sum-) "585dc4164508d473dff8f8b67a05d2ad")
(setf (get kinova_msgs::StopRequest :datatype-) "kinova_msgs/StopRequest")
(setf (get kinova_msgs::StopRequest :definition-)
      "---
string stop_result

")

(setf (get kinova_msgs::StopResponse :md5sum-) "585dc4164508d473dff8f8b67a05d2ad")
(setf (get kinova_msgs::StopResponse :datatype-) "kinova_msgs/StopResponse")
(setf (get kinova_msgs::StopResponse :definition-)
      "---
string stop_result

")



(provide :kinova_msgs/Stop "585dc4164508d473dff8f8b67a05d2ad")


