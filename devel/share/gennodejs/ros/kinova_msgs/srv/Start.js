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

class StartRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StartRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StartRequest
    let len;
    let data = new StartRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/StartRequest';
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
    const resolved = new StartRequest(null);
    return resolved;
    }
};

class StartResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_result = null;
    }
    else {
      if (initObj.hasOwnProperty('start_result')) {
        this.start_result = initObj.start_result
      }
      else {
        this.start_result = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StartResponse
    // Serialize message field [start_result]
    bufferOffset = _serializer.string(obj.start_result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StartResponse
    let len;
    let data = new StartResponse(null);
    // Deserialize message field [start_result]
    data.start_result = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.start_result);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/StartResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e762e31d813526eaaa6a12e8354174fc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string start_result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StartResponse(null);
    if (msg.start_result !== undefined) {
      resolved.start_result = msg.start_result;
    }
    else {
      resolved.start_result = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: StartRequest,
  Response: StartResponse,
  md5sum() { return 'e762e31d813526eaaa6a12e8354174fc'; },
  datatype() { return 'kinova_msgs/Start'; }
};
