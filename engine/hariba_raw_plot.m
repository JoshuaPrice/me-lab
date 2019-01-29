% Raw CSV -> Raw Data Plot
filename = '2000rpm-45p-beforecat-jan-29-hariba1.xlsx';
raw_data = xlsread(filename);

O2_raw = raw_data(:,1);
THC_raw = raw_data(:,2);
CO2_raw = raw_data(:,3);
CO_raw = raw_data(:,4);
NOx_raw = raw_data(:,5);

% Need to create file that imports these files to workspace
A_CO_r3 = 0.01353769; % ppm
B_CO_r3 = 7.687434;
C_CO_r3 = 0.01247239;
D_CO_r3 = 0.0001464194;
E_CO_r3 = -0.000000397985;

A_O2_r1 = 0;
B_O2_r1 = 5; % percent
C_O2_r1 = 0;
D_O2_r1 = 0;
E_O2_r1 = 0;

A_THC_r6 = 0;
B_THC_r6 = 3000; % ppmC
C_THC_r6 = 0;
D_THC_r6 = 0;
E_THC_r6 = 0;

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

% Calculate actual CO ppm(?) value
CO_ppm = A_CO_r3 + B_CO_r3.*CO_raw + C_CO_r3.*CO_raw.^2 + ...
    D_CO_r3.*CO_raw.^3 + E_CO_r3.*CO_raw.^4;

% Calculate actual O2 % value
O2_p = A_O2_r1 + B_O2_r1.*O2_raw + C_O2_r1.*O2_raw.^2 + ...
    D_O2_r1.*O2_raw.^3 + E_O2_r1.*O2_raw.^4;

% Calculate actual THC ppm value
THC_ppm = A_THC_r6 + B_THC_r6.*THC_raw + C_THC_r6.*THC_raw.^2 + ...
    D_THC_r6.*THC_raw.^3 + E_THC_r6.*THC_raw.^4;

% Calculate actual NOx ppm value
NOx_ppm = A_NOx_r6 + B_NOx_r6.*NOx_raw + C_NOx_r6.*NOx_raw.^2 + ...
    D_NOx_r6.*NOx_raw.^3 + E_NOx_r6.*NOx_raw.^4;

% Calculate actual NOx ppm value
CO2_p = A_CO2_r4 + B_CO2_r4.*CO2_raw + C_CO2_r4.*CO2_raw.^2 + ...
    D_CO2_r4.*CO2_raw.^3 + E_CO2_r4.*CO2_raw.^4;

combined_mat = [O2_p, THC_ppm, CO2_ppm, CO_ppm, NOx_ppm];
subplot(2,3,1)
plot(combined_mat(:,1))
ylim([0,4])
ylabel('[O_2] (%)')
xlabel('time (s)')

subplot(2,3,2)
plot(combined_mat(:,2))
ylim([0,1200])
ylabel('[THC] (ppmC)')
xlabel('time (s)')

subplot(2,3,3)
plot(combined_mat(:,3))
ylim([0,0.06])
ylabel('[CO_2] (%)')
xlabel('time (s)')

subplot(2,3,4)
plot(combined_mat(:,4))
ylim([0,1.5])
ylabel('[CO] (ppm)')
xlabel('time (s)')

subplot(2,3,5)
plot(combined_mat(:,5))
ylim([0,1.3])
ylim([0,1200])
ylabel('[NOx] (ppm)')
xlabel('time (s)')

