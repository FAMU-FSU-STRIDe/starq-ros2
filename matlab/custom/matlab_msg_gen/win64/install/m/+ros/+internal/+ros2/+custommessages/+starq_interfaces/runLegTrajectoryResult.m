function [data, info] = runLegTrajectoryResult
%RunLegTrajectoryResult gives an empty data for starq_interfaces/RunLegTrajectoryResult
% Copyright 2019-2021 The MathWorks, Inc.
data = struct();
data.MessageType = 'starq_interfaces/RunLegTrajectoryResult';
[data.leg_infos, info.leg_infos] = ros.internal.ros2.custommessages.starq_interfaces.legInfoArray;
info.leg_infos.MLdataType = 'struct';
info.leg_infos.MaxLen = NaN;
info.leg_infos.MinLen = 0;
[data.motor_infos, info.motor_infos] = ros.internal.ros2.custommessages.starq_interfaces.oDriveInfoArray;
info.motor_infos.MLdataType = 'struct';
info.motor_infos.MaxLen = NaN;
info.motor_infos.MinLen = 0;
info.MessageType = 'starq_interfaces/RunLegTrajectoryResult';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,21);
info.MatPath{1} = 'leg_infos';
info.MatPath{2} = 'leg_infos.infos';
info.MatPath{3} = 'leg_infos.infos.pos_estimate';
info.MatPath{4} = 'leg_infos.infos.vel_estimate';
info.MatPath{5} = 'leg_infos.infos.acc_estimate';
info.MatPath{6} = 'motor_infos';
info.MatPath{7} = 'motor_infos.infos';
info.MatPath{8} = 'motor_infos.infos.state';
info.MatPath{9} = 'motor_infos.infos.fault';
info.MatPath{10} = 'motor_infos.infos.pos_estimate';
info.MatPath{11} = 'motor_infos.infos.vel_estimate';
info.MatPath{12} = 'motor_infos.infos.torque_estimate';
info.MatPath{13} = 'motor_infos.infos.torque_target';
info.MatPath{14} = 'motor_infos.infos.iq_setpoint';
info.MatPath{15} = 'motor_infos.infos.iq_measured';
info.MatPath{16} = 'motor_infos.infos.motor_temperature';
info.MatPath{17} = 'motor_infos.infos.bus_voltage';
info.MatPath{18} = 'motor_infos.infos.bus_current';
info.MatPath{19} = 'motor_infos.infos.pos_error';
info.MatPath{20} = 'motor_infos.infos.vel_error';
info.MatPath{21} = 'motor_infos.infos.torque_error';