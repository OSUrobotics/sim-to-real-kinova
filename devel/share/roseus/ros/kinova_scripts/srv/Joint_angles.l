;; Auto-generated. Do not edit!


(when (boundp 'kinova_scripts::Joint_angles)
  (if (not (find-package "KINOVA_SCRIPTS"))
    (make-package "KINOVA_SCRIPTS"))
  (shadow 'Joint_angles (find-package "KINOVA_SCRIPTS")))
(unless (find-package "KINOVA_SCRIPTS::JOINT_ANGLES")
  (make-package "KINOVA_SCRIPTS::JOINT_ANGLES"))
(unless (find-package "KINOVA_SCRIPTS::JOINT_ANGLESREQUEST")
  (make-package "KINOVA_SCRIPTS::JOINT_ANGLESREQUEST"))
(unless (find-package "KINOVA_SCRIPTS::JOINT_ANGLESRESPONSE")
  (make-package "KINOVA_SCRIPTS::JOINT_ANGLESRESPONSE"))

(in-package "ROS")





(defclass kinova_scripts::Joint_anglesRequest
  :super ros::object
  :slots (_angles ))

(defmethod kinova_scripts::Joint_anglesRequest
  (:init
   (&key
    ((:angles __angles) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _angles __angles)
   self)
  (:angles
   (&optional __angles)
   (if __angles (setq _angles __angles)) _angles)
  (:serialization-length
   ()
   (+
    ;; float64[] _angles
    (* 8    (length _angles)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _angles
     (write-long (length _angles) s)
     (dotimes (i (length _angles))
       (sys::poke (elt _angles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _angles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angles (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass kinova_scripts::Joint_anglesResponse
  :super ros::object
  :slots (_success ))

(defmethod kinova_scripts::Joint_anglesResponse
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

(defclass kinova_scripts::Joint_angles
  :super ros::object
  :slots ())

(setf (get kinova_scripts::Joint_angles :md5sum-) "33d1484c959ed2edcc0fb37067e64ed1")
(setf (get kinova_scripts::Joint_angles :datatype-) "kinova_scripts/Joint_angles")
(setf (get kinova_scripts::Joint_angles :request) kinova_scripts::Joint_anglesRequest)
(setf (get kinova_scripts::Joint_angles :response) kinova_scripts::Joint_anglesResponse)

(defmethod kinova_scripts::Joint_anglesRequest
  (:response () (instance kinova_scripts::Joint_anglesResponse :init)))

(setf (get kinova_scripts::Joint_anglesRequest :md5sum-) "33d1484c959ed2edcc0fb37067e64ed1")
(setf (get kinova_scripts::Joint_anglesRequest :datatype-) "kinova_scripts/Joint_anglesRequest")
(setf (get kinova_scripts::Joint_anglesRequest :definition-)
      "# inputs
float64[] angles
---
# outputs
bool success
")

(setf (get kinova_scripts::Joint_anglesResponse :md5sum-) "33d1484c959ed2edcc0fb37067e64ed1")
(setf (get kinova_scripts::Joint_anglesResponse :datatype-) "kinova_scripts/Joint_anglesResponse")
(setf (get kinova_scripts::Joint_anglesResponse :definition-)
      "# inputs
float64[] angles
---
# outputs
bool success
")



(provide :kinova_scripts/Joint_angles "33d1484c959ed2edcc0fb37067e64ed1")


