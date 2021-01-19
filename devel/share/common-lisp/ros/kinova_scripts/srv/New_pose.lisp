; Auto-generated. Do not edit!


(cl:in-package kinova_scripts-srv)


;//! \htmlinclude New_pose-request.msg.html

(cl:defclass <New_pose-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass New_pose-request (<New_pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <New_pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'New_pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinova_scripts-srv:<New_pose-request> is deprecated: use kinova_scripts-srv:New_pose-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <New_pose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_scripts-srv:pose-val is deprecated.  Use kinova_scripts-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <New_pose-request>) ostream)
  "Serializes a message object of type '<New_pose-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <New_pose-request>) istream)
  "Deserializes a message object of type '<New_pose-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<New_pose-request>)))
  "Returns string type for a service object of type '<New_pose-request>"
  "kinova_scripts/New_poseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'New_pose-request)))
  "Returns string type for a service object of type 'New_pose-request"
  "kinova_scripts/New_poseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<New_pose-request>)))
  "Returns md5sum for a message object of type '<New_pose-request>"
  "4594a58ce1af583f94fa685100bbf914")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'New_pose-request)))
  "Returns md5sum for a message object of type 'New_pose-request"
  "4594a58ce1af583f94fa685100bbf914")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<New_pose-request>)))
  "Returns full string definition for message of type '<New_pose-request>"
  (cl:format cl:nil "# inputs~%float64[] pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'New_pose-request)))
  "Returns full string definition for message of type 'New_pose-request"
  (cl:format cl:nil "# inputs~%float64[] pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <New_pose-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <New_pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'New_pose-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude New_pose-response.msg.html

(cl:defclass <New_pose-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass New_pose-response (<New_pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <New_pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'New_pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinova_scripts-srv:<New_pose-response> is deprecated: use kinova_scripts-srv:New_pose-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <New_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_scripts-srv:success-val is deprecated.  Use kinova_scripts-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <New_pose-response>) ostream)
  "Serializes a message object of type '<New_pose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <New_pose-response>) istream)
  "Deserializes a message object of type '<New_pose-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<New_pose-response>)))
  "Returns string type for a service object of type '<New_pose-response>"
  "kinova_scripts/New_poseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'New_pose-response)))
  "Returns string type for a service object of type 'New_pose-response"
  "kinova_scripts/New_poseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<New_pose-response>)))
  "Returns md5sum for a message object of type '<New_pose-response>"
  "4594a58ce1af583f94fa685100bbf914")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'New_pose-response)))
  "Returns md5sum for a message object of type 'New_pose-response"
  "4594a58ce1af583f94fa685100bbf914")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<New_pose-response>)))
  "Returns full string definition for message of type '<New_pose-response>"
  (cl:format cl:nil "# outputs~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'New_pose-response)))
  "Returns full string definition for message of type 'New_pose-response"
  (cl:format cl:nil "# outputs~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <New_pose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <New_pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'New_pose-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'New_pose)))
  'New_pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'New_pose)))
  'New_pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'New_pose)))
  "Returns string type for a service object of type '<New_pose>"
  "kinova_scripts/New_pose")