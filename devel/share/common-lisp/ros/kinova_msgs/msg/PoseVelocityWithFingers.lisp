; Auto-generated. Do not edit!


(cl:in-package kinova_msgs-msg)


;//! \htmlinclude PoseVelocityWithFingers.msg.html

(cl:defclass <PoseVelocityWithFingers> (roslisp-msg-protocol:ros-message)
  ((twist_linear_x
    :reader twist_linear_x
    :initarg :twist_linear_x
    :type cl:float
    :initform 0.0)
   (twist_linear_y
    :reader twist_linear_y
    :initarg :twist_linear_y
    :type cl:float
    :initform 0.0)
   (twist_linear_z
    :reader twist_linear_z
    :initarg :twist_linear_z
    :type cl:float
    :initform 0.0)
   (twist_angular_x
    :reader twist_angular_x
    :initarg :twist_angular_x
    :type cl:float
    :initform 0.0)
   (twist_angular_y
    :reader twist_angular_y
    :initarg :twist_angular_y
    :type cl:float
    :initform 0.0)
   (twist_angular_z
    :reader twist_angular_z
    :initarg :twist_angular_z
    :type cl:float
    :initform 0.0)
   (fingers_closure_percentage
    :reader fingers_closure_percentage
    :initarg :fingers_closure_percentage
    :type cl:float
    :initform 0.0))
)

(cl:defclass PoseVelocityWithFingers (<PoseVelocityWithFingers>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PoseVelocityWithFingers>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PoseVelocityWithFingers)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinova_msgs-msg:<PoseVelocityWithFingers> is deprecated: use kinova_msgs-msg:PoseVelocityWithFingers instead.")))

(cl:ensure-generic-function 'twist_linear_x-val :lambda-list '(m))
(cl:defmethod twist_linear_x-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_linear_x-val is deprecated.  Use kinova_msgs-msg:twist_linear_x instead.")
  (twist_linear_x m))

(cl:ensure-generic-function 'twist_linear_y-val :lambda-list '(m))
(cl:defmethod twist_linear_y-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_linear_y-val is deprecated.  Use kinova_msgs-msg:twist_linear_y instead.")
  (twist_linear_y m))

(cl:ensure-generic-function 'twist_linear_z-val :lambda-list '(m))
(cl:defmethod twist_linear_z-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_linear_z-val is deprecated.  Use kinova_msgs-msg:twist_linear_z instead.")
  (twist_linear_z m))

(cl:ensure-generic-function 'twist_angular_x-val :lambda-list '(m))
(cl:defmethod twist_angular_x-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_angular_x-val is deprecated.  Use kinova_msgs-msg:twist_angular_x instead.")
  (twist_angular_x m))

(cl:ensure-generic-function 'twist_angular_y-val :lambda-list '(m))
(cl:defmethod twist_angular_y-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_angular_y-val is deprecated.  Use kinova_msgs-msg:twist_angular_y instead.")
  (twist_angular_y m))

(cl:ensure-generic-function 'twist_angular_z-val :lambda-list '(m))
(cl:defmethod twist_angular_z-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:twist_angular_z-val is deprecated.  Use kinova_msgs-msg:twist_angular_z instead.")
  (twist_angular_z m))

(cl:ensure-generic-function 'fingers_closure_percentage-val :lambda-list '(m))
(cl:defmethod fingers_closure_percentage-val ((m <PoseVelocityWithFingers>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_msgs-msg:fingers_closure_percentage-val is deprecated.  Use kinova_msgs-msg:fingers_closure_percentage instead.")
  (fingers_closure_percentage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PoseVelocityWithFingers>) ostream)
  "Serializes a message object of type '<PoseVelocityWithFingers>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_linear_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_linear_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_linear_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_angular_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_angular_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'twist_angular_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fingers_closure_percentage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PoseVelocityWithFingers>) istream)
  "Deserializes a message object of type '<PoseVelocityWithFingers>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_linear_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_linear_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_linear_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_angular_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_angular_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'twist_angular_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fingers_closure_percentage) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PoseVelocityWithFingers>)))
  "Returns string type for a message object of type '<PoseVelocityWithFingers>"
  "kinova_msgs/PoseVelocityWithFingers")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PoseVelocityWithFingers)))
  "Returns string type for a message object of type 'PoseVelocityWithFingers"
  "kinova_msgs/PoseVelocityWithFingers")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PoseVelocityWithFingers>)))
  "Returns md5sum for a message object of type '<PoseVelocityWithFingers>"
  "2788ab35d01df923e0e72d7c730c2511")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PoseVelocityWithFingers)))
  "Returns md5sum for a message object of type 'PoseVelocityWithFingers"
  "2788ab35d01df923e0e72d7c730c2511")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PoseVelocityWithFingers>)))
  "Returns full string definition for message of type '<PoseVelocityWithFingers>"
  (cl:format cl:nil "float32 twist_linear_x~%float32 twist_linear_y~%float32 twist_linear_z~%float32 twist_angular_x~%float32 twist_angular_y~%float32 twist_angular_z~%float32 fingers_closure_percentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PoseVelocityWithFingers)))
  "Returns full string definition for message of type 'PoseVelocityWithFingers"
  (cl:format cl:nil "float32 twist_linear_x~%float32 twist_linear_y~%float32 twist_linear_z~%float32 twist_angular_x~%float32 twist_angular_y~%float32 twist_angular_z~%float32 fingers_closure_percentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PoseVelocityWithFingers>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PoseVelocityWithFingers>))
  "Converts a ROS message object to a list"
  (cl:list 'PoseVelocityWithFingers
    (cl:cons ':twist_linear_x (twist_linear_x msg))
    (cl:cons ':twist_linear_y (twist_linear_y msg))
    (cl:cons ':twist_linear_z (twist_linear_z msg))
    (cl:cons ':twist_angular_x (twist_angular_x msg))
    (cl:cons ':twist_angular_y (twist_angular_y msg))
    (cl:cons ':twist_angular_z (twist_angular_z msg))
    (cl:cons ':fingers_closure_percentage (fingers_closure_percentage msg))
))
