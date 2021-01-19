#ifndef _ROS_kinova_msgs_CartesianForce_h
#define _ROS_kinova_msgs_CartesianForce_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

  class CartesianForce : public ros::Msg
  {
    public:
      typedef float _force_x_type;
      _force_x_type force_x;
      typedef float _force_y_type;
      _force_y_type force_y;
      typedef float _force_z_type;
      _force_z_type force_z;
      typedef float _torque_x_type;
      _torque_x_type torque_x;
      typedef float _torque_y_type;
      _torque_y_type torque_y;
      typedef float _torque_z_type;
      _torque_z_type torque_z;

    CartesianForce():
      force_x(0),
      force_y(0),
      force_z(0),
      torque_x(0),
      torque_y(0),
      torque_z(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_force_x;
      u_force_x.real = this->force_x;
      *(outbuffer + offset + 0) = (u_force_x.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_force_x.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_force_x.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_force_x.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->force_x);
      union {
        float real;
        uint32_t base;
      } u_force_y;
      u_force_y.real = this->force_y;
      *(outbuffer + offset + 0) = (u_force_y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_force_y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_force_y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_force_y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->force_y);
      union {
        float real;
        uint32_t base;
      } u_force_z;
      u_force_z.real = this->force_z;
      *(outbuffer + offset + 0) = (u_force_z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_force_z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_force_z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_force_z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->force_z);
      union {
        float real;
        uint32_t base;
      } u_torque_x;
      u_torque_x.real = this->torque_x;
      *(outbuffer + offset + 0) = (u_torque_x.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_torque_x.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_torque_x.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_torque_x.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->torque_x);
      union {
        float real;
        uint32_t base;
      } u_torque_y;
      u_torque_y.real = this->torque_y;
      *(outbuffer + offset + 0) = (u_torque_y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_torque_y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_torque_y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_torque_y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->torque_y);
      union {
        float real;
        uint32_t base;
      } u_torque_z;
      u_torque_z.real = this->torque_z;
      *(outbuffer + offset + 0) = (u_torque_z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_torque_z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_torque_z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_torque_z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->torque_z);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_force_x;
      u_force_x.base = 0;
      u_force_x.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_force_x.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_force_x.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_force_x.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->force_x = u_force_x.real;
      offset += sizeof(this->force_x);
      union {
        float real;
        uint32_t base;
      } u_force_y;
      u_force_y.base = 0;
      u_force_y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_force_y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_force_y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_force_y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->force_y = u_force_y.real;
      offset += sizeof(this->force_y);
      union {
        float real;
        uint32_t base;
      } u_force_z;
      u_force_z.base = 0;
      u_force_z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_force_z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_force_z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_force_z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->force_z = u_force_z.real;
      offset += sizeof(this->force_z);
      union {
        float real;
        uint32_t base;
      } u_torque_x;
      u_torque_x.base = 0;
      u_torque_x.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_torque_x.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_torque_x.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_torque_x.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->torque_x = u_torque_x.real;
      offset += sizeof(this->torque_x);
      union {
        float real;
        uint32_t base;
      } u_torque_y;
      u_torque_y.base = 0;
      u_torque_y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_torque_y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_torque_y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_torque_y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->torque_y = u_torque_y.real;
      offset += sizeof(this->torque_y);
      union {
        float real;
        uint32_t base;
      } u_torque_z;
      u_torque_z.base = 0;
      u_torque_z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_torque_z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_torque_z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_torque_z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->torque_z = u_torque_z.real;
      offset += sizeof(this->torque_z);
     return offset;
    }

    virtual const char * getType() override { return "kinova_msgs/CartesianForce"; };
    virtual const char * getMD5() override { return "b01974557c40b776cdb7003057779989"; };

  };

}
#endif
