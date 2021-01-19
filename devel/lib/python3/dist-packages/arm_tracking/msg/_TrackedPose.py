# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from arm_tracking/TrackedPose.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class TrackedPose(genpy.Message):
  _md5sum = "339ac58acc7c50a83fc20359186dc24d"
  _type = "arm_tracking/TrackedPose"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float64[] robot_base_rvec
float64[] robot_base_tvec
float64[] robot_ef_rvec
float64[] robot_ef_tvec
float64[] workpiece_rvec
float64[] workpiece_tvec
#workpiece marker corner x coordinates
float64[] workpiece_corners_x 
#workpiece marker corner y coordinates
float64[] workpiece_corners_y 

#robot ef marker corner x coordinates
float64[] robot_ef_corners_x 
#robot ef marker corner y coordinates
float64[] robot_ef_corners_y 
"""
  __slots__ = ['robot_base_rvec','robot_base_tvec','robot_ef_rvec','robot_ef_tvec','workpiece_rvec','workpiece_tvec','workpiece_corners_x','workpiece_corners_y','robot_ef_corners_x','robot_ef_corners_y']
  _slot_types = ['float64[]','float64[]','float64[]','float64[]','float64[]','float64[]','float64[]','float64[]','float64[]','float64[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       robot_base_rvec,robot_base_tvec,robot_ef_rvec,robot_ef_tvec,workpiece_rvec,workpiece_tvec,workpiece_corners_x,workpiece_corners_y,robot_ef_corners_x,robot_ef_corners_y

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(TrackedPose, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.robot_base_rvec is None:
        self.robot_base_rvec = []
      if self.robot_base_tvec is None:
        self.robot_base_tvec = []
      if self.robot_ef_rvec is None:
        self.robot_ef_rvec = []
      if self.robot_ef_tvec is None:
        self.robot_ef_tvec = []
      if self.workpiece_rvec is None:
        self.workpiece_rvec = []
      if self.workpiece_tvec is None:
        self.workpiece_tvec = []
      if self.workpiece_corners_x is None:
        self.workpiece_corners_x = []
      if self.workpiece_corners_y is None:
        self.workpiece_corners_y = []
      if self.robot_ef_corners_x is None:
        self.robot_ef_corners_x = []
      if self.robot_ef_corners_y is None:
        self.robot_ef_corners_y = []
    else:
      self.robot_base_rvec = []
      self.robot_base_tvec = []
      self.robot_ef_rvec = []
      self.robot_ef_tvec = []
      self.workpiece_rvec = []
      self.workpiece_tvec = []
      self.workpiece_corners_x = []
      self.workpiece_corners_y = []
      self.robot_ef_corners_x = []
      self.robot_ef_corners_y = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.robot_base_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_base_rvec))
      length = len(self.robot_base_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_base_tvec))
      length = len(self.robot_ef_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_ef_rvec))
      length = len(self.robot_ef_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_ef_tvec))
      length = len(self.workpiece_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.workpiece_rvec))
      length = len(self.workpiece_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.workpiece_tvec))
      length = len(self.workpiece_corners_x)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.workpiece_corners_x))
      length = len(self.workpiece_corners_y)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.workpiece_corners_y))
      length = len(self.robot_ef_corners_x)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_ef_corners_x))
      length = len(self.robot_ef_corners_y)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.Struct(pattern).pack(*self.robot_ef_corners_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_base_rvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_base_tvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_rvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_tvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_rvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_tvec = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_corners_x = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_corners_y = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_corners_x = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_corners_y = s.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.robot_base_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_base_rvec.tostring())
      length = len(self.robot_base_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_base_tvec.tostring())
      length = len(self.robot_ef_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_ef_rvec.tostring())
      length = len(self.robot_ef_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_ef_tvec.tostring())
      length = len(self.workpiece_rvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.workpiece_rvec.tostring())
      length = len(self.workpiece_tvec)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.workpiece_tvec.tostring())
      length = len(self.workpiece_corners_x)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.workpiece_corners_x.tostring())
      length = len(self.workpiece_corners_y)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.workpiece_corners_y.tostring())
      length = len(self.robot_ef_corners_x)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_ef_corners_x.tostring())
      length = len(self.robot_ef_corners_y)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.robot_ef_corners_y.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_base_rvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_base_tvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_rvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_tvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_rvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_tvec = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_corners_x = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.workpiece_corners_y = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_corners_x = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.robot_ef_corners_y = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I