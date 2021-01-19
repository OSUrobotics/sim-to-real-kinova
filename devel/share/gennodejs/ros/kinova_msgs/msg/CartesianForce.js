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

class CartesianForce {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.force_x = null;
      this.force_y = null;
      this.force_z = null;
      this.torque_x = null;
      this.torque_y = null;
      this.torque_z = null;
    }
    else {
      if (initObj.hasOwnProperty('force_x')) {
        this.force_x = initObj.force_x
      }
      else {
        this.force_x = 0.0;
      }
      if (initObj.hasOwnProperty('force_y')) {
        this.force_y = initObj.force_y
      }
      else {
        this.force_y = 0.0;
      }
      if (initObj.hasOwnProperty('force_z')) {
        this.force_z = initObj.force_z
      }
      else {
        this.force_z = 0.0;
      }
      if (initObj.hasOwnProperty('torque_x')) {
        this.torque_x = initObj.torque_x
      }
      else {
        this.torque_x = 0.0;
      }
      if (initObj.hasOwnProperty('torque_y')) {
        this.torque_y = initObj.torque_y
      }
      else {
        this.torque_y = 0.0;
      }
      if (initObj.hasOwnProperty('torque_z')) {
        this.torque_z = initObj.torque_z
      }
      else {
        this.torque_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianForce
    // Serialize message field [force_x]
    bufferOffset = _serializer.float32(obj.force_x, buffer, bufferOffset);
    // Serialize message field [force_y]
    bufferOffset = _serializer.float32(obj.force_y, buffer, bufferOffset);
    // Serialize message field [force_z]
    bufferOffset = _serializer.float32(obj.force_z, buffer, bufferOffset);
    // Serialize message field [torque_x]
    bufferOffset = _serializer.float32(obj.torque_x, buffer, bufferOffset);
    // Serialize message field [torque_y]
    bufferOffset = _serializer.float32(obj.torque_y, buffer, bufferOffset);
    // Serialize message field [torque_z]
    bufferOffset = _serializer.float32(obj.torque_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianForce
    let len;
    let data = new CartesianForce(null);
    // Deserialize message field [force_x]
    data.force_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [force_y]
    data.force_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [force_z]
    data.force_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque_x]
    data.torque_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque_y]
    data.torque_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [torque_z]
    data.torque_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kinova_msgs/CartesianForce';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b01974557c40b776cdb7003057779989';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 force_x
    float32 force_y
    float32 force_z
    float32 torque_x
    float32 torque_y
    float32 torque_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianForce(null);
    if (msg.force_x !== undefined) {
      resolved.force_x = msg.force_x;
    }
    else {
      resolved.force_x = 0.0
    }

    if (msg.force_y !== undefined) {
      resolved.force_y = msg.force_y;
    }
    else {
      resolved.force_y = 0.0
    }

    if (msg.force_z !== undefined) {
      resolved.force_z = msg.force_z;
    }
    else {
      resolved.force_z = 0.0
    }

    if (msg.torque_x !== undefined) {
      resolved.torque_x = msg.torque_x;
    }
    else {
      resolved.torque_x = 0.0
    }

    if (msg.torque_y !== undefined) {
      resolved.torque_y = msg.torque_y;
    }
    else {
      resolved.torque_y = 0.0
    }

    if (msg.torque_z !== undefined) {
      resolved.torque_z = msg.torque_z;
    }
    else {
      resolved.torque_z = 0.0
    }

    return resolved;
    }
};

module.exports = CartesianForce;
