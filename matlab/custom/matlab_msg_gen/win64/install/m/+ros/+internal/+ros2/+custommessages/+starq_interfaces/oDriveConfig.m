function [data, info] = oDriveConfig
%ODriveConfig gives an empty data for starq_interfaces/ODriveConfig
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'starq_interfaces/ODriveConfig';
[data.id, info.id] = ros.internal.ros2.messages.ros2.default_type('uint8',1,0);
[data.can_id, info.can_id] = ros.internal.ros2.messages.ros2.default_type('uint8',1,0);
[data.requested_state, info.requested_state] = ros.internal.ros2.messages.ros2.default_type('uint32',1,0);
[data.control_mode, info.control_mode] = ros.internal.ros2.messages.ros2.default_type('uint32',1,0);
[data.input_mode, info.input_mode] = ros.internal.ros2.messages.ros2.default_type('uint32',1,0);
[data.velocity_limit, info.velocity_limit] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.current_limit, info.current_limit] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.trap_traj_velocity_limit, info.trap_traj_velocity_limit] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.trap_traj_acceleration_limit, info.trap_traj_acceleration_limit] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.trap_traj_deceleration_limit, info.trap_traj_deceleration_limit] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.trap_traj_inertia, info.trap_traj_inertia] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.position_gain, info.position_gain] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.velocity_gain, info.velocity_gain] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.velocity_integrator_gain, info.velocity_integrator_gain] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
[data.gear_ratio, info.gear_ratio] = ros.internal.ros2.messages.ros2.default_type('single',1,0);
info.MessageType = 'starq_interfaces/ODriveConfig';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,15);
info.MatPath{1} = 'id';
info.MatPath{2} = 'can_id';
info.MatPath{3} = 'requested_state';
info.MatPath{4} = 'control_mode';
info.MatPath{5} = 'input_mode';
info.MatPath{6} = 'velocity_limit';
info.MatPath{7} = 'current_limit';
info.MatPath{8} = 'trap_traj_velocity_limit';
info.MatPath{9} = 'trap_traj_acceleration_limit';
info.MatPath{10} = 'trap_traj_deceleration_limit';
info.MatPath{11} = 'trap_traj_inertia';
info.MatPath{12} = 'position_gain';
info.MatPath{13} = 'velocity_gain';
info.MatPath{14} = 'velocity_integrator_gain';
info.MatPath{15} = 'gear_ratio';