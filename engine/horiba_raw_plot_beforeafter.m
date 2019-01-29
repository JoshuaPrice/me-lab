% Raw CSV -> Raw Data Plot
before_file = '2000rpm-35p-beforecat-jan-29-hariba1.xlsx';
after_file = '2000rpm-35p-aftercat-jan-29-hariba1.xlsx';
raw_before_data = xlsread(before_file);
raw_after_data = xlsread(after_file);

% Order: O2, THC, CO2, CO(H), NOx
	 
raw_data(:,:,1) = raw_before_data(1:50,:);
raw_data(:,:,2) = raw_after_data(1:50,:);

%% Polynomial extrapolation coefficients
% Need to create file that imports these files to workspace
A_CO_r1 = 0.0002418589; % percent
B_CO_r1 = 0.004709818;
C_CO_r1 = 0.000002877999;
D_CO_r1 = 0;
E_CO_r1 = 0;

A_CO_r3 = 0.01353769; % percent
B_CO_r3 = 7.687434;
C_CO_r3 = 0.01247239;
D_CO_r3 = 0.0001464194;
E_CO_r3 = -0.000000397985;

A_O2_r1 = 0;
B_O2_r1 = 5; % percent
C_O2_r1 = 0;
D_O2_r1 = 0;
E_O2_r1 = 0;

A_THC_r4 = 0;
B_THC_r4 = 300; % ppmC
C_THC_r4 = 0;
D_THC_r4 = 0;
E_THC_r4 = 0;

A_THC_r6 = 0;
B_THC_r6 = 3000; % ppmC
C_THC_r6 = 0;
D_THC_r6 = 0;
E_THC_r6 = 0;

A_NOx_r4 = 0;
B_NOx_r4 = 300; % ppm
C_NOx_r4 = 0;
D_NOx_r4 = 0;
E_NOx_r4 = 0;

A_NOx_r6 = 0;
B_NOx_r6 = 3000; % ppm
C_NOx_r6 = 0;
D_NOx_r6 = 0;
E_NOx_r6 = 0;

A_CO2_r4 = -0.02543291; % percent
B_CO2_r4 = 0.09025789;
C_CO2_r4 = -0.00005051354;
D_CO2_r4 = 0.000007442171;
E_CO2_r4 = 0;

% matrix to hold all converted data
converted_data = zeros(50, 5, 2);

%% Before values
% Calculate actual O2 % value
O2_raw_b = raw_data(:,1,1);
O2_p = A_O2_r1 + B_O2_r1.*O2_raw_b + C_O2_r1.*O2_raw_b.^2 + ...
    D_O2_r1.*O2_raw_b.^3 + E_O2_r1.*O2_raw_b.^4;
converted_data(:,1,1) = O2_p;
O2_average_before = mean(O2_p)
O2_std_before = std(O2_p)

% Calculate actual THC ppm value (before cat)
THC_raw_b = raw_data(:,2,1);
THC_ppm = A_THC_r6 + B_THC_r6.*THC_raw_b + C_THC_r6.*THC_raw_b.^2 + ...
    D_THC_r6.*THC_raw_b.^3 + E_THC_r6.*THC_raw_b.^4;
converted_data(:,2,1) = THC_ppm;
THC_average_before = mean(THC_ppm)
THC_std_before = std(THC_ppm)

% Calculate actual CO2 % value
CO2_raw_b = raw_data(:,3,1);
CO2_p = A_CO2_r4 + B_CO2_r4.*CO2_raw_b + C_CO2_r4.*CO2_raw_b.^2 + ...
    D_CO2_r4.*CO2_raw_b.^3 + E_CO2_r4.*CO2_raw_b.^4;
converted_data(:,3,1) = CO2_p;
CO2_average_before = mean(CO2_p)
CO2_std_before = std(CO2_p)

% Calculate actual CO % value
CO_raw_b = raw_data(:,4,1);
CO_p = A_CO_r3 + B_CO_r3.*CO_raw_b + C_CO_r3.*CO_raw_b.^2 + ...
    D_CO_r3.*CO_raw_b.^3 + E_CO_r3.*CO_raw_b.^4;
converted_data(:,4,1) = CO_p;
CO_average_before = mean(CO_p)
CO_std_before = std(CO_p)

% Calculate actual NOx ppm value
NOx_raw_b = raw_data(:,5,1);
NOx_ppm = A_NOx_r6 + B_NOx_r6.*NOx_raw_b + C_NOx_r6.*NOx_raw_b.^2 + ...
    D_NOx_r6.*NOx_raw_b.^3 + E_NOx_r6.*NOx_raw_b.^4;
converted_data(:,5,1) = NOx_ppm;
NOx_average_before = mean(NOx_ppm)
NOx_std_before = std(NOx_ppm)

