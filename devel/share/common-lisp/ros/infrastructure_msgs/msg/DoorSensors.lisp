; Auto-generated. Do not edit!


(cl:in-package infrastructure_msgs-msg)


;//! \htmlinclude DoorSensors.msg.html

(cl:defclass <DoorSensors> (roslisp-msg-protocol:ros-message)
  ((current_time
    :reader current_time
    :initarg :current_time
    :type cl:real
    :initform 0)
   (tof
    :reader tof
    :initarg :tof
    :type cl:float
    :initform 0.0)
   (fsr1
    :reader fsr1
    :initarg :fsr1
    :type cl:integer
    :initform 0)
   (fsr2
    :reader fsr2
    :initarg :fsr2
    :type cl:integer
    :initform 0)
   (fsr3
    :reader fsr3
    :initarg :fsr3
    :type cl:integer
    :initform 0)
   (fsr4
    :reader fsr4
    :initarg :fsr4
    :type cl:integer
    :initform 0)
   (fsr5
    :reader fsr5
    :initarg :fsr5
    :type cl:integer
    :initform 0)
   (fsr6
    :reader fsr6
    :initarg :fsr6
    :type cl:integer
    :initform 0)
   (fsr7
    :reader fsr7
    :initarg :fsr7
    :type cl:integer
    :initform 0)
   (fsr8
    :reader fsr8
    :initarg :fsr8
    :type cl:integer
    :initform 0)
   (fsr9
    :reader fsr9
    :initarg :fsr9
    :type cl:integer
    :initform 0)
   (fsr10
    :reader fsr10
    :initarg :fsr10
    :type cl:integer
    :initform 0)
   (fsr11
    :reader fsr11
    :initarg :fsr11
    :type cl:integer
    :initform 0)
   (fsr12
    :reader fsr12
    :initarg :fsr12
    :type cl:integer
    :initform 0)
   (fsr_contact_1
    :reader fsr_contact_1
    :initarg :fsr_contact_1
    :type cl:integer
    :initform 0)
   (fsr_contact_2
    :reader fsr_contact_2
    :initarg :fsr_contact_2
    :type cl:integer
    :initform 0))
)

