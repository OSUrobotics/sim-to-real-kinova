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

class DoorSensors {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_time = null;
      this.tof = null;
      this.fsr1 = null;
      this.fsr2 = null;
      this.fsr3 = null;
      this.fsr4 = null;
      this.fsr5 = null;
      this.fsr6 = null;
      this.fsr7 = null;
      this.fsr8 = null;
      this.fsr9 = null;
      this.fsr10 = null;
      this.fsr11 = null;
      this.fsr12 = null;
      this.fsr_contact_1 = null;
      this.fsr_contact_2 = null;
    }
    else {
      if (initObj.hasOwnProperty('current_time')) {
        this.current_time = initObj.current_time
      }
      else {
        this.current_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('tof')) {
        this.tof = initObj.tof
      }
      else {
        this.tof = 0.0;
      }
      if (initObj.hasOwnProperty('fsr1')) {
        this.fsr1 = initObj.fsr1
      }
      else {
        this.fsr1 = 0;
      }
      if (initObj.hasOwnProperty('fsr2')) {
        this.fsr2 = initObj.fsr2
      }
      else {
        this.fsr2 = 0;
      }
      if (initObj.hasOwnProperty('fsr3')) {
        this.fsr3 = initObj.fsr3
      }
      else {
        this.fsr3 = 0;
      }
      if (initObj.hasOwnProperty('fsr4')) {
        this.fsr4 = initObj.fsr4
      }
      else {
        this.fsr4 = 0;
      }
      if (initObj.hasOwnProperty('fsr5')) {
        this.fsr5 = initObj.fsr5
      }
      else {
        this.fsr5 = 0;
      }
      if (initObj.hasOwnProperty('fsr6')) {
        this.fsr6 = initObj.fsr6
      }
      else {
        this.fsr6 = 0;
      }
      if (initObj.hasOwnProperty('fsr7')) {
        this.fsr7 = initObj.fsr7
      }
      else {
        this.fsr7 = 0;
      }
      if (initObj.hasOwnProperty('fsr8')) {
        this.fsr8 = initObj.fsr8
      }
      else {
        this.fsr8 = 0;
      }
      if (initObj.hasOwnProperty('fsr9')) {
        this.fsr9 = initObj.fsr9
      }
      else {
        this.fsr9 = 0;
      }
      if (initObj.hasOwnProperty('fsr10')) {
        this.fsr10 = initObj.fsr10
      }
      else {
        this.fsr10 = 0;
      }
      if (initObj.hasOwnProperty('fsr11')) {
        this.fsr11 = initObj.fsr11
      }
      else {
        this.fsr11 = 0;
      }
      if (initObj.hasOwnProperty('fsr12')) {
        this.fsr12 = initObj.fsr12
      }
      else {
        this.fsr12 = 0;
      }
      if (initObj.hasOwnProperty('fsr_contact_1')) {
        this.fsr_contact_1 = initObj.fsr_contact_1
      }
      else {
        this.fsr_contact_1 = 0;
      }
      if (initObj.hasOwnProperty('fsr_contact_2')) {
        this.fsr_contact_2 = initObj.fsr_contact_2
      }
      else {
        this.fsr_contact_2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DoorSensors
    // Serialize message field [current_time]
    bufferOffset = _serializer.time(obj.current_time, buffer, bufferOffset);
    // Serialize message field [tof]
    bufferOffset = _serializer.float32(obj.tof, buffer, bufferOffset);
    // Serialize message field [fsr1]
    bufferOffset = _serializer.int32(obj.fsr1, buffer, bufferOffset);
    // Serialize message field [fsr2]
    bufferOffset = _serializer.int32(obj.fsr2, buffer, bufferOffset);
    // Serialize message field [fsr3]
    bufferOffset = _serializer.int32(obj.fsr3, buffer, bufferOffset);
    // Serialize message field [fsr4]
    bufferOffset = _serializer.int32(obj.fsr4, buffer, bufferOffset);
    // Serialize message field [fsr5]
    bufferOffset = _serializer.int32(obj.fsr5, buffer, bufferOffset);
    // Serialize message field [fsr6]
    bufferOffset = _serializer.int32(obj.fsr6, buffer, bufferOffset);
    // Serialize message field [fsr7]
    bufferOffset = _serializer.int32(obj.fsr7, buffer, bufferOffset);
    // Serialize message field [fsr8]
    bufferOffset = _serializer.int32(obj.fsr8, buffer, bufferOffset);
    // Serialize message field [fsr9]
    bufferOffset = _serializer.int32(obj.fsr9, buffer, bufferOffset);
    // Serialize message field [fsr10]
    bufferOffset = _serializer.int32(obj.fsr10, buffer, bufferOffset);
    // Serialize message field [fsr11]
    bufferOffset = _serializer.int32(obj.fsr11, buffer, bufferOffset);
    // Serialize message field [fsr12]
    bufferOffset = _serializer.int32(obj.fsr12, buffer, bufferOffset);
    // Serialize message field [fsr_contact_1]
    bufferOffset = _serializer.int32(obj.fsr_contact_1, buffer, bufferOffset);
    // Serialize message field [fsr_contact_2]
    bufferOffset = _serializer.int32(obj.fsr_contact_2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DoorSensors
    let len;
    let data = new DoorSensors(null);
    // Deserialize message field [current_time]
    data.current_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [tof]
    data.tof = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fsr1]
    data.fsr1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr2]
    data.fsr2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr3]
    data.fsr3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr4]
    data.fsr4 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr5]
    data.fsr5 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr6]
    data.fsr6 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr7]
    data.fsr7 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr8]
    data.fsr8 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr9]
    data.fsr9 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr10]
    data.fsr10 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr11]
    data.fsr11 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr12]
    data.fsr12 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr_contact_1]
    data.fsr_contact_1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fsr_contact_2]
    data.fsr_contact_2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'infrastructure_msgs/DoorSensors';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '78d3070a7f6d7fc59eb47b90108edee6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time current_time
    float32 tof 
    int32 fsr1
    int32 fsr2
    int32 fsr3
    int32 fsr4
    int32 fsr5
    int32 fsr6
    int32 fsr7
    int32 fsr8
    int32 fsr9
    int32 fsr10
    int32 fsr11
    int32 fsr12
    int32 fsr_contact_1
    int32 fsr_contact_2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DoorSensors(null);
    if (msg.current_time !== undefined) {
      resolved.current_time = msg.current_time;
    }
    else {
      resolved.current_time = {secs: 0, nsecs: 0}
    }

    if (msg.tof !== undefined) {
      resolved.tof = msg.tof;
    }
    else {
      resolved.tof = 0.0
    }

    if (msg.fsr1 !== undefined) {
      resolved.fsr1 = msg.fsr1;
    }
    else {
      resolved.fsr1 = 0
    }

    if (msg.fsr2 !== undefined) {
      resolved.fsr2 = msg.fsr2;
    }
    else {
      resolved.fsr2 = 0
    }

    if (msg.fsr3 !== undefined) {
      resolved.fsr3 = msg.fsr3;
    }
    else {
      resolved.fsr3 = 0
    }

    if (msg.fsr4 !== undefined) {
      resolved.fsr4 = msg.fsr4;
    }
    else {
      resolved.fsr4 = 0
    }

    if (msg.fsr5 !== undefined) {
      resolved.fsr5 = msg.fsr5;
    }
    else {
      resolved.fsr5 = 0
    }

    if (msg.fsr6 !== undefined) {
      resolved.fsr6 = msg.fsr6;
    }
    else {
      resolved.fsr6 = 0
    }

    if (msg.fsr7 !== undefined) {
      resolved.fsr7 = msg.fsr7;
    }
    else {
      resolved.fsr7 = 0
    }

    if (msg.fsr8 !== undefined) {
      resolved.fsr8 = msg.fsr8;
    }
    else {
      resolved.fsr8 = 0
    }

    if (msg.fsr9 !== undefined) {
      resolved.fsr9 = msg.fsr9;
    }
    else {
      resolved.fsr9 = 0
    }

    if (msg.fsr10 !== undefined) {
      resolved.fsr10 = msg.fsr10;
    }
    else {
      resolved.fsr10 = 0
    }

    if (msg.fsr11 !== undefined) {
      resolved.fsr11 = msg.fsr11;
    }
    else {
      resolved.fsr11 = 0
    }

    if (msg.fsr12 !== undefined) {
      resolved.fsr12 = msg.fsr12;
    }
    else {
      resolved.fsr12 = 0
    }

    if (msg.fsr_contact_1 !== undefined) {
      resolved.fsr_contact_1 = msg.fsr_contact_1;
    }
    else {
      resolved.fsr_contact_1 = 0
    }

    if (msg.fsr_contact_2 !== undefined) {
      resolved.fsr_contact_2 = msg.fsr_contact_2;
    }
    else {
      resolved.fsr_contact_2 = 0
    }

    return resolved;
    }
};

module.exports = DoorSensors;
