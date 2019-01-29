%% Make range workspace
THC_ranges = xlsread('THC_ranges');
O2_ranges = xlsread('O2_ranges');
CO_ranges = xlsread('CO_ranges');
CO2_ranges = xlsread('CO2_ranges');
NOx_ranges = xlsread('NOx_ranges');
trial_ranges = xlsread('trial_ranges');

save('rangemats')
