; Auto-generated. Do not edit!


(cl:in-package kinova_scripts-srv)


;//! \htmlinclude Joint_angles-request.msg.html

(cl:defclass <Joint_angles-request> (roslisp-msg-protocol:ros-message)
  ((angles
    :reader angles
    :initarg :angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Joint_angles-request (<Joint_angles-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_angles-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_angles-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinova_scripts-srv:<Joint_angles-request> is deprecated: use kinova_scripts-srv:Joint_angles-request instead.")))

(cl:ensure-generic-function 'angles-val :lambda-list '(m))
(cl:defmethod angles-val ((m <Joint_angles-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_scripts-srv:angles-val is deprecated.  Use kinova_scripts-srv:angles instead.")
  (angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_angles-request>) ostream)
  "Serializes a message object of type '<Joint_angles-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'angles))))
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
   (cl:slot-value msg 'angles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_angles-request>) istream)
  "Deserializes a message object of type '<Joint_angles-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'angles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'angles)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_angles-request>)))
  "Returns string type for a service object of type '<Joint_angles-request>"
  "kinova_scripts/Joint_anglesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_angles-request)))
  "Returns string type for a service object of type 'Joint_angles-request"
  "kinova_scripts/Joint_anglesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_angles-request>)))
  "Returns md5sum for a message object of type '<Joint_angles-request>"
  "33d1484c959ed2edcc0fb37067e64ed1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_angles-request)))
  "Returns md5sum for a message object of type 'Joint_angles-request"
  "33d1484c959ed2edcc0fb37067e64ed1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_angles-request>)))
  "Returns full string definition for message of type '<Joint_angles-request>"
  (cl:format cl:nil "# inputs~%float64[] angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_angles-request)))
  "Returns full string definition for message of type 'Joint_angles-request"
  (cl:format cl:nil "# inputs~%float64[] angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_angles-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_angles-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_angles-request
    (cl:cons ':angles (angles msg))
))
;//! \htmlinclude Joint_angles-response.msg.html

(cl:defclass <Joint_angles-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Joint_angles-response (<Joint_angles-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_angles-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_angles-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinova_scripts-srv:<Joint_angles-response> is deprecated: use kinova_scripts-srv:Joint_angles-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Joint_angles-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinova_scripts-srv:success-val is deprecated.  Use kinova_scripts-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_angles-response>) ostream)
  "Serializes a message object of type '<Joint_angles-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_angles-response>) istream)
  "Deserializes a message object of type '<Joint_angles-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_angles-response>)))
  "Returns string type for a service object of type '<Joint_angles-response>"
  "kinova_scripts/Joint_anglesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_angles-response)))
  "Returns string type for a service object of type 'Joint_angles-response"
  "kinova_scripts/Joint_anglesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_angles-response>)))
  "Returns md5sum for a message object of type '<Joint_angles-response>"
  "33d1484c959ed2edcc0fb37067e64ed1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_angles-response)))
  "Returns md5sum for a message object of type 'Joint_angles-response"
  "33d1484c959ed2edcc0fb37067e64ed1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_angles-response>)))
  "Returns full string definition for message of type '<Joint_angles-response>"
  (cl:format cl:nil "# outputs~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_angles-response)))
  "Returns full string definition for message of type 'Joint_angles-response"
  (cl:format cl:nil "# outputs~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_angles-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_angles-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_angles-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Joint_angles)))
  'Joint_angles-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Joint_angles)))
  'Joint_angles-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_angles)))
  "Returns string type for a service object of type '<Joint_angles>"
  "kinova_scripts/Joint_angles")