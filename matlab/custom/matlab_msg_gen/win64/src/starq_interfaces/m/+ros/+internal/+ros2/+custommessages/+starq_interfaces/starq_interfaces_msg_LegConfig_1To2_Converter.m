function ros2msg = starq_interfaces_msg_LegConfig_1To2_Converter(message,ros2msg)
%starq_interfaces_msg_LegConfig_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.id = message.Id;
ros2msg.kinematic_type = message.KinematicType;
end