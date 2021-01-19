// Auto-generated. Do not edit!

// (in-package kinova_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetForceControlParamsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.inertia_linear = null;
      this.inertia_angular = null;
      this.damping_linear = null;
      this.damping_angular = null;
      this.force_min_linear = null;
      this.force_min_angular = null;
      this.force_max_linear = null;
      this.force_max_angular = null;
    }
    else {
      if (initObj.hasOwnProperty('inertia_linear')) {
        this.inertia_linear = initObj.inertia_linear
      }
      else {
        this.inertia_linear = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('inertia_angular')) {
        this.inertia_angular = initObj.inertia_angular
      }
      else {
        this.inertia_angular = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('damping_linear')) {
        this.damping_linear = initObj.damping_linear
      }
      else {
        this.damping_linear = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('damping_angular')) {
        this.damping_angular = initObj.damping_angular
      }
      else {
        this.damping_angular = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('force_min_linear')) {
        this.force_min_linear = initObj.force_min_linear
      }
      else {
        this.force_min_linear = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('force_min_angular')) {
        this.force_min_angular = initObj.force_min_angular
      }
      else {
        this.force_min_angular = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('force_max_linear')) {
        this.force_max_linear = initObj.force_max_linear
      }
      else {
        this.force_max_linear = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('force_max_angular')) {
        this.force_max_angular = initObj.force_max_angular
      }
      else {
        this.force_max_angular = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetForceControlParamsRequest
    // Serialize message field [inertia_linear]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.inertia_linear, buffer, bufferOffset);
    // Serialize message field [inertia_angular]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.inertia_angular, buffer, bufferOffset);
    // Serialize message field [damping_linear]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.damping_linear, buffer, bufferOffset);
    // Serialize message field [damping_angular]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.damping_angular, buffer, bufferOffset);
    // Serialize message field [force_min_linear]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.force_min_linear, buffer, bufferOffset);
    // Serialize message field [force_min_angular]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.force_min_angular, buffer, bufferOffset);
    // Serialize message field [force_max_linear]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.force_max_linear, buffer, bufferOffset);
    // Serialize message field [force_max_angular]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.force_max_angular, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetForceControlParamsRequest
    let len;
    let data = new SetForceControlParamsRequest(null);
    // Deserialize message field [inertia_linear]
    data.inertia_linear = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [inertia_angular]
    data.inertia_angular = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [damping_linear]
    data.damping_linear = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [damping_angular]
    data.damping_angular = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [force_min_linear]
    data.force_min_linear = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [force_min_angular]
    data.force_min_angular = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [force_max_linear]
    data.force_max_linear = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [force_max_angular]
    data.force_max_angular = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 192;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/SetForceControlParamsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c0999be3d1c60dba47ea0b2fd08231e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Vector3 inertia_linear
    geometry_msgs/Vector3 inertia_angular
    geometry_msgs/Vector3 damping_linear
    geometry_msgs/Vector3 damping_angular
    geometry_msgs/Vector3 force_min_linear
    geometry_msgs/Vector3 force_min_angular
    geometry_msgs/Vector3 force_max_linear
    geometry_msgs/Vector3 force_max_angular
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetForceControlParamsRequest(null);
    if (msg.inertia_linear !== undefined) {
      resolved.inertia_linear = geometry_msgs.msg.Vector3.Resolve(msg.inertia_linear)
    }
    else {
      resolved.inertia_linear = new geometry_msgs.msg.Vector3()
    }

    if (msg.inertia_angular !== undefined) {
      resolved.inertia_angular = geometry_msgs.msg.Vector3.Resolve(msg.inertia_angular)
    }
    else {
      resolved.inertia_angular = new geometry_msgs.msg.Vector3()
    }

    if (msg.damping_linear !== undefined) {
      resolved.damping_linear = geometry_msgs.msg.Vector3.Resolve(msg.damping_linear)
    }
    else {
      resolved.damping_linear = new geometry_msgs.msg.Vector3()
    }

    if (msg.damping_angular !== undefined) {
      resolved.damping_angular = geometry_msgs.msg.Vector3.Resolve(msg.damping_angular)
    }
    else {
      resolved.damping_angular = new geometry_msgs.msg.Vector3()
    }

    if (msg.force_min_linear !== undefined) {
      resolved.force_min_linear = geometry_msgs.msg.Vector3.Resolve(msg.force_min_linear)
    }
    else {
      resolved.force_min_linear = new geometry_msgs.msg.Vector3()
    }

    if (msg.force_min_angular !== undefined) {
      resolved.force_min_angular = geometry_msgs.msg.Vector3.Resolve(msg.force_min_angular)
    }
    else {
      resolved.force_min_angular = new geometry_msgs.msg.Vector3()
    }

    if (msg.force_max_linear !== undefined) {
      resolved.force_max_linear = geometry_msgs.msg.Vector3.Resolve(msg.force_max_linear)
    }
    else {
      resolved.force_max_linear = new geometry_msgs.msg.Vector3()
    }

    if (msg.force_max_angular !== undefined) {
      resolved.force_max_angular = geometry_msgs.msg.Vector3.Resolve(msg.force_max_angular)
    }
    else {
      resolved.force_max_angular = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

class SetForceControlParamsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetForceControlParamsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetForceControlParamsResponse
    let len;
    let data = new SetForceControlParamsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/SetForceControlParamsResponse';
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
    const resolved = new SetForceControlParamsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetForceControlParamsRequest,
  Response: SetForceControlParamsResponse,
  md5sum() { return '5c0999be3d1c60dba47ea0b2fd08231e'; },
  datatype() { return 'kinova_msgs/SetForceControlParams'; }
};
