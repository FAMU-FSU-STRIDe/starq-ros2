// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from starq_interfaces:msg\ODriveConfig.idl
// generated code does not contain a copyright notice
#include "starq_interfaces/msg/detail/o_drive_config__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>


bool
starq_interfaces__msg__ODriveConfig__init(starq_interfaces__msg__ODriveConfig * msg)
{
  if (!msg) {
    return false;
  }
  // id
  // can_id
  // requested_state
  // control_mode
  // input_mode
  // velocity_limit
  // current_limit
  // trap_traj_velocity_limit
  // trap_traj_acceleration_limit
  // trap_traj_deceleration_limit
  // trap_traj_inertia
  // position_gain
  // velocity_gain
  // velocity_integrator_gain
  // gear_ratio
  return true;
}

void
starq_interfaces__msg__ODriveConfig__fini(starq_interfaces__msg__ODriveConfig * msg)
{
  if (!msg) {
    return;
  }
  // id
  // can_id
  // requested_state
  // control_mode
  // input_mode
  // velocity_limit
  // current_limit
  // trap_traj_velocity_limit
  // trap_traj_acceleration_limit
  // trap_traj_deceleration_limit
  // trap_traj_inertia
  // position_gain
  // velocity_gain
  // velocity_integrator_gain
  // gear_ratio
}

starq_interfaces__msg__ODriveConfig *
starq_interfaces__msg__ODriveConfig__create()
{
  starq_interfaces__msg__ODriveConfig * msg = (starq_interfaces__msg__ODriveConfig *)malloc(sizeof(starq_interfaces__msg__ODriveConfig));
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(starq_interfaces__msg__ODriveConfig));
  bool success = starq_interfaces__msg__ODriveConfig__init(msg);
  if (!success) {
    free(msg);
    return NULL;
  }
  return msg;
}

void
starq_interfaces__msg__ODriveConfig__destroy(starq_interfaces__msg__ODriveConfig * msg)
{
  if (msg) {
    starq_interfaces__msg__ODriveConfig__fini(msg);
  }
  free(msg);
}


bool
starq_interfaces__msg__ODriveConfig__Sequence__init(starq_interfaces__msg__ODriveConfig__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  starq_interfaces__msg__ODriveConfig * data = NULL;
  if (size) {
    data = (starq_interfaces__msg__ODriveConfig *)calloc(size, sizeof(starq_interfaces__msg__ODriveConfig));
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = starq_interfaces__msg__ODriveConfig__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        starq_interfaces__msg__ODriveConfig__fini(&data[i - 1]);
      }
      free(data);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
starq_interfaces__msg__ODriveConfig__Sequence__fini(starq_interfaces__msg__ODriveConfig__Sequence * array)
{
  if (!array) {
    return;
  }
  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      starq_interfaces__msg__ODriveConfig__fini(&array->data[i]);
    }
    free(array->data);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

starq_interfaces__msg__ODriveConfig__Sequence *
starq_interfaces__msg__ODriveConfig__Sequence__create(size_t size)
{
  starq_interfaces__msg__ODriveConfig__Sequence * array = (starq_interfaces__msg__ODriveConfig__Sequence *)malloc(sizeof(starq_interfaces__msg__ODriveConfig__Sequence));
  if (!array) {
    return NULL;
  }
  bool success = starq_interfaces__msg__ODriveConfig__Sequence__init(array, size);
  if (!success) {
    free(array);
    return NULL;
  }
  return array;
}

void
starq_interfaces__msg__ODriveConfig__Sequence__destroy(starq_interfaces__msg__ODriveConfig__Sequence * array)
{
  if (array) {
    starq_interfaces__msg__ODriveConfig__Sequence__fini(array);
  }
  free(array);
}
