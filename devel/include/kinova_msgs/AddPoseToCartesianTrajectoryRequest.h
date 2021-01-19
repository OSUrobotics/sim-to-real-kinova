// Generated by gencpp from file kinova_msgs/AddPoseToCartesianTrajectoryRequest.msg
// DO NOT EDIT!


#ifndef KINOVA_MSGS_MESSAGE_ADDPOSETOCARTESIANTRAJECTORYREQUEST_H
#define KINOVA_MSGS_MESSAGE_ADDPOSETOCARTESIANTRAJECTORYREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace kinova_msgs
{
template <class ContainerAllocator>
struct AddPoseToCartesianTrajectoryRequest_
{
  typedef AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> Type;

  AddPoseToCartesianTrajectoryRequest_()
    : X(0.0)
    , Y(0.0)
    , Z(0.0)
    , ThetaX(0.0)
    , ThetaY(0.0)
    , ThetaZ(0.0)  {
    }
  AddPoseToCartesianTrajectoryRequest_(const ContainerAllocator& _alloc)
    : X(0.0)
    , Y(0.0)
    , Z(0.0)
    , ThetaX(0.0)
    , ThetaY(0.0)
    , ThetaZ(0.0)  {
  (void)_alloc;
    }



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





  typedef boost::shared_ptr< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddPoseToCartesianTrajectoryRequest_

typedef ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<std::allocator<void> > AddPoseToCartesianTrajectoryRequest;

typedef boost::shared_ptr< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest > AddPoseToCartesianTrajectoryRequestPtr;
typedef boost::shared_ptr< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest const> AddPoseToCartesianTrajectoryRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator1> & lhs, const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator2> & rhs)
{
  return lhs.X == rhs.X &&
    lhs.Y == rhs.Y &&
    lhs.Z == rhs.Z &&
    lhs.ThetaX == rhs.ThetaX &&
    lhs.ThetaY == rhs.ThetaY &&
    lhs.ThetaZ == rhs.ThetaZ;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator1> & lhs, const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace kinova_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e831d993faea563f6fe69d7db9b384c9";
  }

  static const char* value(const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe831d993faea563fULL;
  static const uint64_t static_value2 = 0x6fe69d7db9b384c9ULL;
};

template<class ContainerAllocator>
struct DataType< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "kinova_msgs/AddPoseToCartesianTrajectoryRequest";
  }

  static const char* value(const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 X\n"
"float32 Y\n"
"float32 Z\n"
"float32 ThetaX\n"
"float32 ThetaY\n"
"float32 ThetaZ\n"
;
  }

  static const char* value(const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.X);
      stream.next(m.Y);
      stream.next(m.Z);
      stream.next(m.ThetaX);
      stream.next(m.ThetaY);
      stream.next(m.ThetaZ);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AddPoseToCartesianTrajectoryRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::kinova_msgs::AddPoseToCartesianTrajectoryRequest_<ContainerAllocator>& v)
  {
    s << indent << "X: ";
    Printer<float>::stream(s, indent + "  ", v.X);
    s << indent << "Y: ";
    Printer<float>::stream(s, indent + "  ", v.Y);
    s << indent << "Z: ";
    Printer<float>::stream(s, indent + "  ", v.Z);
    s << indent << "ThetaX: ";
    Printer<float>::stream(s, indent + "  ", v.ThetaX);
    s << indent << "ThetaY: ";
    Printer<float>::stream(s, indent + "  ", v.ThetaY);
    s << indent << "ThetaZ: ";
    Printer<float>::stream(s, indent + "  ", v.ThetaZ);
  }
};

} // namespace message_operations
} // namespace ros

#endif // KINOVA_MSGS_MESSAGE_ADDPOSETOCARTESIANTRAJECTORYREQUEST_H
