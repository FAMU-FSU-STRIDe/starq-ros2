function [data, info] = configureMotorsRequest
%ConfigureMotors gives an empty data for starq_interfaces/ConfigureMotorsRequest
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'starq_interfaces/ConfigureMotorsRequest';
[data.configs, info.configs] = ros.internal.ros2.custommessages.starq_interfaces.oDriveConfig;
info.configs.MLdataType = 'struct';
info.configs.MaxLen = NaN;
info.configs.MinLen = 0;
info.MessageType = 'starq_interfaces/ConfigureMotorsRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,16);
info.MatPath{1} = 'configs';
info.MatPath{2} = 'configs.id';
info.MatPath{3} = 'configs.can_id';
info.MatPath{4} = 'configs.requested_state';
info.MatPath{5} = 'configs.control_mode';
info.MatPath{6} = 'configs.input_mode';
info.MatPath{7} = 'configs.velocity_limit';
info.MatPath{8} = 'configs.current_limit';
info.MatPath{9} = 'configs.trap_traj_velocity_limit';
info.MatPath{10} = 'configs.trap_traj_acceleration_limit';
info.MatPath{11} = 'configs.trap_traj_deceleration_limit';
info.MatPath{12} = 'configs.trap_traj_inertia';
info.MatPath{13} = 'configs.position_gain';
info.MatPath{14} = 'configs.velocity_gain';
info.MatPath{15} = 'configs.velocity_integrator_gain';
info.MatPath{16} = 'configs.gear_ratio';