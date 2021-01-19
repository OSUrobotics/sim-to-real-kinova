;; Auto-generated. Do not edit!


(when (boundp 'infrastructure_msgs::DoorSensors)
  (if (not (find-package "INFRASTRUCTURE_MSGS"))
    (make-package "INFRASTRUCTURE_MSGS"))
  (shadow 'DoorSensors (find-package "INFRASTRUCTURE_MSGS")))
(unless (find-package "INFRASTRUCTURE_MSGS::DOORSENSORS")
  (make-package "INFRASTRUCTURE_MSGS::DOORSENSORS"))

(in-package "ROS")
;;//! \htmlinclude DoorSensors.msg.html


(defclass infrastructure_msgs::DoorSensors
  :super ros::object
  :slots (_current_time _tof _fsr1 _fsr2 _fsr3 _fsr4 _fsr5 _fsr6 _fsr7 _fsr8 _fsr9 _fsr10 _fsr11 _fsr12 _fsr_contact_1 _fsr_contact_2 ))

(defmethod infrastructure_msgs::DoorSensors
  (:init
   (&key
    ((:current_time __current_time) (instance ros::time :init))
    ((:tof __tof) 0.0)
    ((:fsr1 __fsr1) 0)
    ((:fsr2 __fsr2) 0)
    ((:fsr3 __fsr3) 0)
    ((:fsr4 __fsr4) 0)
    ((:fsr5 __fsr5) 0)
    ((:fsr6 __fsr6) 0)
    ((:fsr7 __fsr7) 0)
    ((:fsr8 __fsr8) 0)
    ((:fsr9 __fsr9) 0)
    ((:fsr10 __fsr10) 0)
    ((:fsr11 __fsr11) 0)
    ((:fsr12 __fsr12) 0)
    ((:fsr_contact_1 __fsr_contact_1) 0)
    ((:fsr_contact_2 __fsr_contact_2) 0)
    )
   (send-super :init)
   (setq _current_time __current_time)
   (setq _tof (float __tof))
   (setq _fsr1 (round __fsr1))
   (setq _fsr2 (round __fsr2))
   (setq _fsr3 (round __fsr3))
   (setq _fsr4 (round __fsr4))
   (setq _fsr5 (round __fsr5))
   (setq _fsr6 (round __fsr6))
   (setq _fsr7 (round __fsr7))
   (setq _fsr8 (round __fsr8))
   (setq _fsr9 (round __fsr9))
   (setq _fsr10 (round __fsr10))
   (setq _fsr11 (round __fsr11))
   (setq _fsr12 (round __fsr12))
   (setq _fsr_contact_1 (round __fsr_contact_1))
   (setq _fsr_contact_2 (round __fsr_contact_2))
   self)
  (:current_time
   (&optional __current_time)
   (if __current_time (setq _current_time __current_time)) _current_time)
  (:tof
   (&optional __tof)
   (if __tof (setq _tof __tof)) _tof)
  (:fsr1
   (&optional __fsr1)
   (if __fsr1 (setq _fsr1 __fsr1)) _fsr1)
  (:fsr2
   (&optional __fsr2)
   (if __fsr2 (setq _fsr2 __fsr2)) _fsr2)
  (:fsr3
   (&optional __fsr3)
   (if __fsr3 (setq _fsr3 __fsr3)) _fsr3)
  (:fsr4
   (&optional __fsr4)
   (if __fsr4 (setq _fsr4 __fsr4)) _fsr4)
  (:fsr5
   (&optional __fsr5)
   (if __fsr5 (setq _fsr5 __fsr5)) _fsr5)
  (:fsr6
   (&optional __fsr6)
   (if __fsr6 (setq _fsr6 __fsr6)) _fsr6)
  (:fsr7
   (&optional __fsr7)
   (if __fsr7 (setq _fsr7 __fsr7)) _fsr7)
  (:fsr8
   (&optional __fsr8)
   (if __fsr8 (setq _fsr8 __fsr8)) _fsr8)
  (:fsr9
   (&optional __fsr9)
   (if __fsr9 (setq _fsr9 __fsr9)) _fsr9)
  (:fsr10
   (&optional __fsr10)
   (if __fsr10 (setq _fsr10 __fsr10)) _fsr10)
  (:fsr11
   (&optional __fsr11)
   (if __fsr11 (setq _fsr11 __fsr11)) _fsr11)
  (:fsr12
   (&optional __fsr12)
   (if __fsr12 (setq _fsr12 __fsr12)) _fsr12)
  (:fsr_contact_1
   (&optional __fsr_contact_1)
   (if __fsr_contact_1 (setq _fsr_contact_1 __fsr_contact_1)) _fsr_contact_1)
  (:fsr_contact_2
   (&optional __fsr_contact_2)
   (if __fsr_contact_2 (setq _fsr_contact_2 __fsr_contact_2)) _fsr_contact_2)
  (:serialization-length
   ()
   (+
    ;; time _current_time
    8
    ;; float32 _tof
    4
    ;; int32 _fsr1
    4
    ;; int32 _fsr2
    4
    ;; int32 _fsr3
    4
    ;; int32 _fsr4
    4
    ;; int32 _fsr5
    4
    ;; int32 _fsr6
    4
    ;; int32 _fsr7
    4
    ;; int32 _fsr8
    4
    ;; int32 _fsr9
    4
    ;; int32 _fsr10
    4
    ;; int32 _fsr11
    4
    ;; int32 _fsr12
    4
    ;; int32 _fsr_contact_1
    4
    ;; int32 _fsr_contact_2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _current_time
       (write-long (send _current_time :sec) s) (write-long (send _current_time :nsec) s)
     ;; float32 _tof
       (sys::poke _tof (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _fsr1
       (write-long _fsr1 s)
     ;; int32 _fsr2
       (write-long _fsr2 s)
     ;; int32 _fsr3
       (write-long _fsr3 s)
     ;; int32 _fsr4
       (write-long _fsr4 s)
     ;; int32 _fsr5
       (write-long _fsr5 s)
     ;; int32 _fsr6
       (write-long _fsr6 s)
     ;; int32 _fsr7
       (write-long _fsr7 s)
     ;; int32 _fsr8
       (write-long _fsr8 s)
     ;; int32 _fsr9
       (write-long _fsr9 s)
     ;; int32 _fsr10
       (write-long _fsr10 s)
     ;; int32 _fsr11
       (write-long _fsr11 s)
     ;; int32 _fsr12
       (write-long _fsr12 s)
     ;; int32 _fsr_contact_1
       (write-long _fsr_contact_1 s)
     ;; int32 _fsr_contact_2
       (write-long _fsr_contact_2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _current_time
     (send _current_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _current_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _tof
     (setq _tof (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _fsr1
     (setq _fsr1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr2
     (setq _fsr2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr3
     (setq _fsr3 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr4
     (setq _fsr4 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr5
     (setq _fsr5 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr6
     (setq _fsr6 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr7
     (setq _fsr7 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr8
     (setq _fsr8 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr9
     (setq _fsr9 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr10
     (setq _fsr10 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr11
     (setq _fsr11 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr12
     (setq _fsr12 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr_contact_1
     (setq _fsr_contact_1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fsr_contact_2
     (setq _fsr_contact_2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get infrastructure_msgs::DoorSensors :md5sum-) "78d3070a7f6d7fc59eb47b90108edee6")
(setf (get infrastructure_msgs::DoorSensors :datatype-) "infrastructure_msgs/DoorSensors")
(setf (get infrastructure_msgs::DoorSensors :definition-)
      "time current_time
float32 tof 
int32 fsr1
int32 fsr2
int32 fsr3
int32 fsr4
int32 fsr5
int32 fsr6
int32 fsr7
int32 fsr8
int32 fsr9
int32 fsr10
int32 fsr11
int32 fsr12
int32 fsr_contact_1
int32 fsr_contact_2

")



(provide :infrastructure_msgs/DoorSensors "78d3070a7f6d7fc59eb47b90108edee6")


