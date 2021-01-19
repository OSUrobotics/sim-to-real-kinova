;; Auto-generated. Do not edit!


(when (boundp 'infrastructure_msgs::DataTimestamps)
  (if (not (find-package "INFRASTRUCTURE_MSGS"))
    (make-package "INFRASTRUCTURE_MSGS"))
  (shadow 'DataTimestamps (find-package "INFRASTRUCTURE_MSGS")))
(unless (find-package "INFRASTRUCTURE_MSGS::DATATIMESTAMPS")
  (make-package "INFRASTRUCTURE_MSGS::DATATIMESTAMPS"))

(in-package "ROS")
;;//! \htmlinclude DataTimestamps.msg.html


(defclass infrastructure_msgs::DataTimestamps
  :super ros::object
  :slots (_trial_number _collection_start_time _collection_end_time _total_time ))

(defmethod infrastructure_msgs::DataTimestamps
  (:init
   (&key
    ((:trial_number __trial_number) 0)
    ((:collection_start_time __collection_start_time) (instance ros::time :init))
    ((:collection_end_time __collection_end_time) (instance ros::time :init))
    ((:total_time __total_time) 0.0)
    )
   (send-super :init)
   (setq _trial_number (round __trial_number))
   (setq _collection_start_time __collection_start_time)
   (setq _collection_end_time __collection_end_time)
   (setq _total_time (float __total_time))
   self)
  (:trial_number
   (&optional __trial_number)
   (if __trial_number (setq _trial_number __trial_number)) _trial_number)
  (:collection_start_time
   (&optional __collection_start_time)
   (if __collection_start_time (setq _collection_start_time __collection_start_time)) _collection_start_time)
  (:collection_end_time
   (&optional __collection_end_time)
   (if __collection_end_time (setq _collection_end_time __collection_end_time)) _collection_end_time)
  (:total_time
   (&optional __total_time)
   (if __total_time (setq _total_time __total_time)) _total_time)
  (:serialization-length
   ()
   (+
    ;; int64 _trial_number
    8
    ;; time _collection_start_time
    8
    ;; time _collection_end_time
    8
    ;; float64 _total_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _trial_number
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _trial_number (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _trial_number) (= (length (_trial_number . bv)) 2)) ;; bignum
              (write-long (ash (elt (_trial_number . bv) 0) 0) s)
              (write-long (ash (elt (_trial_number . bv) 1) -1) s))
             ((and (class _trial_number) (= (length (_trial_number . bv)) 1)) ;; big1
              (write-long (elt (_trial_number . bv) 0) s)
              (write-long (if (>= _trial_number 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _trial_number s)(write-long (if (>= _trial_number 0) 0 #xffffffff) s)))
     ;; time _collection_start_time
       (write-long (send _collection_start_time :sec) s) (write-long (send _collection_start_time :nsec) s)
     ;; time _collection_end_time
       (write-long (send _collection_end_time :sec) s) (write-long (send _collection_end_time :nsec) s)
     ;; float64 _total_time
       (sys::poke _total_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _trial_number
#+(or :alpha :irix6 :x86_64)
      (setf _trial_number (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _trial_number (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; time _collection_start_time
     (send _collection_start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _collection_start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _collection_end_time
     (send _collection_end_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _collection_end_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _total_time
     (setq _total_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get infrastructure_msgs::DataTimestamps :md5sum-) "0b7790f826e3d5970b2ea5a3e61bdd36")
(setf (get infrastructure_msgs::DataTimestamps :datatype-) "infrastructure_msgs/DataTimestamps")
(setf (get infrastructure_msgs::DataTimestamps :definition-)
      "int64 trial_number
time collection_start_time
time collection_end_time
float64 total_time

")



(provide :infrastructure_msgs/DataTimestamps "0b7790f826e3d5970b2ea5a3e61bdd36")


