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

class StopRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StopRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StopRequest
    let len;
    let data = new StopRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/StopRequest';
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
    const resolved = new StopRequest(null);
    return resolved;
    }
};

class StopResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stop_result = null;
    }
    else {
      if (initObj.hasOwnProperty('stop_result')) {
        this.stop_result = initObj.stop_result
      }
      else {
        this.stop_result = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StopResponse
    // Serialize message field [stop_result]
    bufferOffset = _serializer.string(obj.stop_result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StopResponse
    let len;
    let data = new StopResponse(null);
    // Deserialize message field [stop_result]
    data.stop_result = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.stop_result);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'kinova_msgs/StopResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '585dc4164508d473dff8f8b67a05d2ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string stop_result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StopResponse(null);
    if (msg.stop_result !== undefined) {
      resolved.stop_result = msg.stop_result;
    }
    else {
      resolved.stop_result = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: StopRequest,
  Response: StopResponse,
  md5sum() { return '585dc4164508d473dff8f8b67a05d2ad'; },
  datatype() { return 'kinova_msgs/Stop'; }
};
