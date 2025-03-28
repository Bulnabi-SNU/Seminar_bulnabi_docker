// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from px4_msgs:msg/MessageFormatResponse.idl
// generated code does not contain a copyright notice

#ifndef PX4_MSGS__MSG__DETAIL__MESSAGE_FORMAT_RESPONSE__STRUCT_H_
#define PX4_MSGS__MSG__DETAIL__MESSAGE_FORMAT_RESPONSE__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Struct defined in msg/MessageFormatResponse in the package px4_msgs.
typedef struct px4_msgs__msg__MessageFormatResponse
{
  uint64_t timestamp;
  uint16_t protocol_version;
  uint8_t topic_name[50];
  bool success;
  uint32_t message_hash;
} px4_msgs__msg__MessageFormatResponse;

// Struct for a sequence of px4_msgs__msg__MessageFormatResponse.
typedef struct px4_msgs__msg__MessageFormatResponse__Sequence
{
  px4_msgs__msg__MessageFormatResponse * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} px4_msgs__msg__MessageFormatResponse__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // PX4_MSGS__MSG__DETAIL__MESSAGE_FORMAT_RESPONSE__STRUCT_H_
