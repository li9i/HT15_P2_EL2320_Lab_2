% function S = multinomial_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = multinomial_resample(S_bar)
% FILL IN HERE

  % The number of particles M
  M = size(S_bar, 2);

  % The cumulative distribution of weights
  cdf = cumsum(S_bar(4,:));

  % Pre-allocate S
  S = zeros(4,M);

  for m = 1:M

    % Generate a random number in [0,1]
    r_m = rand;

    % Locate the first element in cdf that satisfies arg min j CDF (j) >= r_m
    i = find(cdf >= r_m, 1, 'first');

    % Needed. In the beginning i is empty
    if ~isempty(i)
      S(:,m) = S_bar(:,i);
    end
    %size(S_bar(:,i))

    % Initialize the new particle's weight
    S(4,m) = 1 / M;
  end

end
