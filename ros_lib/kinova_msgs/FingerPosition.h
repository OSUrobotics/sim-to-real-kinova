#ifndef _ROS_kinova_msgs_FingerPosition_h
#define _ROS_kinova_msgs_FingerPosition_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

  class FingerPosition : public ros::Msg
  {
    public:
      typedef float _finger1_type;
      _finger1_type finger1;
      typedef float _finger2_type;
      _finger2_type finger2;
      typedef float _finger3_type;
      _finger3_type finger3;

    FingerPosition():
      finger1(0),
      finger2(0),
      finger3(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_finger1;
      u_finger1.real = this->finger1;
      *(outbuffer + offset + 0) = (u_finger1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_finger1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_finger1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_finger1.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->finger1);
      union {
        float real;
        uint32_t base;
      } u_finger2;
      u_finger2.real = this->finger2;
      *(outbuffer + offset + 0) = (u_finger2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_finger2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_finger2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_finger2.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->finger2);
      union {
        float real;
        uint32_t base;
      } u_finger3;
      u_finger3.real = this->finger3;
      *(outbuffer + offset + 0) = (u_finger3.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_finger3.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_finger3.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_finger3.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->finger3);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_finger1;
      u_finger1.base = 0;
      u_finger1.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_finger1.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_finger1.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_finger1.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->finger1 = u_finger1.real;
      offset += sizeof(this->finger1);
      union {
        float real;
        uint32_t base;
      } u_finger2;
      u_finger2.base = 0;
      u_finger2.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_finger2.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_finger2.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_finger2.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->finger2 = u_finger2.real;
      offset += sizeof(this->finger2);
      union {
        float real;
        uint32_t base;
      } u_finger3;
      u_finger3.base = 0;
      u_finger3.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_finger3.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_finger3.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_finger3.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->finger3 = u_finger3.real;
      offset += sizeof(this->finger3);
     return offset;
    }

    virtual const char * getType() override { return "kinova_msgs/FingerPosition"; };
    virtual const char * getMD5() override { return "f56891e5dcd1900989f764a9b845c8e5"; };

  };

}
#endif
