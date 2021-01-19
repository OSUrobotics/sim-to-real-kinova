// Auto-generated. Do not edit!

// (in-package arm_tracking.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PidParam = require('./PidParam.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PidUpdate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pid_param = null;
      this.error = null;
      this.integ_error = null;
      this.delta_error = null;
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pid_param')) {
        this.pid_param = initObj.pid_param
      }
      else {
        this.pid_param = new PidParam();
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = [];
      }
      if (initObj.hasOwnProperty('integ_error')) {
        this.integ_error = initObj.integ_error
      }
      else {
        this.integ_error = [];
      }
      if (initObj.hasOwnProperty('delta_error')) {
        this.delta_error = initObj.delta_error
      }
      else {
        this.delta_error = [];
      }
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PidUpdate
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pid_param]
    bufferOffset = PidParam.serialize(obj.pid_param, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _arraySerializer.float64(obj.error, buffer, bufferOffset, null);
    // Serialize message field [integ_error]
    bufferOffset = _arraySerializer.float64(obj.integ_error, buffer, bufferOffset, null);
    // Serialize message field [delta_error]
    bufferOffset = _arraySerializer.float64(obj.delta_error, buffer, bufferOffset, null);
    // Serialize message field [response]
    bufferOffset = _arraySerializer.float64(obj.response, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PidUpdate
    let len;
    let data = new PidUpdate(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pid_param]
    data.pid_param = PidParam.deserialize(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [integ_error]
    data.integ_error = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [delta_error]
    data.delta_error = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [response]
    data.response = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.error.length;
    length += 8 * object.integ_error.length;
    length += 8 * object.delta_error.length;
    length += 8 * object.response.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arm_tracking/PidUpdate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9372ece7e9f74def456f1090966e8315';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    #kp,kd,ki
    arm_tracking/PidParam pid_param
    float64[] error
    float64[] integ_error
    float64[] delta_error
    
    #kp*e + kd*delta_e + ki*integ_e
    float64[] response
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: arm_tracking/PidParam
    float64 kp
    float64 ki
    float64 kd
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PidUpdate(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pid_param !== undefined) {
      resolved.pid_param = PidParam.Resolve(msg.pid_param)
    }
    else {
      resolved.pid_param = new PidParam()
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = []
    }

    if (msg.integ_error !== undefined) {
      resolved.integ_error = msg.integ_error;
    }
    else {
      resolved.integ_error = []
    }

    if (msg.delta_error !== undefined) {
      resolved.delta_error = msg.delta_error;
    }
    else {
      resolved.delta_error = []
    }

    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = []
    }

    return resolved;
    }
};

module.exports = PidUpdate;
