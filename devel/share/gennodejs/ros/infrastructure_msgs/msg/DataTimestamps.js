// Auto-generated. Do not edit!

// (in-package infrastructure_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DataTimestamps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trial_number = null;
      this.collection_start_time = null;
      this.collection_end_time = null;
      this.total_time = null;
    }
    else {
      if (initObj.hasOwnProperty('trial_number')) {
        this.trial_number = initObj.trial_number
      }
      else {
        this.trial_number = 0;
      }
      if (initObj.hasOwnProperty('collection_start_time')) {
        this.collection_start_time = initObj.collection_start_time
      }
      else {
        this.collection_start_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('collection_end_time')) {
        this.collection_end_time = initObj.collection_end_time
      }
      else {
        this.collection_end_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('total_time')) {
        this.total_time = initObj.total_time
      }
      else {
        this.total_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DataTimestamps
    // Serialize message field [trial_number]
    bufferOffset = _serializer.int64(obj.trial_number, buffer, bufferOffset);
    // Serialize message field [collection_start_time]
    bufferOffset = _serializer.time(obj.collection_start_time, buffer, bufferOffset);
    // Serialize message field [collection_end_time]
    bufferOffset = _serializer.time(obj.collection_end_time, buffer, bufferOffset);
    // Serialize message field [total_time]
    bufferOffset = _serializer.float64(obj.total_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DataTimestamps
    let len;
    let data = new DataTimestamps(null);
    // Deserialize message field [trial_number]
    data.trial_number = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [collection_start_time]
    data.collection_start_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [collection_end_time]
    data.collection_end_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [total_time]
    data.total_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'infrastructure_msgs/DataTimestamps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0b7790f826e3d5970b2ea5a3e61bdd36';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 trial_number
    time collection_start_time
    time collection_end_time
    float64 total_time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DataTimestamps(null);
    if (msg.trial_number !== undefined) {
      resolved.trial_number = msg.trial_number;
    }
    else {
      resolved.trial_number = 0
    }

    if (msg.collection_start_time !== undefined) {
      resolved.collection_start_time = msg.collection_start_time;
    }
    else {
      resolved.collection_start_time = {secs: 0, nsecs: 0}
    }

    if (msg.collection_end_time !== undefined) {
      resolved.collection_end_time = msg.collection_end_time;
    }
    else {
      resolved.collection_end_time = {secs: 0, nsecs: 0}
    }

    if (msg.total_time !== undefined) {
      resolved.total_time = msg.total_time;
    }
    else {
      resolved.total_time = 0.0
    }

    return resolved;
    }
};

module.exports = DataTimestamps;
