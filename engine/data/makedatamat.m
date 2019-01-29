%% Make data workspace

%% 0 ignition timing
% throttle = 25

% throttle = 50
d2500_50_0 = xlsread('2500rpm-50p-0t');
d3000_50_0 = xlsread('3000rpm-50p-0t');
d3500_50_0 = xlsread('3500rpm-50p-0t');
d4000_50_0 = xlsread('4000rpm-50p-0t');
% throttle = 75
d2000_75_0 = xlsread('2000rpm-75p-0t');
d2500_75_0 = xlsread('2500rpm-75p-0t');
d3000_75_0 = xlsread('3000rpm-75p-0t');
d3500_75_0 = xlsread('3500rpm-75p-0t');
d4000_75_0 = xlsread('4000rpm-75p-0t');
% throttle = 100
d2000_100_0 = xlsread('2000rpm-100p-0t');
d2500_100_0 = xlsread('2500rpm-100p-0t');
d3000_100_0 = xlsread('3000rpm-100p-0t');
d3500_100_0 = xlsread('3500rpm-100p-0t');
d4000_100_0 = xlsread('4000rpm-100p-0t');

%% Positive ignition timing
% throttle = 25
d2000_25_pos = xlsread('2000rpm-25p-pos1t');
% throttle = 50
d2000_50_pos = xlsread('2000rpm-50p-pos1t');
d3000_50_pos = xlsread('3000rpm-50p-pos1t');
d4000_50_pos = xlsread('4000rpm-50p-pos1t');
% throttle = 75
d2000_75_pos = xlsread('2000rpm-75p-pos1t');
d3000_75_pos = xlsread('3000rpm-75p-pos1t');
d4000_75_pos = xlsread('4000rpm-75p-pos1t');
% throttle = 100
d2000_100_pos = xlsread('2000rpm-100p-pos1t');
d3000_100_pos = xlsread('3000rpm-100p-pos1t');
d4000_100_pos = xlsread('4000rpm-100p-pos1t');

%% Negative ignition timing
% throttle = 25
d2000_25_neg = xlsread('2000rpm-25p-neg1t');
% throttle = 50
d2000_50_neg = xlsread('2000rpm-50p-neg1t');
d3000_50_neg = xlsread('3000rpm-50p-neg1t');
d4000_50_neg = xlsread('4000rpm-50p-neg1t');

% throttle = 75
d2000_75_neg = xlsread('2000rpm-75p-neg1t');
d3000_75_neg = xlsread('3000rpm-75p-neg1t');
d4000_75_neg = xlsread('4000rpm-75p-neg1t');

% throttle = 100
d2000_100_neg = xlsread('2000rpm-100p-neg1t');
d3000_100_neg = xlsread('3000rpm-100p-neg1t');
d4000_100_neg = xlsread('4000rpm-100p-neg1t');


% save to matlab workspace file to load later
save('datamat')
