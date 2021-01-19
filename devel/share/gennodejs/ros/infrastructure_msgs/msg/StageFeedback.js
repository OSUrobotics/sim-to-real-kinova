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

class StageFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stage_status = null;
    }
    else {
      if (initObj.hasOwnProperty('stage_status')) {
        this.stage_status = initObj.stage_status
      }
      else {
        this.stage_status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StageFeedback
    // Serialize message field [stage_status]
    bufferOffset = _serializer.string(obj.stage_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StageFeedback
    let len;
    let data = new StageFeedback(null);
    // Deserialize message field [stage_status]
    data.stage_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.stage_status);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'infrastructure_msgs/StageFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44a8ac12072e758309ae673f423970a5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #feedback
    string stage_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StageFeedback(null);
    if (msg.stage_status !== undefined) {
      resolved.stage_status = msg.stage_status;
    }
    else {
      resolved.stage_status = ''
    }

    return resolved;
    }
};

module.exports = StageFeedback;