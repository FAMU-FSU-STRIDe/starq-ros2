// generated from rosidl_typesupport_cpp/resource/idl__type_support.cpp.em
// with input from starq_interfaces:msg\ODriveInfo.idl
// generated code does not contain a copyright notice

#include "cstddef"
#include "rosidl_runtime_c/message_type_support_struct.h"
#include "starq_interfaces/msg/detail/o_drive_info__struct.hpp"
#include "rosidl_typesupport_cpp/identifier.hpp"
#include "rosidl_typesupport_cpp/message_type_support.hpp"
#include "rosidl_typesupport_c/type_support_map.h"
#include "rosidl_typesupport_cpp/message_type_support_dispatch.hpp"
#include "rosidl_typesupport_cpp/visibility_control.h"
#include "rosidl_typesupport_interface/macros.h"

namespace starq_interfaces
{

namespace msg
{

namespace rosidl_typesupport_cpp
{

typedef struct _ODriveInfo_type_support_ids_t
{
  const char * typesupport_identifier[2];
} _ODriveInfo_type_support_ids_t;

static const _ODriveInfo_type_support_ids_t _ODriveInfo_message_typesupport_ids = {
  {
    "rosidl_typesupport_fastrtps_cpp",  // ::rosidl_typesupport_fastrtps_cpp::typesupport_identifier,
    "rosidl_typesupport_introspection_cpp",  // ::rosidl_typesupport_introspection_cpp::typesupport_identifier,
  }
};

typedef struct _ODriveInfo_type_support_symbol_names_t
{
  const char * symbol_name[2];
} _ODriveInfo_type_support_symbol_names_t;

#define STRINGIFY_(s) #s
#define STRINGIFY(s) STRINGIFY_(s)

static const _ODriveInfo_type_support_symbol_names_t _ODriveInfo_message_typesupport_symbol_names = {
  {
    STRINGIFY(ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, starq_interfaces, msg, ODriveInfo)),
    STRINGIFY(ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_cpp, starq_interfaces, msg, ODriveInfo)),
  }
};

typedef struct _ODriveInfo_type_support_data_t
{
  void * data[2];
} _ODriveInfo_type_support_data_t;

static _ODriveInfo_type_support_data_t _ODriveInfo_message_typesupport_data = {
  {
    0,  // will store the shared library later
    0,  // will store the shared library later
  }
};

static const type_support_map_t _ODriveInfo_message_typesupport_map = {
  2,
  "starq_interfaces",
  &_ODriveInfo_message_typesupport_ids.typesupport_identifier[0],
  &_ODriveInfo_message_typesupport_symbol_names.symbol_name[0],
  &_ODriveInfo_message_typesupport_data.data[0],
};

static const rosidl_message_type_support_t ODriveInfo_message_type_support_handle = {
  ::rosidl_typesupport_cpp::typesupport_identifier,
  reinterpret_cast<const type_support_map_t *>(&_ODriveInfo_message_typesupport_map),
  ::rosidl_typesupport_cpp::get_message_typesupport_handle_function,
};

}  // namespace rosidl_typesupport_cpp

}  // namespace msg

}  // namespace starq_interfaces

namespace rosidl_typesupport_cpp
{

template<>
ROSIDL_TYPESUPPORT_CPP_PUBLIC
const rosidl_message_type_support_t *
get_message_type_support_handle<starq_interfaces::msg::ODriveInfo>()
{
  return &::starq_interfaces::msg::rosidl_typesupport_cpp::ODriveInfo_message_type_support_handle;
}

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_CPP_PUBLIC
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_cpp, starq_interfaces, msg, ODriveInfo)() {
  return get_message_type_support_handle<starq_interfaces::msg::ODriveInfo>();
}

#ifdef __cplusplus
}
#endif
}  // namespace rosidl_typesupport_cpp
