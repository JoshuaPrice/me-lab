function [y,grad] = create_objective(x)

% Create y function
% x(1) = ws, x(2) = re, x(3) = pitch
w = [0.6638, -0.0310, -0.9340, -0.0003, -0.1609, 0.0114, ...
    6.6684e-04, 0.0022, -8.1073e-05, -5.8781e-07, -3.8868e-07, 6.5288e-07, ...
    6.5288e-07, 1.0083e-05, -1.1359e-06, 1.2822];
% w = load('weights', 'w')
ws = x(1);
ws2 = ws.^2;
re = x(2);
re2 = re.^2;
re3 = re.^3;
pitch = x(3);
pitch2 = pitch.^2;
bias = ones(size(ws));

y = w(1)*ws + w(2)*ws2 + w(3)*re + w(4)*re2 + w(5)*pitch + w(6)*pitch2 + ...
    w(7)*ws.*re + w(8)*ws.*pitch + w(9)*re.*pitch + w(10)*re3 + ...
    w(11)*re2.*ws + w(12)*re2.*pitch + w(13)*re.*ws2 + w(14)*re.*pitch2 + ...
    w(15)*re.*ws.*pitch + w(16)*bias ;

% calculate gradient g
if nargout > 1 % gradient required
    grad = [w(1) + 2*w(2)*ws + w(7)*re + w(8)*pitch + w(11)*re2 + 2*w(13)*re.*ws;
         w(3) + 2*w(4)*re + w(7)*ws + w(9)*pitch + 3*w(10)*re2 + 2*w(11)*re.*ws + ...
            2*w(12)*re.*pitch + w(13)*ws2 + w(14)*pitch2 + w(15)*ws*pitch;
         w(5) + 2*w(6)*pitch + w(8)*ws + w(9)*re + w(12)*re2 + 2*w(14)*re.*pitch + w(14)*re.*ws];
end