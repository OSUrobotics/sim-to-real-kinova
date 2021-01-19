#ifndef _ROS_kinova_msgs_JointVelocity_h
#define _ROS_kinova_msgs_JointVelocity_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

  class JointVelocity : public ros::Msg
  {
    public:
      typedef float _joint1_type;
      _joint1_type joint1;
      typedef float _joint2_type;
      _joint2_type joint2;
      typedef float _joint3_type;
      _joint3_type joint3;
      typedef float _joint4_type;
      _joint4_type joint4;
      typedef float _joint5_type;
      _joint5_type joint5;
      typedef float _joint6_type;
      _joint6_type joint6;
      typedef float _joint7_type;
      _joint7_type joint7;

    JointVelocity():
      joint1(0),
      joint2(0),
      joint3(0),
      joint4(0),
      joint5(0),
      joint6(0),
      joint7(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_joint1;
      u_joint1.real = this->joint1;
      *(outbuffer + offset + 0) = (u_joint1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint1.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint1);
      union {
        float real;
        uint32_t base;
      } u_joint2;
      u_joint2.real = this->joint2;
      *(outbuffer + offset + 0) = (u_joint2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint2.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint2);
      union {
        float real;
        uint32_t base;
      } u_joint3;
      u_joint3.real = this->joint3;
      *(outbuffer + offset + 0) = (u_joint3.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint3.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint3.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint3.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint3);
      union {
        float real;
        uint32_t base;
      } u_joint4;
      u_joint4.real = this->joint4;
      *(outbuffer + offset + 0) = (u_joint4.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint4.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint4.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint4.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint4);
      union {
        float real;
        uint32_t base;
      } u_joint5;
      u_joint5.real = this->joint5;
      *(outbuffer + offset + 0) = (u_joint5.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint5.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint5.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint5.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint5);
      union {
        float real;
        uint32_t base;
      } u_joint6;
      u_joint6.real = this->joint6;
      *(outbuffer + offset + 0) = (u_joint6.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint6.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint6.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint6.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint6);
      union {
        float real;
        uint32_t base;
      } u_joint7;
      u_joint7.real = this->joint7;
      *(outbuffer + offset + 0) = (u_joint7.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_joint7.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_joint7.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_joint7.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->joint7);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_joint1;
      u_joint1.base = 0;
      u_joint1.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint1.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint1.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint1.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint1 = u_joint1.real;
      offset += sizeof(this->joint1);
      union {
        float real;
        uint32_t base;
      } u_joint2;
      u_joint2.base = 0;
      u_joint2.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint2.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint2.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint2.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint2 = u_joint2.real;
      offset += sizeof(this->joint2);
      union {
        float real;
        uint32_t base;
      } u_joint3;
      u_joint3.base = 0;
      u_joint3.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint3.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint3.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint3.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint3 = u_joint3.real;
      offset += sizeof(this->joint3);
      union {
        float real;
        uint32_t base;
      } u_joint4;
      u_joint4.base = 0;
      u_joint4.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint4.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint4.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint4.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint4 = u_joint4.real;
      offset += sizeof(this->joint4);
      union {
        float real;
        uint32_t base;
      } u_joint5;
      u_joint5.base = 0;
      u_joint5.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint5.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint5.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint5.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint5 = u_joint5.real;
      offset += sizeof(this->joint5);
      union {
        float real;
        uint32_t base;
      } u_joint6;
      u_joint6.base = 0;
      u_joint6.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint6.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint6.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint6.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint6 = u_joint6.real;
      offset += sizeof(this->joint6);
      union {
        float real;
        uint32_t base;
      } u_joint7;
      u_joint7.base = 0;
      u_joint7.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_joint7.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_joint7.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_joint7.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->joint7 = u_joint7.real;
      offset += sizeof(this->joint7);
     return offset;
    }

    virtual const char * getType() override { return "kinova_msgs/JointVelocity"; };
    virtual const char * getMD5() override { return "bf16c4e5154848a0767d1aaab0a4796b"; };

  };

}
#endif
