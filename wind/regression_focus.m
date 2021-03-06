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

datamat = make_datamat();

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
cost = -0.8*eff/0.05 + 0.2*drag_coeff; % arbitrary for now

% select only points w/ cost < -0.2
cost_cutoff = -0.2
wind_speed = wind_speed(cost<cost_cutoff);
resistance = resistance(cost<cost_cutoff);
pitch = pitch(cost<cost_cutoff);
reynolds = reynolds(cost<cost_cutoff);
raw_res = raw_res(cost<cost_cutoff);
cost = cost(cost<cost_cutoff);

% variables
ws = wind_speed;
ws2 = ws.^2;
% re = resistance;
re = raw_res;
re2 = re.^2;
pitch2 = pitch.^2;
bias = ones(size(ws));

% OLS
y = real(cost);
A = [ws, ws.^2, re, re.^2, pitch, pitch.^2, ws.*re, ws.*pitch, re.*pitch, bias];
weights = inv(transpose(A)*A)*transpose(A)*y;
w = real(weights)
save('weights', 'w')
% weights2 = polyfit(A,y,2)

% Find optimum with all points
% options = optimoptions('fmincon','Algorithm','trust-region','SpecifyObjectiveGradient',true);
x0 = [8,100,3];
fun = @create_objective_focus;
lb = [0,0,-1];
ub = [25,1000,9];
A = [];
b = [];
Aeq = [];
beq = [];   
x_all = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)

lb_focus = [0,0,3];
ub_focus = [25,1000,5];
x_focus = fmincon(fun,x0,A,b,Aeq,beq,lb_focus,ub_focus)

plot_cost_pres(reynolds, raw_res, pitch, cost)
% plot_cost(reynolds, raw_res, pitch, cost)
% opt250 = best_rheo(reynolds, raw_res, pitch, eff, fan_speed, drag_coeff)

anonfun = @(ws, rheo) -0.4255.*ws + 0.0147*ws.^2 + -0.0287*rheo + 0.0001*rheo.^2 + 0.1404*3 + -0.0003*9 + ...
    0.0016*ws.*rheo + -0.0062*ws*3 + 0.0000*rheo.*3 + 1.9077;

[X,Y] = meshgrid(0:2.5:25,0:10:1000);

Z = anonfun(X,Y);
surf(X,Y,Z)
