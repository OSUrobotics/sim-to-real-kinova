; Auto-generated. Do not edit!


(cl:in-package infrastructure_msgs-msg)


;//! \htmlinclude DataCollectionGoal.msg.html

(cl:defclass <DataCollectionGoal> (roslisp-msg-protocol:ros-message)
  ((collection_start
    :reader collection_start
    :initarg :collection_start
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DataCollectionGoal (<DataCollectionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataCollectionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataCollectionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name infrastructure_msgs-msg:<DataCollectionGoal> is deprecated: use infrastructure_msgs-msg:DataCollectionGoal instead.")))

(cl:ensure-generic-function 'collection_start-val :lambda-list '(m))
(cl:defmethod collection_start-val ((m <DataCollectionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:collection_start-val is deprecated.  Use infrastructure_msgs-msg:collection_start instead.")
  (collection_start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataCollectionGoal>) ostream)
  "Serializes a message object of type '<DataCollectionGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'collection_start) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataCollectionGoal>) istream)
  "Deserializes a message object of type '<DataCollectionGoal>"
    (cl:setf (cl:slot-value msg 'collection_start) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataCollectionGoal>)))
  "Returns string type for a message object of type '<DataCollectionGoal>"
  "infrastructure_msgs/DataCollectionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataCollectionGoal)))
  "Returns string type for a message object of type 'DataCollectionGoal"
  "infrastructure_msgs/DataCollectionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataCollectionGoal>)))
  "Returns md5sum for a message object of type '<DataCollectionGoal>"
  "43648f36c0fa39dbf4a9583a1f3ed69d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataCollectionGoal)))
  "Returns md5sum for a message object of type 'DataCollectionGoal"
  "43648f36c0fa39dbf4a9583a1f3ed69d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataCollectionGoal>)))
  "Returns full string definition for message of type '<DataCollectionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%bool collection_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataCollectionGoal)))
  "Returns full string definition for message of type 'DataCollectionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%bool collection_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataCollectionGoal>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataCollectionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'DataCollectionGoal
    (cl:cons ':collection_start (collection_start msg))
))
