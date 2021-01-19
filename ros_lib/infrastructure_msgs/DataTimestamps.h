#ifndef _ROS_infrastructure_msgs_DataTimestamps_h
#define _ROS_infrastructure_msgs_DataTimestamps_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "ros/time.h"

namespace infrastructure_msgs
{

  class DataTimestamps : public ros::Msg
  {
    public:
      typedef int64_t _trial_number_type;
      _trial_number_type trial_number;
      typedef ros::Time _collection_start_time_type;
      _collection_start_time_type collection_start_time;
      typedef ros::Time _collection_end_time_type;
      _collection_end_time_type collection_end_time;
      typedef float _total_time_type;
      _total_time_type total_time;

    DataTimestamps():
      trial_number(0),
      collection_start_time(),
      collection_end_time(),
      total_time(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_trial_number;
      u_trial_number.real = this->trial_number;
      *(outbuffer + offset + 0) = (u_trial_number.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_trial_number.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_trial_number.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_trial_number.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_trial_number.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_trial_number.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_trial_number.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_trial_number.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->trial_number);
      *(outbuffer + offset + 0) = (this->collection_start_time.sec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->collection_start_time.sec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->collection_start_time.sec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->collection_start_time.sec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->collection_start_time.sec);
      *(outbuffer + offset + 0) = (this->collection_start_time.nsec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->collection_start_time.nsec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->collection_start_time.nsec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->collection_start_time.nsec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->collection_start_time.nsec);
      *(outbuffer + offset + 0) = (this->collection_end_time.sec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->collection_end_time.sec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->collection_end_time.sec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->collection_end_time.sec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->collection_end_time.sec);
      *(outbuffer + offset + 0) = (this->collection_end_time.nsec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->collection_end_time.nsec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->collection_end_time.nsec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->collection_end_time.nsec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->collection_end_time.nsec);
      offset += serializeAvrFloat64(outbuffer + offset, this->total_time);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int64_t real;
        uint64_t base;
      } u_trial_number;
      u_trial_number.base = 0;
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_trial_number.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->trial_number = u_trial_number.real;
      offset += sizeof(this->trial_number);
      this->collection_start_time.sec =  ((uint32_t) (*(inbuffer + offset)));
      this->collection_start_time.sec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->collection_start_time.sec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->collection_start_time.sec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->collection_start_time.sec);
      this->collection_start_time.nsec =  ((uint32_t) (*(inbuffer + offset)));
      this->collection_start_time.nsec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->collection_start_time.nsec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->collection_start_time.nsec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->collection_start_time.nsec);
      this->collection_end_time.sec =  ((uint32_t) (*(inbuffer + offset)));
      this->collection_end_time.sec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->collection_end_time.sec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->collection_end_time.sec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->collection_end_time.sec);
      this->collection_end_time.nsec =  ((uint32_t) (*(inbuffer + offset)));
      this->collection_end_time.nsec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->collection_end_time.nsec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->collection_end_time.nsec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->collection_end_time.nsec);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->total_time));
     return offset;
    }

    virtual const char * getType() override { return "infrastructure_msgs/DataTimestamps"; };
    virtual const char * getMD5() override { return "0b7790f826e3d5970b2ea5a3e61bdd36"; };

  };

}
#endif
