% function [v,omega] = calculate_odometry(e_R,e_L,E_T,B,R_R,R_L,delta_t)
% This function should calculate the odometry information
% Inputs:
%           e_L(t):         1X1
%           e_R(t):         1X1
%           E_T:            1X1
%           B:              1X1
%           R_L:            1X1
%           R_R:            1X1
%           delta_t:        1X1
% Outputs:
%           v(t):           1X1
%           omega(t):       1X1
function [v,omega] = calculate_odometry(e_R,e_L,E_T,B,R_R,R_L,delta_t)
if ~delta_t
    v = 0;
    omega = 0;
    return;
end
% FILL IN HERE

  % Angular velocity of the right wheel
  omega_R = 2 * pi * e_R / (E_T * delta_t);

  % Angular velocity of the left wheel
  omega_L = 2 * pi * e_L / (E_T * delta_t);

  % Angular velocity of the robot
  omega = (omega_R * R_R - omega_L * R_L) / B;

  % Translational velocity of the robot
  v = (omega_R * R_R + omega_L * R_L) / 2;

end
