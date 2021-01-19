// Auto-generated. Do not edit!

// (in-package arm_tracking.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrackedPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_base_rvec = null;
      this.robot_base_tvec = null;
      this.robot_ef_rvec = null;
      this.robot_ef_tvec = null;
      this.workpiece_rvec = null;
      this.workpiece_tvec = null;
      this.workpiece_corners_x = null;
      this.workpiece_corners_y = null;
      this.robot_ef_corners_x = null;
      this.robot_ef_corners_y = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_base_rvec')) {
        this.robot_base_rvec = initObj.robot_base_rvec
      }
      else {
        this.robot_base_rvec = [];
      }
      if (initObj.hasOwnProperty('robot_base_tvec')) {
        this.robot_base_tvec = initObj.robot_base_tvec
      }
      else {
        this.robot_base_tvec = [];
      }
      if (initObj.hasOwnProperty('robot_ef_rvec')) {
        this.robot_ef_rvec = initObj.robot_ef_rvec
      }
      else {
        this.robot_ef_rvec = [];
      }
      if (initObj.hasOwnProperty('robot_ef_tvec')) {
        this.robot_ef_tvec = initObj.robot_ef_tvec
      }
      else {
        this.robot_ef_tvec = [];
      }
      if (initObj.hasOwnProperty('workpiece_rvec')) {
        this.workpiece_rvec = initObj.workpiece_rvec
      }
      else {
        this.workpiece_rvec = [];
      }
      if (initObj.hasOwnProperty('workpiece_tvec')) {
        this.workpiece_tvec = initObj.workpiece_tvec
      }
      else {
        this.workpiece_tvec = [];
      }
      if (initObj.hasOwnProperty('workpiece_corners_x')) {
        this.workpiece_corners_x = initObj.workpiece_corners_x
      }
      else {
        this.workpiece_corners_x = [];
      }
      if (initObj.hasOwnProperty('workpiece_corners_y')) {
        this.workpiece_corners_y = initObj.workpiece_corners_y
      }
      else {
        this.workpiece_corners_y = [];
      }
      if (initObj.hasOwnProperty('robot_ef_corners_x')) {
        this.robot_ef_corners_x = initObj.robot_ef_corners_x
      }
      else {
        this.robot_ef_corners_x = [];
      }
      if (initObj.hasOwnProperty('robot_ef_corners_y')) {
        this.robot_ef_corners_y = initObj.robot_ef_corners_y
      }
      else {
        this.robot_ef_corners_y = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackedPose
    // Serialize message field [robot_base_rvec]
    bufferOffset = _arraySerializer.float64(obj.robot_base_rvec, buffer, bufferOffset, null);
    // Serialize message field [robot_base_tvec]
    bufferOffset = _arraySerializer.float64(obj.robot_base_tvec, buffer, bufferOffset, null);
    // Serialize message field [robot_ef_rvec]
    bufferOffset = _arraySerializer.float64(obj.robot_ef_rvec, buffer, bufferOffset, null);
    // Serialize message field [robot_ef_tvec]
    bufferOffset = _arraySerializer.float64(obj.robot_ef_tvec, buffer, bufferOffset, null);
    // Serialize message field [workpiece_rvec]
    bufferOffset = _arraySerializer.float64(obj.workpiece_rvec, buffer, bufferOffset, null);
    // Serialize message field [workpiece_tvec]
    bufferOffset = _arraySerializer.float64(obj.workpiece_tvec, buffer, bufferOffset, null);
    // Serialize message field [workpiece_corners_x]
    bufferOffset = _arraySerializer.float64(obj.workpiece_corners_x, buffer, bufferOffset, null);
    // Serialize message field [workpiece_corners_y]
    bufferOffset = _arraySerializer.float64(obj.workpiece_corners_y, buffer, bufferOffset, null);
    // Serialize message field [robot_ef_corners_x]
    bufferOffset = _arraySerializer.float64(obj.robot_ef_corners_x, buffer, bufferOffset, null);
    // Serialize message field [robot_ef_corners_y]
    bufferOffset = _arraySerializer.float64(obj.robot_ef_corners_y, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackedPose
    let len;
    let data = new TrackedPose(null);
    // Deserialize message field [robot_base_rvec]
    data.robot_base_rvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [robot_base_tvec]
    data.robot_base_tvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [robot_ef_rvec]
    data.robot_ef_rvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [robot_ef_tvec]
    data.robot_ef_tvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [workpiece_rvec]
    data.workpiece_rvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [workpiece_tvec]
    data.workpiece_tvec = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [workpiece_corners_x]
    data.workpiece_corners_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [workpiece_corners_y]
    data.workpiece_corners_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [robot_ef_corners_x]
    data.robot_ef_corners_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [robot_ef_corners_y]
    data.robot_ef_corners_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.robot_base_rvec.length;
    length += 8 * object.robot_base_tvec.length;
    length += 8 * object.robot_ef_rvec.length;
    length += 8 * object.robot_ef_tvec.length;
    length += 8 * object.workpiece_rvec.length;
    length += 8 * object.workpiece_tvec.length;
    length += 8 * object.workpiece_corners_x.length;
    length += 8 * object.workpiece_corners_y.length;
    length += 8 * object.robot_ef_corners_x.length;
    length += 8 * object.robot_ef_corners_y.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arm_tracking/TrackedPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '339ac58acc7c50a83fc20359186dc24d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] robot_base_rvec
    float64[] robot_base_tvec
    float64[] robot_ef_rvec
    float64[] robot_ef_tvec
    float64[] workpiece_rvec
    float64[] workpiece_tvec
    #workpiece marker corner x coordinates
    float64[] workpiece_corners_x 
    #workpiece marker corner y coordinates
    float64[] workpiece_corners_y 
    
    #robot ef marker corner x coordinates
    float64[] robot_ef_corners_x 
    #robot ef marker corner y coordinates
    float64[] robot_ef_corners_y 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackedPose(null);
    if (msg.robot_base_rvec !== undefined) {
      resolved.robot_base_rvec = msg.robot_base_rvec;
    }
    else {
      resolved.robot_base_rvec = []
    }

    if (msg.robot_base_tvec !== undefined) {
      resolved.robot_base_tvec = msg.robot_base_tvec;
    }
    else {
      resolved.robot_base_tvec = []
    }

    if (msg.robot_ef_rvec !== undefined) {
      resolved.robot_ef_rvec = msg.robot_ef_rvec;
    }
    else {
      resolved.robot_ef_rvec = []
    }

    if (msg.robot_ef_tvec !== undefined) {
      resolved.robot_ef_tvec = msg.robot_ef_tvec;
    }
    else {
      resolved.robot_ef_tvec = []
    }

    if (msg.workpiece_rvec !== undefined) {
      resolved.workpiece_rvec = msg.workpiece_rvec;
    }
    else {
      resolved.workpiece_rvec = []
    }

    if (msg.workpiece_tvec !== undefined) {
      resolved.workpiece_tvec = msg.workpiece_tvec;
    }
    else {
      resolved.workpiece_tvec = []
    }

    if (msg.workpiece_corners_x !== undefined) {
      resolved.workpiece_corners_x = msg.workpiece_corners_x;
    }
    else {
      resolved.workpiece_corners_x = []
    }

    if (msg.workpiece_corners_y !== undefined) {
      resolved.workpiece_corners_y = msg.workpiece_corners_y;
    }
    else {
      resolved.workpiece_corners_y = []
    }

    if (msg.robot_ef_corners_x !== undefined) {
      resolved.robot_ef_corners_x = msg.robot_ef_corners_x;
    }
    else {
      resolved.robot_ef_corners_x = []
    }

    if (msg.robot_ef_corners_y !== undefined) {
      resolved.robot_ef_corners_y = msg.robot_ef_corners_y;
    }
    else {
      resolved.robot_ef_corners_y = []
    }

    return resolved;
    }
};

module.exports = TrackedPose;
