;; Auto-generated. Do not edit!


(when (boundp 'kinova_msgs::FingerPosition)
  (if (not (find-package "KINOVA_MSGS"))
    (make-package "KINOVA_MSGS"))
  (shadow 'FingerPosition (find-package "KINOVA_MSGS")))
(unless (find-package "KINOVA_MSGS::FINGERPOSITION")
  (make-package "KINOVA_MSGS::FINGERPOSITION"))

(in-package "ROS")
;;//! \htmlinclude FingerPosition.msg.html


(defclass kinova_msgs::FingerPosition
  :super ros::object
  :slots (_finger1 _finger2 _finger3 ))

(defmethod kinova_msgs::FingerPosition
  (:init
   (&key
    ((:finger1 __finger1) 0.0)
    ((:finger2 __finger2) 0.0)
    ((:finger3 __finger3) 0.0)
    )
   (send-super :init)
   (setq _finger1 (float __finger1))
   (setq _finger2 (float __finger2))
   (setq _finger3 (float __finger3))
   self)
  (:finger1
   (&optional __finger1)
   (if __finger1 (setq _finger1 __finger1)) _finger1)
  (:finger2
   (&optional __finger2)
   (if __finger2 (setq _finger2 __finger2)) _finger2)
  (:finger3
   (&optional __finger3)
   (if __finger3 (setq _finger3 __finger3)) _finger3)
  (:serialization-length
   ()
   (+
    ;; float32 _finger1
    4
    ;; float32 _finger2
    4
    ;; float32 _finger3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _finger1
       (sys::poke _finger1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _finger2
       (sys::poke _finger2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _finger3
       (sys::poke _finger3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _finger1
     (setq _finger1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _finger2
     (setq _finger2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _finger3
     (setq _finger3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get kinova_msgs::FingerPosition :md5sum-) "f56891e5dcd1900989f764a9b845c8e5")
(setf (get kinova_msgs::FingerPosition :datatype-) "kinova_msgs/FingerPosition")
(setf (get kinova_msgs::FingerPosition :definition-)
      "float32 finger1
float32 finger2
float32 finger3

")



(provide :kinova_msgs/FingerPosition "f56891e5dcd1900989f764a9b845c8e5")


