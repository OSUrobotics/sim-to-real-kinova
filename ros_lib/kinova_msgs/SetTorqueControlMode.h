#ifndef _ROS_SERVICE_SetTorqueControlMode_h
#define _ROS_SERVICE_SetTorqueControlMode_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

static const char SETTORQUECONTROLMODE[] = "kinova_msgs/SetTorqueControlMode";

  class SetTorqueControlModeRequest : public ros::Msg
  {
    public:
      typedef uint16_t _state_type;
      _state_type state;

    SetTorqueControlModeRequest():
      state(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->state >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->state >> (8 * 1)) & 0xFF;
      offset += sizeof(this->state);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->state =  ((uint16_t) (*(inbuffer + offset)));
      this->state |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      offset += sizeof(this->state);
     return offset;
    }

    virtual const char * getType() override { return SETTORQUECONTROLMODE; };
    virtual const char * getMD5() override { return "891b541ef99af7889d0f22a062410be8"; };

  };

  class SetTorqueControlModeResponse : public ros::Msg
  {
    public:

    SetTorqueControlModeResponse()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
     return offset;
    }

    virtual const char * getType() override { return SETTORQUECONTROLMODE; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class SetTorqueControlMode {
    public:
    typedef SetTorqueControlModeRequest Request;
    typedef SetTorqueControlModeResponse Response;
  };

}
#endif
