;; Auto-generated. Do not edit!


(when (boundp 'kinova_scripts::New_pose)
  (if (not (find-package "KINOVA_SCRIPTS"))
    (make-package "KINOVA_SCRIPTS"))
  (shadow 'New_pose (find-package "KINOVA_SCRIPTS")))
(unless (find-package "KINOVA_SCRIPTS::NEW_POSE")
  (make-package "KINOVA_SCRIPTS::NEW_POSE"))
(unless (find-package "KINOVA_SCRIPTS::NEW_POSEREQUEST")
  (make-package "KINOVA_SCRIPTS::NEW_POSEREQUEST"))
(unless (find-package "KINOVA_SCRIPTS::NEW_POSERESPONSE")
  (make-package "KINOVA_SCRIPTS::NEW_POSERESPONSE"))

(in-package "ROS")





(defclass kinova_scripts::New_poseRequest
  :super ros::object
  :slots (_pose ))

(defmethod kinova_scripts::New_poseRequest
  (:init
   (&key
    ((:pose __pose) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&optional __pose)
   (if __pose (setq _pose __pose)) _pose)
  (:serialization-length
   ()
   (+
    ;; float64[] _pose
    (* 8    (length _pose)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _pose
     (write-long (length _pose) s)
     (dotimes (i (length _pose))
       (sys::poke (elt _pose i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass kinova_scripts::New_poseResponse
  :super ros::object
  :slots (_success ))

(defmethod kinova_scripts::New_poseResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass kinova_scripts::New_pose
  :super ros::object
  :slots ())

(setf (get kinova_scripts::New_pose :md5sum-) "4594a58ce1af583f94fa685100bbf914")
(setf (get kinova_scripts::New_pose :datatype-) "kinova_scripts/New_pose")
(setf (get kinova_scripts::New_pose :request) kinova_scripts::New_poseRequest)
(setf (get kinova_scripts::New_pose :response) kinova_scripts::New_poseResponse)

(defmethod kinova_scripts::New_poseRequest
  (:response () (instance kinova_scripts::New_poseResponse :init)))

(setf (get kinova_scripts::New_poseRequest :md5sum-) "4594a58ce1af583f94fa685100bbf914")
(setf (get kinova_scripts::New_poseRequest :datatype-) "kinova_scripts/New_poseRequest")
(setf (get kinova_scripts::New_poseRequest :definition-)
      "# inputs
float64[] pose
---
# outputs
bool success
")

(setf (get kinova_scripts::New_poseResponse :md5sum-) "4594a58ce1af583f94fa685100bbf914")
(setf (get kinova_scripts::New_poseResponse :datatype-) "kinova_scripts/New_poseResponse")
(setf (get kinova_scripts::New_poseResponse :definition-)
      "# inputs
float64[] pose
---
# outputs
bool success
")



(provide :kinova_scripts/New_pose "4594a58ce1af583f94fa685100bbf914")


