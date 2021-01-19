// Auto-generated. Do not edit!

// (in-package kinova_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class FingerPosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finger1 = null;
      this.finger2 = null;
      this.finger3 = null;
    }
    else {
      if (initObj.hasOwnProperty('finger1')) {
        this.finger1 = initObj.finger1
      }
      else {
        this.finger1 = 0.0;
      }
      if (initObj.hasOwnProperty('finger2')) {
        this.finger2 = initObj.finger2
      }
      else {
        this.finger2 = 0.0;
      }
      if (initObj.hasOwnProperty('finger3')) {
        this.finger3 = initObj.finger3
      }
      else {
        this.finger3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FingerPosition
    // Serialize message field [finger1]
    bufferOffset = _serializer.float32(obj.finger1, buffer, bufferOffset);
    // Serialize message field [finger2]
    bufferOffset = _serializer.float32(obj.finger2, buffer, bufferOffset);
    // Serialize message field [finger3]
    bufferOffset = _serializer.float32(obj.finger3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FingerPosition
    let len;
    let data = new FingerPosition(null);
    // Deserialize message field [finger1]
    data.finger1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [finger2]
    data.finger2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [finger3]
    data.finger3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kinova_msgs/FingerPosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f56891e5dcd1900989f764a9b845c8e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 finger1
    float32 finger2
    float32 finger3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FingerPosition(null);
    if (msg.finger1 !== undefined) {
      resolved.finger1 = msg.finger1;
    }
    else {
      resolved.finger1 = 0.0
    }

    if (msg.finger2 !== undefined) {
      resolved.finger2 = msg.finger2;
    }
    else {
      resolved.finger2 = 0.0
    }

    if (msg.finger3 !== undefined) {
      resolved.finger3 = msg.finger3;
    }
    else {
      resolved.finger3 = 0.0
    }

    return resolved;
    }
};

module.exports = FingerPosition;
