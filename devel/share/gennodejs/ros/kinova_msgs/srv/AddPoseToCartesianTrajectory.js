// Auto-generated. Do not edit!

// (in-package kinova_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddPoseToCartesianTrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.X = null;
      this.Y = null;
      this.Z = null;
      this.ThetaX = null;
      this.ThetaY = null;
      this.ThetaZ = null;
    }
    else {
      if (initObj.hasOwnProperty('X')) {
        this.X = initObj.X
      }
      else {
        this.X = 0.0;
      }
      if (initObj.hasOwnProperty('Y')) {
        this.Y = initObj.Y
      }
      else {
        this.Y = 0.0;
      }
      if (initObj.hasOwnProperty('Z')) {
        this.Z = initObj.Z
      }
      else {
        this.Z = 0.0;
      }
      if (initObj.hasOwnProperty('ThetaX')) {
        this.ThetaX = initObj.ThetaX
      }
      else {
        this.ThetaX = 0.0;
      }
      if (initObj.hasOwnProperty('ThetaY')) {
        this.ThetaY = initObj.ThetaY
      }
      else {
        this.ThetaY = 0.0;
      }
      if (initObj.hasOwnProperty('ThetaZ')) {
        this.ThetaZ = initObj.ThetaZ
      }
      else {
        this.ThetaZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddPoseToCartesianTrajectoryRequest
    // Serialize message field [X]
    bufferOffset = _serializer.float32(obj.X, buffer, bufferOffset);
    // Serialize message field [Y]
    bufferOffset = _serializer.float32(obj.Y, buffer, bufferOffset);
    // Serialize message field [Z]
    bufferOffset = _serializer.float32(obj.Z, buffer, bufferOffset);
    // Serialize message field [ThetaX]
    bufferOffset = _serializer.float32(obj.ThetaX, buffer, bufferOffset);
    // Serialize message field [ThetaY]
    bufferOffset = _serializer.float32(obj.ThetaY, buffer, bufferOffset);
    // Serialize message field [ThetaZ]
    bufferOffset = _serializer.float32(obj.ThetaZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddPoseToCartesianTrajectoryRequest
    let len;
    let data = new AddPoseToCartesianTrajectoryRequest(null);
    // Deserialize message field [X]
    data.X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Y]
    data.Y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Z]
    data.Z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ThetaX]
    data.ThetaX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ThetaY]
    data.ThetaY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ThetaZ]
    data.ThetaZ = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/AddPoseToCartesianTrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e831d993faea563f6fe69d7db9b384c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 X
    float32 Y
    float32 Z
    float32 ThetaX
    float32 ThetaY
    float32 ThetaZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddPoseToCartesianTrajectoryRequest(null);
    if (msg.X !== undefined) {
      resolved.X = msg.X;
    }
    else {
      resolved.X = 0.0
    }

    if (msg.Y !== undefined) {
      resolved.Y = msg.Y;
    }
    else {
      resolved.Y = 0.0
    }

    if (msg.Z !== undefined) {
      resolved.Z = msg.Z;
    }
    else {
      resolved.Z = 0.0
    }

    if (msg.ThetaX !== undefined) {
      resolved.ThetaX = msg.ThetaX;
    }
    else {
      resolved.ThetaX = 0.0
    }

    if (msg.ThetaY !== undefined) {
      resolved.ThetaY = msg.ThetaY;
    }
    else {
      resolved.ThetaY = 0.0
    }

    if (msg.ThetaZ !== undefined) {
      resolved.ThetaZ = msg.ThetaZ;
    }
    else {
      resolved.ThetaZ = 0.0
    }

    return resolved;
    }
};

class AddPoseToCartesianTrajectoryResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddPoseToCartesianTrajectoryResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddPoseToCartesianTrajectoryResponse
    let len;
    let data = new AddPoseToCartesianTrajectoryResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/AddPoseToCartesianTrajectoryResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddPoseToCartesianTrajectoryResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: AddPoseToCartesianTrajectoryRequest,
  Response: AddPoseToCartesianTrajectoryResponse,
  md5sum() { return 'e831d993faea563f6fe69d7db9b384c9'; },
  datatype() { return 'kinova_msgs/AddPoseToCartesianTrajectory'; }
};
