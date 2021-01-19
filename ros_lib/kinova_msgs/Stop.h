#ifndef _ROS_SERVICE_Stop_h
#define _ROS_SERVICE_Stop_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

static const char STOP[] = "kinova_msgs/Stop";

  class StopRequest : public ros::Msg
  {
    public:

    StopRequest()
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

    virtual const char * getType() override { return STOP; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class StopResponse : public ros::Msg
  {
    public:
      typedef const char* _stop_result_type;
      _stop_result_type stop_result;

    StopResponse():
      stop_result("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      uint32_t length_stop_result = strlen(this->stop_result);
      varToArr(outbuffer + offset, length_stop_result);
      offset += 4;
      memcpy(outbuffer + offset, this->stop_result, length_stop_result);
      offset += length_stop_result;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      uint32_t length_stop_result;
      arrToVar(length_stop_result, (inbuffer + offset));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_stop_result; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_stop_result-1]=0;
      this->stop_result = (char *)(inbuffer + offset-1);
      offset += length_stop_result;
     return offset;
    }

    virtual const char * getType() override { return STOP; };
    virtual const char * getMD5() override { return "585dc4164508d473dff8f8b67a05d2ad"; };

  };

  class Stop {
    public:
    typedef StopRequest Request;
    typedef StopResponse Response;
  };

}
#endif
