% function h = observation_model(S,W,j)
% This function is the implementation of the observation model
% The bearing should lie in the interval [-pi,pi)
% Inputs:
%           S           4XM
%           W           2XN
%           j           1X1
% Outputs:
%           h           2XM
function h = observation_model(S,W,j)
% FILL IN HERE

  a = sqrt( (W(1,j) - S(1,:)).^2 + (W(2,j) - S(2,:)).^2);

  b = atan2(W(2,j) - S(2,:), W(1,j) - S(1,:)) - S(3,:);

  % Make sure -pi <= b <= pi
  ang = mod(b + pi, 2 * pi) - pi;

  % The final observation model
  h = [a; ang];
end
