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

class HomeArmRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HomeArmRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HomeArmRequest
    let len;
    let data = new HomeArmRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/HomeArmRequest';
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
    const resolved = new HomeArmRequest(null);
    return resolved;
    }
};

class HomeArmResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.homearm_result = null;
    }
    else {
      if (initObj.hasOwnProperty('homearm_result')) {
        this.homearm_result = initObj.homearm_result
      }
      else {
        this.homearm_result = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HomeArmResponse
    // Serialize message field [homearm_result]
    bufferOffset = _serializer.string(obj.homearm_result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HomeArmResponse
    let len;
    let data = new HomeArmResponse(null);
    // Deserialize message field [homearm_result]
    data.homearm_result = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.homearm_result);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/HomeArmResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '46e470f2c1a7177398c57a43eafe8d67';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string homearm_result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HomeArmResponse(null);
    if (msg.homearm_result !== undefined) {
      resolved.homearm_result = msg.homearm_result;
    }
    else {
      resolved.homearm_result = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: HomeArmRequest,
  Response: HomeArmResponse,
  md5sum() { return '46e470f2c1a7177398c57a43eafe8d67'; },
  datatype() { return 'kinova_msgs/HomeArm'; }
};