%% After values
% Calculate actual O2 % value
O2_raw_a = raw_data(:,1,2);
O2_p = A_O2_r1 + B_O2_r1.*O2_raw_a + C_O2_r1.*O2_raw_a.^2 + ...
    D_O2_r1.*O2_raw_a.^3 + E_O2_r1.*O2_raw_a.^4;
converted_data(:,1,2) = O2_p;
O2_average_after = mean(O2_p)
O2_std_after = std(O2_p)

% Calculate actual THC ppm value (before cat)
THC_raw_a = raw_data(:,2,2);
THC_ppm = A_THC_r4 + B_THC_r4.*THC_raw_a + C_THC_r4.*THC_raw_a.^2 + ...
    D_THC_r4.*THC_raw_a.^3 + E_THC_r4.*THC_raw_a.^4;
converted_data(:,2,2) = THC_ppm;
THC_average_after = mean(THC_ppm)
THC_std_after = std(THC_ppm)

% Calculate actual CO2 % value
CO2_raw_a = raw_data(:,3,2);
CO2_p = A_CO2_r4 + B_CO2_r4.*CO2_raw_a + C_CO2_r4.*CO2_raw_a.^2 + ...
    D_CO2_r4.*CO2_raw_a.^3 + E_CO2_r4.*CO2_raw_a.^4;
converted_data(:,3,2) = CO2_p;
CO2_average_after = mean(CO2_p)
CO2_std_after = std(CO2_p)

% Calculate actual CO % value
CO_raw_a = raw_data(:,4,2);
CO_ppm = A_CO_r1 + B_CO_r1.*CO_raw_a + C_CO_r1.*CO_raw_a.^2 + ...
    D_CO_r1.*CO_raw_a.^3 + E_CO_r1.*CO_raw_a.^4;
converted_data(:,4,2) = CO_ppm;
CO_average_after = mean(CO_ppm)
CO_std_after = std(CO_ppm)

% Calculate actual NOx ppm value
NOx_raw_a = raw_data(:,5,2);
NOx_ppm = A_NOx_r4 + B_NOx_r4.*NOx_raw_a + C_NOx_r4.*NOx_raw_a.^2 + ...
    D_NOx_r4.*NOx_raw_a.^3 + E_NOx_r4.*NOx_raw_a.^4;
converted_data(:,5,2) = NOx_ppm;
NOx_average_after = mean(NOx_ppm)
NOx_std_after = std(NOx_ppm)

%% Plot comparison plots
% Plot O2
subplot(2,3,1)
plot(converted_data(:,1,1),'k')
hold on
plot(converted_data(:,1,2),'r')
O2_percent_reduction = 100*(O2_average_before-O2_average_after)/O2_average_before
xlim([0,50])
ylim([0,5])
ylabel('[O_2] (%)')
xlabel('time (s)')
title('O_2 Emissions Time Series')
legend('Before Cat','After Cat')

% Plot THC
subplot(2,3,2)
plot(converted_data(:,2,1),'k')
hold on
plot(converted_data(:,2,2),'r')
THC_percent_reduction = 100*(THC_average_before-THC_average_after)/THC_average_before
xlim([0,50])
ylim([0,1200])
ylabel('[THC] (ppmC)')
xlabel('time (s)')
title('THC Emissions Time Series')
legend('Before Cat','After Cat')

% Plot CO2
subplot(2,3,3)
plot(converted_data(:,3,1),'k')
hold on
plot(converted_data(:,3,2),'r')
CO2_percent_reduction = 100*(CO2_average_before-CO2_average_after)/CO2_average_before
xlim([0,50])
ylim([0,0.1])
ylabel('[CO_2] (%)')
xlabel('time (s)')
title('CO_2 Emissions Time Series')
legend('Before Cat','After Cat')

% Plot CO
subplot(2,3,4)
positionVector1 = [0.2, 0.1, 0.2, 0.35];
subplot('Position',positionVector1)
plot(converted_data(:,4,1),'k')
hold on
plot(converted_data(:,4,2),'r')
CO_percent_reduction = 100*(CO_average_before-CO_average_after)/CO_average_before
xlim([0,50])
ylim([0,1.7])
ylabel('[CO] (%)')
xlabel('time (s)')
title('CO Emissions Time Series')
legend('Before Cat','After Cat')

% Plot NOx
subplot(2,3,5)
positionVector2 = [0.6, 0.1, 0.2, 0.35];
subplot('Position',positionVector2)
plot(converted_data(:,5,1),'k')
hold on
plot(converted_data(:,5,2),'r')
NOx_percent_reduction = 100*(NOx_average_before-NOx_average_after)/NOx_average_before
xlim([0,50])
ylim([0,1000])
ylabel('[NOx] (ppm)')
xlabel('time (s)')
title('NO_x Emissions Time Series')
legend('Before Cat','After Cat')
