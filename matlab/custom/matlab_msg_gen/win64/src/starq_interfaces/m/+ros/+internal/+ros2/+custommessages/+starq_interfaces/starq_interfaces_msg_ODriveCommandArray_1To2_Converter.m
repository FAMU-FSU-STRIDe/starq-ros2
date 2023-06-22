function ros2msg = starq_interfaces_msg_ODriveCommandArray_1To2_Converter(message,ros2msg)
%starq_interfaces_msg_ODriveCommandArray_1To2_Converter passes data of ROS message to ROS 2 message.
% Copyright 2019 The MathWorks, Inc.
ros2msg.commands.input_position = message.Commands.InputPosition;
ros2msg.commands.input_velocity = message.Commands.InputVelocity;
ros2msg.commands.input_torque = message.Commands.InputTorque;
end