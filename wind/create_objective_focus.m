function [y,grad] = create_objective_focus(x)

% Create y function
% x(1) = ws, x(2) = re, x(3) = pitch

% rev -0.5
w = [-0.4255, 0.0147, -0.0287, 0.0001, 0.1404, -0.0003, ...
    0.0016, -0.0062, 0.0000, 1.9077];

% -0.5
% w = [-0.0992, 0.0147, 0.0005, 0.0000, 0.1462, -0.0003, ...
%     -0.0003, -0.0062, 0.0000, -1.1964];
 
% -0.2
% w = [-0.1142, 0.0069, -0.0003, 0.0000, 0.0870, -0.0037, ...
%     -0.0001, 0.0004, 0.0000, -0.4409];
 
% w = load('weights', 'w')
ws = x(1);
ws2 = ws.^2;
re = x(2);
re2 = re.^2;
pitch = x(3);
pitch2 = pitch.^2;
bias = ones(size(ws));

y = w(1)*ws + w(2)*ws2 + w(3)*re + w(4)*re2 + w(5)*pitch + w(6)*pitch2 + ...
    w(7)*ws.*re + w(8)*ws.*pitch + w(9)*re.*pitch + w(10)*bias;

% calculate gradient g
if nargout > 1 % gradient required
    grad = [w(1) + 2*w(2)*ws + w(7)*re + w(8)*pitch;
         w(3) + 2*w(4)*re + w(7)*ws + w(9)*pitch;
         w(5) + 2*w(6)*pitch + w(8)*ws + w(9)*re];
end