; Auto-generated. Do not edit!


(cl:in-package infrastructure_msgs-msg)


;//! \htmlinclude DataCollectionFeedback.msg.html

(cl:defclass <DataCollectionFeedback> (roslisp-msg-protocol:ros-message)
  ((collection_status
    :reader collection_status
    :initarg :collection_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DataCollectionFeedback (<DataCollectionFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataCollectionFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataCollectionFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name infrastructure_msgs-msg:<DataCollectionFeedback> is deprecated: use infrastructure_msgs-msg:DataCollectionFeedback instead.")))

(cl:ensure-generic-function 'collection_status-val :lambda-list '(m))
(cl:defmethod collection_status-val ((m <DataCollectionFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:collection_status-val is deprecated.  Use infrastructure_msgs-msg:collection_status instead.")
  (collection_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataCollectionFeedback>) ostream)
  "Serializes a message object of type '<DataCollectionFeedback>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'collection_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataCollectionFeedback>) istream)
  "Deserializes a message object of type '<DataCollectionFeedback>"
    (cl:setf (cl:slot-value msg 'collection_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataCollectionFeedback>)))
  "Returns string type for a message object of type '<DataCollectionFeedback>"
  "infrastructure_msgs/DataCollectionFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataCollectionFeedback)))
  "Returns string type for a message object of type 'DataCollectionFeedback"
  "infrastructure_msgs/DataCollectionFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataCollectionFeedback>)))
  "Returns md5sum for a message object of type '<DataCollectionFeedback>"
  "acf07d06c46e58b681dd3667a811f384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataCollectionFeedback)))
  "Returns md5sum for a message object of type 'DataCollectionFeedback"
  "acf07d06c46e58b681dd3667a811f384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataCollectionFeedback>)))
  "Returns full string definition for message of type '<DataCollectionFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%bool collection_status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataCollectionFeedback)))
  "Returns full string definition for message of type 'DataCollectionFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback~%bool collection_status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataCollectionFeedback>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataCollectionFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'DataCollectionFeedback
    (cl:cons ':collection_status (collection_status msg))
))
