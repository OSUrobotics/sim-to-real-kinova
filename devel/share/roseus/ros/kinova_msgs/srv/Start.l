;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::Start)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'Start (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::START")
  (make-package "KINOVA_MSGS::START"))
(unless (find-package "KINOVA_MSGS::STARTREQUEST")
  (make-package "KINOVA_MSGS::STARTREQUEST"))
(unless (find-package "KINOVA_MSGS::STARTRESPONSE")
  (make-package "KINOVA_MSGS::STARTRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::StartRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::StartRequest
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

(defclass kinova_msgs::StartResponse
  :super ros::object
  :slots (_start_result ))

(defmethod kinova_msgs::StartResponse
  (:init
   (&key
    ((:start_result __start_result) "")
    )
   (send-super :init)
   (setq _start_result (string __start_result))
   self)
  (:start_result
   (&optional __start_result)
   (if __start_result (setq _start_result __start_result)) _start_result)
  (:serialization-length
   ()
   (+
    ;; string _start_result
    4 (length _start_result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _start_result
       (write-long (length _start_result) s) (princ _start_result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _start_result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _start_result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass kinova_msgs::Start
  :super ros::object
  :slots ())

(setf (get kinova_msgs::Start :md5sum-) "e762e31d813526eaaa6a12e8354174fc")
(setf (get kinova_msgs::Start :datatype-) "kinova_msgs/Start")
(setf (get kinova_msgs::Start :request) kinova_msgs::StartRequest)
(setf (get kinova_msgs::Start :response) kinova_msgs::StartResponse)

(defmethod kinova_msgs::StartRequest
  (:response () (instance kinova_msgs::StartResponse :init)))

(setf (get kinova_msgs::StartRequest :md5sum-) "e762e31d813526eaaa6a12e8354174fc")
(setf (get kinova_msgs::StartRequest :datatype-) "kinova_msgs/StartRequest")
(setf (get kinova_msgs::StartRequest :definition-)
      "---
string start_result

")

(setf (get kinova_msgs::StartResponse :md5sum-) "e762e31d813526eaaa6a12e8354174fc")
(setf (get kinova_msgs::StartResponse :datatype-) "kinova_msgs/StartResponse")
(setf (get kinova_msgs::StartResponse :definition-)
      "---
string start_result

")



(provide :kinova_msgs/Start "e762e31d813526eaaa6a12e8354174fc")


