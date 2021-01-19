#ifndef _ROS_infrastructure_msgs_DoorSensors_h
#define _ROS_infrastructure_msgs_DoorSensors_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "ros/time.h"

namespace infrastructure_msgs
{

  class DoorSensors : public ros::Msg
  {
    public:
      typedef ros::Time _current_time_type;
      _current_time_type current_time;
      typedef float _tof_type;
      _tof_type tof;
      typedef int32_t _fsr1_type;
      _fsr1_type fsr1;
      typedef int32_t _fsr2_type;
      _fsr2_type fsr2;
      typedef int32_t _fsr3_type;
      _fsr3_type fsr3;
      typedef int32_t _fsr4_type;
      _fsr4_type fsr4;
      typedef int32_t _fsr5_type;
      _fsr5_type fsr5;
      typedef int32_t _fsr6_type;
      _fsr6_type fsr6;
      typedef int32_t _fsr7_type;
      _fsr7_type fsr7;
      typedef int32_t _fsr8_type;
      _fsr8_type fsr8;
      typedef int32_t _fsr9_type;
      _fsr9_type fsr9;
      typedef int32_t _fsr10_type;
      _fsr10_type fsr10;
      typedef int32_t _fsr11_type;
      _fsr11_type fsr11;
      typedef int32_t _fsr12_type;
      _fsr12_type fsr12;
      typedef int32_t _fsr_contact_1_type;
      _fsr_contact_1_type fsr_contact_1;
      typedef int32_t _fsr_contact_2_type;
      _fsr_contact_2_type fsr_contact_2;

