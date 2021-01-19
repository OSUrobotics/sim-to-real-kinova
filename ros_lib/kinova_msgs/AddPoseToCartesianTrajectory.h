#ifndef _ROS_SERVICE_AddPoseToCartesianTrajectory_h
#define _ROS_SERVICE_AddPoseToCartesianTrajectory_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace kinova_msgs
{

static const char ADDPOSETOCARTESIANTRAJECTORY[] = "kinova_msgs/AddPoseToCartesianTrajectory";

  class AddPoseToCartesianTrajectoryRequest : public ros::Msg
  {
    public:
      typedef float _X_type;
      _X_type X;
      typedef float _Y_type;
      _Y_type Y;
      typedef float _Z_type;
      _Z_type Z;
      typedef float _ThetaX_type;
      _ThetaX_type ThetaX;
      typedef float _ThetaY_type;
      _ThetaY_type ThetaY;
      typedef float _ThetaZ_type;
      _ThetaZ_type ThetaZ;

    AddPoseToCartesianTrajectoryRequest():
      X(0),
      Y(0),
      Z(0),
      ThetaX(0),
      ThetaY(0),
      ThetaZ(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_X;
      u_X.real = this->X;
      *(outbuffer + offset + 0) = (u_X.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_X.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_X.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_X.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->X);
      union {
        float real;
        uint32_t base;
      } u_Y;
      u_Y.real = this->Y;
      *(outbuffer + offset + 0) = (u_Y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Y);
      union {
        float real;
        uint32_t base;
      } u_Z;
      u_Z.real = this->Z;
      *(outbuffer + offset + 0) = (u_Z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Z);
      union {
        float real;
        uint32_t base;
      } u_ThetaX;
      u_ThetaX.real = this->ThetaX;
      *(outbuffer + offset + 0) = (u_ThetaX.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ThetaX.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ThetaX.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ThetaX.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ThetaX);
      union {
        float real;
        uint32_t base;
      } u_ThetaY;
      u_ThetaY.real = this->ThetaY;
      *(outbuffer + offset + 0) = (u_ThetaY.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ThetaY.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ThetaY.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ThetaY.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ThetaY);
      union {
        float real;
        uint32_t base;
      } u_ThetaZ;
      u_ThetaZ.real = this->ThetaZ;
      *(outbuffer + offset + 0) = (u_ThetaZ.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ThetaZ.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ThetaZ.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ThetaZ.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ThetaZ);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_X;
      u_X.base = 0;
      u_X.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_X.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_X.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_X.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->X = u_X.real;
      offset += sizeof(this->X);
      union {
        float real;
        uint32_t base;
      } u_Y;
      u_Y.base = 0;
      u_Y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Y = u_Y.real;
      offset += sizeof(this->Y);
      union {
        float real;
        uint32_t base;
      } u_Z;
      u_Z.base = 0;
      u_Z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Z = u_Z.real;
      offset += sizeof(this->Z);
      union {
        float real;
        uint32_t base;
      } u_ThetaX;
      u_ThetaX.base = 0;
      u_ThetaX.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ThetaX.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ThetaX.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ThetaX.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ThetaX = u_ThetaX.real;
      offset += sizeof(this->ThetaX);
      union {
        float real;
        uint32_t base;
      } u_ThetaY;
      u_ThetaY.base = 0;
      u_ThetaY.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ThetaY.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ThetaY.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ThetaY.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ThetaY = u_ThetaY.real;
      offset += sizeof(this->ThetaY);
      union {
        float real;
        uint32_t base;
      } u_ThetaZ;
      u_ThetaZ.base = 0;
      u_ThetaZ.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ThetaZ.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ThetaZ.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ThetaZ.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ThetaZ = u_ThetaZ.real;
      offset += sizeof(this->ThetaZ);
     return offset;
    }

    virtual const char * getType() override { return ADDPOSETOCARTESIANTRAJECTORY; };
    virtual const char * getMD5() override { return "e831d993faea563f6fe69d7db9b384c9"; };

  };

  class AddPoseToCartesianTrajectoryResponse : public ros::Msg
  {
    public:

    AddPoseToCartesianTrajectoryResponse()
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

    virtual const char * getType() override { return ADDPOSETOCARTESIANTRAJECTORY; };
    virtual const char * getMD5() override { return "d41d8cd98f00b204e9800998ecf8427e"; };

  };

  class AddPoseToCartesianTrajectory {
    public:
    typedef AddPoseToCartesianTrajectoryRequest Request;
    typedef AddPoseToCartesianTrajectoryResponse Response;
  };

}
#endif
