; Auto-generated. Do not edit!


(cl:in-package infrastructure_msgs-msg)


;//! \htmlinclude DataTimestamps.msg.html

(cl:defclass <DataTimestamps> (roslisp-msg-protocol:ros-message)
  ((trial_number
    :reader trial_number
    :initarg :trial_number
    :type cl:integer
    :initform 0)
   (collection_start_time
    :reader collection_start_time
    :initarg :collection_start_time
    :type cl:real
    :initform 0)
   (collection_end_time
    :reader collection_end_time
    :initarg :collection_end_time
    :type cl:real
    :initform 0)
   (total_time
    :reader total_time
    :initarg :total_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass DataTimestamps (<DataTimestamps>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataTimestamps>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataTimestamps)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name infrastructure_msgs-msg:<DataTimestamps> is deprecated: use infrastructure_msgs-msg:DataTimestamps instead.")))

(cl:ensure-generic-function 'trial_number-val :lambda-list '(m))
(cl:defmethod trial_number-val ((m <DataTimestamps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:trial_number-val is deprecated.  Use infrastructure_msgs-msg:trial_number instead.")
  (trial_number m))

(cl:ensure-generic-function 'collection_start_time-val :lambda-list '(m))
(cl:defmethod collection_start_time-val ((m <DataTimestamps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:collection_start_time-val is deprecated.  Use infrastructure_msgs-msg:collection_start_time instead.")
  (collection_start_time m))

(cl:ensure-generic-function 'collection_end_time-val :lambda-list '(m))
(cl:defmethod collection_end_time-val ((m <DataTimestamps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:collection_end_time-val is deprecated.  Use infrastructure_msgs-msg:collection_end_time instead.")
  (collection_end_time m))

(cl:ensure-generic-function 'total_time-val :lambda-list '(m))
(cl:defmethod total_time-val ((m <DataTimestamps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:total_time-val is deprecated.  Use infrastructure_msgs-msg:total_time instead.")
  (total_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataTimestamps>) ostream)
  "Serializes a message object of type '<DataTimestamps>"
  (cl:let* ((signed (cl:slot-value msg 'trial_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'collection_start_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'collection_start_time) (cl:floor (cl:slot-value msg 'collection_start_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'collection_end_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'collection_end_time) (cl:floor (cl:slot-value msg 'collection_end_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'total_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataTimestamps>) istream)
  "Deserializes a message object of type '<DataTimestamps>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trial_number) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'collection_start_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'collection_end_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'total_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataTimestamps>)))
  "Returns string type for a message object of type '<DataTimestamps>"
  "infrastructure_msgs/DataTimestamps")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataTimestamps)))
  "Returns string type for a message object of type 'DataTimestamps"
  "infrastructure_msgs/DataTimestamps")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataTimestamps>)))
  "Returns md5sum for a message object of type '<DataTimestamps>"
  "0b7790f826e3d5970b2ea5a3e61bdd36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataTimestamps)))
  "Returns md5sum for a message object of type 'DataTimestamps"
  "0b7790f826e3d5970b2ea5a3e61bdd36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataTimestamps>)))
  "Returns full string definition for message of type '<DataTimestamps>"
  (cl:format cl:nil "int64 trial_number~%time collection_start_time~%time collection_end_time~%float64 total_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataTimestamps)))
  "Returns full string definition for message of type 'DataTimestamps"
  (cl:format cl:nil "int64 trial_number~%time collection_start_time~%time collection_end_time~%float64 total_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataTimestamps>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataTimestamps>))
  "Converts a ROS message object to a list"
  (cl:list 'DataTimestamps
    (cl:cons ':trial_number (trial_number msg))
    (cl:cons ':collection_start_time (collection_start_time msg))
    (cl:cons ':collection_end_time (collection_end_time msg))
    (cl:cons ':total_time (total_time msg))
))