(cl:defclass DoorSensors (<DoorSensors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DoorSensors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DoorSensors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name infrastructure_msgs-msg:<DoorSensors> is deprecated: use infrastructure_msgs-msg:DoorSensors instead.")))

(cl:ensure-generic-function 'current_time-val :lambda-list '(m))
(cl:defmethod current_time-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:current_time-val is deprecated.  Use infrastructure_msgs-msg:current_time instead.")
  (current_time m))

(cl:ensure-generic-function 'tof-val :lambda-list '(m))
(cl:defmethod tof-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:tof-val is deprecated.  Use infrastructure_msgs-msg:tof instead.")
  (tof m))

(cl:ensure-generic-function 'fsr1-val :lambda-list '(m))
(cl:defmethod fsr1-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr1-val is deprecated.  Use infrastructure_msgs-msg:fsr1 instead.")
  (fsr1 m))

(cl:ensure-generic-function 'fsr2-val :lambda-list '(m))
(cl:defmethod fsr2-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr2-val is deprecated.  Use infrastructure_msgs-msg:fsr2 instead.")
  (fsr2 m))

(cl:ensure-generic-function 'fsr3-val :lambda-list '(m))
(cl:defmethod fsr3-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr3-val is deprecated.  Use infrastructure_msgs-msg:fsr3 instead.")
  (fsr3 m))

(cl:ensure-generic-function 'fsr4-val :lambda-list '(m))
(cl:defmethod fsr4-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr4-val is deprecated.  Use infrastructure_msgs-msg:fsr4 instead.")
  (fsr4 m))

(cl:ensure-generic-function 'fsr5-val :lambda-list '(m))
(cl:defmethod fsr5-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr5-val is deprecated.  Use infrastructure_msgs-msg:fsr5 instead.")
  (fsr5 m))

(cl:ensure-generic-function 'fsr6-val :lambda-list '(m))
(cl:defmethod fsr6-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr6-val is deprecated.  Use infrastructure_msgs-msg:fsr6 instead.")
  (fsr6 m))

(cl:ensure-generic-function 'fsr7-val :lambda-list '(m))
(cl:defmethod fsr7-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr7-val is deprecated.  Use infrastructure_msgs-msg:fsr7 instead.")
  (fsr7 m))

(cl:ensure-generic-function 'fsr8-val :lambda-list '(m))
(cl:defmethod fsr8-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr8-val is deprecated.  Use infrastructure_msgs-msg:fsr8 instead.")
  (fsr8 m))

(cl:ensure-generic-function 'fsr9-val :lambda-list '(m))
(cl:defmethod fsr9-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr9-val is deprecated.  Use infrastructure_msgs-msg:fsr9 instead.")
  (fsr9 m))

(cl:ensure-generic-function 'fsr10-val :lambda-list '(m))
(cl:defmethod fsr10-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr10-val is deprecated.  Use infrastructure_msgs-msg:fsr10 instead.")
  (fsr10 m))

(cl:ensure-generic-function 'fsr11-val :lambda-list '(m))
(cl:defmethod fsr11-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr11-val is deprecated.  Use infrastructure_msgs-msg:fsr11 instead.")
  (fsr11 m))

(cl:ensure-generic-function 'fsr12-val :lambda-list '(m))
(cl:defmethod fsr12-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr12-val is deprecated.  Use infrastructure_msgs-msg:fsr12 instead.")
  (fsr12 m))

(cl:ensure-generic-function 'fsr_contact_1-val :lambda-list '(m))
(cl:defmethod fsr_contact_1-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr_contact_1-val is deprecated.  Use infrastructure_msgs-msg:fsr_contact_1 instead.")
  (fsr_contact_1 m))

(cl:ensure-generic-function 'fsr_contact_2-val :lambda-list '(m))
(cl:defmethod fsr_contact_2-val ((m <DoorSensors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader infrastructure_msgs-msg:fsr_contact_2-val is deprecated.  Use infrastructure_msgs-msg:fsr_contact_2 instead.")
  (fsr_contact_2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DoorSensors>) ostream)
  "Serializes a message object of type '<DoorSensors>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'current_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'current_time) (cl:floor (cl:slot-value msg 'current_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tof))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'fsr1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr6)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr7)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr8)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr9)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr10)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr11)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr12)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr_contact_1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fsr_contact_2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DoorSensors>) istream)
  "Deserializes a message object of type '<DoorSensors>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tof) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr3) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr4) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr5) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr6) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr7) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr8) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr9) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr10) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr11) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr12) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr_contact_1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fsr_contact_2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DoorSensors>)))
  "Returns string type for a message object of type '<DoorSensors>"
  "infrastructure_msgs/DoorSensors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DoorSensors)))
  "Returns string type for a message object of type 'DoorSensors"
  "infrastructure_msgs/DoorSensors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DoorSensors>)))
  "Returns md5sum for a message object of type '<DoorSensors>"
  "78d3070a7f6d7fc59eb47b90108edee6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DoorSensors)))
  "Returns md5sum for a message object of type 'DoorSensors"
  "78d3070a7f6d7fc59eb47b90108edee6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DoorSensors>)))
  "Returns full string definition for message of type '<DoorSensors>"
  (cl:format cl:nil "time current_time~%float32 tof ~%int32 fsr1~%int32 fsr2~%int32 fsr3~%int32 fsr4~%int32 fsr5~%int32 fsr6~%int32 fsr7~%int32 fsr8~%int32 fsr9~%int32 fsr10~%int32 fsr11~%int32 fsr12~%int32 fsr_contact_1~%int32 fsr_contact_2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DoorSensors)))
  "Returns full string definition for message of type 'DoorSensors"
  (cl:format cl:nil "time current_time~%float32 tof ~%int32 fsr1~%int32 fsr2~%int32 fsr3~%int32 fsr4~%int32 fsr5~%int32 fsr6~%int32 fsr7~%int32 fsr8~%int32 fsr9~%int32 fsr10~%int32 fsr11~%int32 fsr12~%int32 fsr_contact_1~%int32 fsr_contact_2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DoorSensors>))
  (cl:+ 0
     8
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DoorSensors>))
  "Converts a ROS message object to a list"
  (cl:list 'DoorSensors
    (cl:cons ':current_time (current_time msg))
    (cl:cons ':tof (tof msg))
    (cl:cons ':fsr1 (fsr1 msg))
    (cl:cons ':fsr2 (fsr2 msg))
    (cl:cons ':fsr3 (fsr3 msg))
    (cl:cons ':fsr4 (fsr4 msg))
    (cl:cons ':fsr5 (fsr5 msg))
    (cl:cons ':fsr6 (fsr6 msg))
    (cl:cons ':fsr7 (fsr7 msg))
    (cl:cons ':fsr8 (fsr8 msg))
    (cl:cons ':fsr9 (fsr9 msg))
    (cl:cons ':fsr10 (fsr10 msg))
    (cl:cons ':fsr11 (fsr11 msg))
    (cl:cons ':fsr12 (fsr12 msg))
    (cl:cons ':fsr_contact_1 (fsr_contact_1 msg))
    (cl:cons ':fsr_contact_2 (fsr_contact_2 msg))
))
