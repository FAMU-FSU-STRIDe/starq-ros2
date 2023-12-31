clc
clear
close all

%% RR Leg

L1 = 50;
L2 = 150;

syms x y t1 t2

eq(1) = x == L1*cos(t1) + L2*cos(t1+t2);
eq(2) = y == L1*sin(t1) + L2*sin(t1+t2);

s = solve(eq, [t1 t2]);

theta1 = @(nx,ny) double(subs(s.t1(1), [x;y], [nx;ny]));
theta2 = @(nx,ny) double(subs(s.t2(1), [x;y], [nx;ny]));

%% Leg Trajectory

N = 500;
period = 5; % s

X = [linspace(80, -80, 3*N/4), linspace(-80, 80, N/4)];
Y = [-175*ones(1,3*N/4), -175+50*sin(linspace(0, pi, N/4))];

figure
plot(X,Y)

%% Gait

leg1 = [X;Y];
leg2 = [X(N/4+1:end), X(1:N/4); Y(N/4+1:end), Y(1:N/4)];
leg3 = [X(2*N/4+1:end), X(1:2*N/4); Y(2*N/4+1:end), Y(1:2*N/4)];
leg4 = [X(3*N/4+1:end), X(1:3*N/4); Y(3*N/4+1:end), Y(1:3*N/4)];

figure
hold on
plot(leg1(2,:))
plot(leg2(2,:))
plot(leg3(2,:))
plot(leg4(2,:))

%% Motor Space

trajectory = zeros(8,N,4);
for t = 1:N
    trajectory(1,t,1) = theta1(leg1(1,t), leg1(2,t));
    trajectory(2,t,1) = theta2(leg1(1,t), leg1(2,t));
    trajectory(3,t,1) = theta1(leg2(1,t), leg2(2,t));
    trajectory(4,t,1) = theta2(leg2(1,t), leg2(2,t));
    trajectory(5,t,1) = theta1(leg3(1,t), leg3(2,t));
    trajectory(6,t,1) = theta2(leg3(1,t), leg3(2,t));
    trajectory(7,t,1) = theta1(leg4(1,t), leg4(2,t));
    trajectory(8,t,1) = theta2(leg4(1,t), leg4(2,t));
end

%% Names

leg1_name = 'leg_fr';
leg2_name = 'leg_hr';
leg3_name = 'leg_fl';
leg4_name = 'leg_hl';

names = {
  strcat(leg1_name, '_hip_joint'), ...
  strcat(leg1_name, '_leg_link_joint'), ...
  strcat(leg2_name, '_hip_joint'), ...
  strcat(leg2_name, '_leg_link_joint'), ...
  strcat(leg3_name, '_hip_joint'), ...
  strcat(leg3_name, '_leg_link_joint'), ...
  strcat(leg4_name, '_hip_joint'), ...
  strcat(leg4_name, '_leg_link_joint'), ...
};

%% ROS Message

trajectoryMsg = matrixToJointTrajectory(trajectory, names, N/period);

node = ros2node("starq_gazebo");
trajectoryPub = ros2publisher(node, "/joint_trajectory_controller/joint_trajectory", "trajectory_msgs/JointTrajectory");
send(trajectoryPub, trajectoryMsg);