    DoorSensors():
      current_time(),
      tof(0),
      fsr1(0),
      fsr2(0),
      fsr3(0),
      fsr4(0),
      fsr5(0),
      fsr6(0),
      fsr7(0),
      fsr8(0),
      fsr9(0),
      fsr10(0),
      fsr11(0),
      fsr12(0),
      fsr_contact_1(0),
      fsr_contact_2(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->current_time.sec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->current_time.sec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->current_time.sec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->current_time.sec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->current_time.sec);
      *(outbuffer + offset + 0) = (this->current_time.nsec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->current_time.nsec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->current_time.nsec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->current_time.nsec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->current_time.nsec);
      union {
        float real;
        uint32_t base;
      } u_tof;
      u_tof.real = this->tof;
      *(outbuffer + offset + 0) = (u_tof.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_tof.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_tof.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_tof.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->tof);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr1;
      u_fsr1.real = this->fsr1;
      *(outbuffer + offset + 0) = (u_fsr1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr1.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr1);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr2;
      u_fsr2.real = this->fsr2;
      *(outbuffer + offset + 0) = (u_fsr2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr2.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr2);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr3;
      u_fsr3.real = this->fsr3;
      *(outbuffer + offset + 0) = (u_fsr3.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr3.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr3.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr3.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr3);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr4;
      u_fsr4.real = this->fsr4;
      *(outbuffer + offset + 0) = (u_fsr4.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr4.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr4.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr4.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr4);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr5;
      u_fsr5.real = this->fsr5;
      *(outbuffer + offset + 0) = (u_fsr5.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr5.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr5.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr5.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr5);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr6;
      u_fsr6.real = this->fsr6;
      *(outbuffer + offset + 0) = (u_fsr6.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr6.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr6.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr6.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr6);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr7;
      u_fsr7.real = this->fsr7;
      *(outbuffer + offset + 0) = (u_fsr7.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr7.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr7.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr7.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr7);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr8;
      u_fsr8.real = this->fsr8;
      *(outbuffer + offset + 0) = (u_fsr8.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr8.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr8.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr8.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr8);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr9;
      u_fsr9.real = this->fsr9;
      *(outbuffer + offset + 0) = (u_fsr9.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr9.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr9.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr9.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr9);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr10;
      u_fsr10.real = this->fsr10;
      *(outbuffer + offset + 0) = (u_fsr10.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr10.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr10.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr10.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr10);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr11;
      u_fsr11.real = this->fsr11;
      *(outbuffer + offset + 0) = (u_fsr11.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr11.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr11.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr11.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr11);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr12;
      u_fsr12.real = this->fsr12;
      *(outbuffer + offset + 0) = (u_fsr12.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr12.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr12.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr12.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr12);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr_contact_1;
      u_fsr_contact_1.real = this->fsr_contact_1;
      *(outbuffer + offset + 0) = (u_fsr_contact_1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr_contact_1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr_contact_1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr_contact_1.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr_contact_1);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr_contact_2;
      u_fsr_contact_2.real = this->fsr_contact_2;
      *(outbuffer + offset + 0) = (u_fsr_contact_2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_fsr_contact_2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_fsr_contact_2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_fsr_contact_2.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->fsr_contact_2);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->current_time.sec =  ((uint32_t) (*(inbuffer + offset)));
      this->current_time.sec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->current_time.sec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->current_time.sec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->current_time.sec);
      this->current_time.nsec =  ((uint32_t) (*(inbuffer + offset)));
      this->current_time.nsec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->current_time.nsec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->current_time.nsec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->current_time.nsec);
      union {
        float real;
        uint32_t base;
      } u_tof;
      u_tof.base = 0;
      u_tof.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_tof.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_tof.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_tof.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->tof = u_tof.real;
      offset += sizeof(this->tof);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr1;
      u_fsr1.base = 0;
      u_fsr1.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr1.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr1.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr1.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr1 = u_fsr1.real;
      offset += sizeof(this->fsr1);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr2;
      u_fsr2.base = 0;
      u_fsr2.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr2.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr2.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr2.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr2 = u_fsr2.real;
      offset += sizeof(this->fsr2);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr3;
      u_fsr3.base = 0;
      u_fsr3.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr3.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr3.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr3.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr3 = u_fsr3.real;
      offset += sizeof(this->fsr3);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr4;
      u_fsr4.base = 0;
      u_fsr4.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr4.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr4.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr4.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr4 = u_fsr4.real;
      offset += sizeof(this->fsr4);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr5;
      u_fsr5.base = 0;
      u_fsr5.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr5.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr5.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr5.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr5 = u_fsr5.real;
      offset += sizeof(this->fsr5);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr6;
      u_fsr6.base = 0;
      u_fsr6.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr6.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr6.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr6.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr6 = u_fsr6.real;
      offset += sizeof(this->fsr6);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr7;
      u_fsr7.base = 0;
      u_fsr7.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr7.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr7.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr7.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr7 = u_fsr7.real;
      offset += sizeof(this->fsr7);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr8;
      u_fsr8.base = 0;
      u_fsr8.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr8.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr8.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr8.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr8 = u_fsr8.real;
      offset += sizeof(this->fsr8);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr9;
      u_fsr9.base = 0;
      u_fsr9.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr9.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr9.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr9.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr9 = u_fsr9.real;
      offset += sizeof(this->fsr9);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr10;
      u_fsr10.base = 0;
      u_fsr10.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr10.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr10.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr10.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr10 = u_fsr10.real;
      offset += sizeof(this->fsr10);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr11;
      u_fsr11.base = 0;
      u_fsr11.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr11.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr11.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr11.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr11 = u_fsr11.real;
      offset += sizeof(this->fsr11);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr12;
      u_fsr12.base = 0;
      u_fsr12.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr12.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr12.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr12.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr12 = u_fsr12.real;
      offset += sizeof(this->fsr12);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr_contact_1;
      u_fsr_contact_1.base = 0;
      u_fsr_contact_1.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr_contact_1.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr_contact_1.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr_contact_1.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr_contact_1 = u_fsr_contact_1.real;
      offset += sizeof(this->fsr_contact_1);
      union {
        int32_t real;
        uint32_t base;
      } u_fsr_contact_2;
      u_fsr_contact_2.base = 0;
      u_fsr_contact_2.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_fsr_contact_2.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_fsr_contact_2.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_fsr_contact_2.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->fsr_contact_2 = u_fsr_contact_2.real;
      offset += sizeof(this->fsr_contact_2);
     return offset;
    }

    virtual const char * getType() override { return "infrastructure_msgs/DoorSensors"; };
    virtual const char * getMD5() override { return "78d3070a7f6d7fc59eb47b90108edee6"; };

  };

}
#endif
