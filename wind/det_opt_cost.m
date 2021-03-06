% Column names:
% A,1: Time, 
% B,2: Fan Speed [RPM], 
% C,3: Fan Speed StDev [RPM], 
% D,4: Press. Transducer [V], 
% E,5: Press. Trans. StDev [V], 
% F,6: DC Rectified Generator Voltage [V], 
% G: Voltage StDev [V], 
% H: Ignore [-], 
% I: Ignore [-], 
% J: Rotor Speed [RPM], 
% K: Strain Gage [V], 
% L: Strain Gage StDev [V],  
% M, 13: set wind speed [m/s]
% N, 14: set rheostat value [1/ohm]
% O, 15: pitch angle
% P, 16: current

% Anonymous function to calculate wind velocity from transducer voltage
wvel = @(V) 24.5*sqrt(V) - 0.57; % m/s

% Anonymous function to calculate wind velocity from transducer voltage
wforce = @(V) 4.274*V; % N

% Anonymous function to calculate resistance from rheostat val
res = @(rheo) -0.1975*rheo + 198; % ohm

datamat = make_datamat_opt();

% Extracting columns from files
volt_gen = datamat(:,6);
raw_speed = datamat(:,4); % do subtract zero, modify calibration equation
raw_drag = datamat(:,11);
raw_res = datamat(:,14);
pitch = datamat(:,15);
curr_gen = datamat(:,16);
fan_speed = datamat(:,2);

% Using anonymous functions to convert to useful values
drag_force = wforce(raw_drag);
wind_speed = wvel(raw_speed);
resistance = res(raw_res);

% Other constants
R = 0.075; % m
D = 2*R;
density = 1.1738; % kg/m3
visc = 1.854e-5; %kg/(m*s)

% Performance metrics
eff = 2*volt_gen.*curr_gen./(1000*density*pi*R^2*wind_speed.^3); % 1000 b/c mA
drag_coeff = 2*drag_force./(density*pi*R^2*wind_speed.^2);
reynolds = wind_speed*D*density/visc;
cost = -0.8*eff/0.05 + 0.2*drag_coeff % arbitrary for now

% select only points w/ cost < -0.5
wind_speed = wind_speed(cost<-0.5);
resistance = resistance(cost<-0.5);
pitch = pitch(cost<-0.5);
reynolds = reynolds(cost<-0.5);
raw_res = raw_res(cost<-0.5);
cost = cost(cost<-0.5);

% variables
ws = reynolds;
ws2 = ws.^2;
re = raw_res;
re2 = re.^2;
pitch2 = pitch.^2;
bias = ones(size(ws));

% OLS
% y = real(cost);
% A = [ws, ws.^2, re, re.^2, pitch, pitch.^2, ws.*re, ws.*pitch, re.*pitch, bias];
 %weights = inv(transpose(A)*A)*transpose(A)*y;
% w = real(weights)
% save('weights', 'w')
% weights2 = polyfit(A,y,2)

% Find optimum with all points
% options = optimoptions('fmincon','Algorithm','trust-region','SpecifyObjectiveGradient',true);
x0 = [800,100,5];
fun = @create_objective_focus;
create_objective_focus([12.92,799,3])
lb = [0,0.5,-1];
ub = [25,198,9];
A = [];
b = [];
Aeq = [];
beq = [];
% x_all = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)

lb_focus = [0,0,3];
ub_focus = [25,1000,5];
x_focus = fmincon(fun,x0,A,b,Aeq,beq,lb_focus,ub_focus)

plot_cost_pres(reynolds, raw_res, pitch, cost)
% plot_cost(reynolds, raw_res, pitch, cost)
% opt250 = best_rheo(reynolds, raw_res, pitch, eff, fan_speed, drag_coeff)

w = [-0.4255, 0.0147, -0.0287, 0.0001, 0.1404, -0.0003, ...
    0.0016, -0.0062, 0.0000, 1.9077];
% plot objective function
anonfun = @(ws, rheo) w(1).*ws + w(2)*ws.^2 + w(3)*rheo + w(4)*rheo.^2 + w(5)*3 + w(6)*9 + ...
     w(7)*ws.*rheo + w(8)*ws*3 + w(9)*rheo.*3 + w(10);
[X,Y] = meshgrid(5e4:1e4:15e4,500:40:900);
anonfun(1.227e5,799)
Z = anonfun(X,Y);
figure
surf(X,Y,Z)
hold on
xlabel('Reynolds Number')
ylabel('Rheostat Value')
zlabel('Cost')
title('Cost Function from Regression, 3 degree pitch')
