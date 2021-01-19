#ifndef _ROS_kinova_msgs_PoseVelocity_h
#define _ROS_kinova_msgs_PoseVelocity_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

  class PoseVelocity : public ros::Msg
  {
    public:
      typedef float _twist_linear_x_type;
      _twist_linear_x_type twist_linear_x;
      typedef float _twist_linear_y_type;
      _twist_linear_y_type twist_linear_y;
      typedef float _twist_linear_z_type;
      _twist_linear_z_type twist_linear_z;
      typedef float _twist_angular_x_type;
      _twist_angular_x_type twist_angular_x;
      typedef float _twist_angular_y_type;
      _twist_angular_y_type twist_angular_y;
      typedef float _twist_angular_z_type;
      _twist_angular_z_type twist_angular_z;

    PoseVelocity():
      twist_linear_x(0),
      twist_linear_y(0),
      twist_linear_z(0),
      twist_angular_x(0),
      twist_angular_y(0),
      twist_angular_z(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_twist_linear_x;
      u_twist_linear_x.real = this->twist_linear_x;
      *(outbuffer + offset + 0) = (u_twist_linear_x.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_linear_x.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_linear_x.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_linear_x.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_linear_x);
      union {
        float real;
        uint32_t base;
      } u_twist_linear_y;
      u_twist_linear_y.real = this->twist_linear_y;
      *(outbuffer + offset + 0) = (u_twist_linear_y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_linear_y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_linear_y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_linear_y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_linear_y);
      union {
        float real;
        uint32_t base;
      } u_twist_linear_z;
      u_twist_linear_z.real = this->twist_linear_z;
      *(outbuffer + offset + 0) = (u_twist_linear_z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_linear_z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_linear_z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_linear_z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_linear_z);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_x;
      u_twist_angular_x.real = this->twist_angular_x;
      *(outbuffer + offset + 0) = (u_twist_angular_x.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_angular_x.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_angular_x.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_angular_x.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_angular_x);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_y;
      u_twist_angular_y.real = this->twist_angular_y;
      *(outbuffer + offset + 0) = (u_twist_angular_y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_angular_y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_angular_y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_angular_y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_angular_y);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_z;
      u_twist_angular_z.real = this->twist_angular_z;
      *(outbuffer + offset + 0) = (u_twist_angular_z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_twist_angular_z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_twist_angular_z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_twist_angular_z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->twist_angular_z);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_twist_linear_x;
      u_twist_linear_x.base = 0;
      u_twist_linear_x.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_linear_x.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_linear_x.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_linear_x.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_linear_x = u_twist_linear_x.real;
      offset += sizeof(this->twist_linear_x);
      union {
        float real;
        uint32_t base;
      } u_twist_linear_y;
      u_twist_linear_y.base = 0;
      u_twist_linear_y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_linear_y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_linear_y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_linear_y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_linear_y = u_twist_linear_y.real;
      offset += sizeof(this->twist_linear_y);
      union {
        float real;
        uint32_t base;
      } u_twist_linear_z;
      u_twist_linear_z.base = 0;
      u_twist_linear_z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_linear_z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_linear_z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_linear_z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_linear_z = u_twist_linear_z.real;
      offset += sizeof(this->twist_linear_z);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_x;
      u_twist_angular_x.base = 0;
      u_twist_angular_x.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_angular_x.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_angular_x.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_angular_x.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_angular_x = u_twist_angular_x.real;
      offset += sizeof(this->twist_angular_x);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_y;
      u_twist_angular_y.base = 0;
      u_twist_angular_y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_angular_y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_angular_y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_angular_y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_angular_y = u_twist_angular_y.real;
      offset += sizeof(this->twist_angular_y);
      union {
        float real;
        uint32_t base;
      } u_twist_angular_z;
      u_twist_angular_z.base = 0;
      u_twist_angular_z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_twist_angular_z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_twist_angular_z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_twist_angular_z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->twist_angular_z = u_twist_angular_z.real;
      offset += sizeof(this->twist_angular_z);
     return offset;
    }

    virtual const char * getType() override { return "kinova_msgs/PoseVelocity"; };
    virtual const char * getMD5() override { return "37cb696ff239fbcc6aa4a04f7318d9da"; };

  };

}
#endif
