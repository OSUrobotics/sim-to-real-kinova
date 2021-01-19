;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::HomeArm)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'HomeArm (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::HOMEARM")
  (make-package "KINOVA_MSGS::HOMEARM"))
(unless (find-package "KINOVA_MSGS::HOMEARMREQUEST")
  (make-package "KINOVA_MSGS::HOMEARMREQUEST"))
(unless (find-package "KINOVA_MSGS::HOMEARMRESPONSE")
  (make-package "KINOVA_MSGS::HOMEARMRESPONSE"))

(in-package "ROS")





(defclass kinova_msgs::HomeArmRequest
  :super ros::object
  :slots ())

(defmethod kinova_msgs::HomeArmRequest
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

(defclass kinova_msgs::HomeArmResponse
  :super ros::object
  :slots (_homearm_result ))

(defmethod kinova_msgs::HomeArmResponse
  (:init
   (&key
    ((:homearm_result __homearm_result) "")
    )
   (send-super :init)
   (setq _homearm_result (string __homearm_result))
   self)
  (:homearm_result
   (&optional __homearm_result)
   (if __homearm_result (setq _homearm_result __homearm_result)) _homearm_result)
  (:serialization-length
   ()
   (+
    ;; string _homearm_result
    4 (length _homearm_result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _homearm_result
       (write-long (length _homearm_result) s) (princ _homearm_result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _homearm_result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _homearm_result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass kinova_msgs::HomeArm
  :super ros::object
  :slots ())

(setf (get kinova_msgs::HomeArm :md5sum-) "46e470f2c1a7177398c57a43eafe8d67")
(setf (get kinova_msgs::HomeArm :datatype-) "kinova_msgs/HomeArm")
(setf (get kinova_msgs::HomeArm :request) kinova_msgs::HomeArmRequest)
(setf (get kinova_msgs::HomeArm :response) kinova_msgs::HomeArmResponse)

(defmethod kinova_msgs::HomeArmRequest
  (:response () (instance kinova_msgs::HomeArmResponse :init)))

(setf (get kinova_msgs::HomeArmRequest :md5sum-) "46e470f2c1a7177398c57a43eafe8d67")
(setf (get kinova_msgs::HomeArmRequest :datatype-) "kinova_msgs/HomeArmRequest")
(setf (get kinova_msgs::HomeArmRequest :definition-)
      "---
string homearm_result

")

(setf (get kinova_msgs::HomeArmResponse :md5sum-) "46e470f2c1a7177398c57a43eafe8d67")
(setf (get kinova_msgs::HomeArmResponse :datatype-) "kinova_msgs/HomeArmResponse")
(setf (get kinova_msgs::HomeArmResponse :definition-)
      "---
string homearm_result

")



(provide :kinova_msgs/HomeArm "46e470f2c1a7177398c57a43eafe8d67")


