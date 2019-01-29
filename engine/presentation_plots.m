%% Presentation Plots
close all

% NOx plot: 50% throttle
plotvary(gas, 3000, 50, -1:1);
hold on
plotvary(gas, 4000, 50, -1:1);
legend('3000 RPM', '4000 RPM','Location','northwest')
title(strcat('NOx: Constant Throttle = 50%, Varying Timing'))
xlabel("Ignition timing (normalized)")
ylabel("Concentration (ppm)")
    

% NOx plot: 75% throttle
figure
gas = "NOx";
plotvary(gas, 2000, 75, -1:1);
hold on
plotvary(gas, 3000, 75, -1:1);
plotvary(gas, 4000, 75, -1:1);
legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
title(strcat('NOx: Constant Throttle = 75%, Varying Timing'))
xlabel("Ignition timing (normalized)")
ylabel("Concentration (ppm)")


% CO plot
figure
gas = "CO";
hold on
plotvary(gas, 3000, 75, -1:1);
plotvary(gas, 4000, 75, -1:1);
legend('3000 RPM', '4000 RPM', 'Location','northeast')
title(strcat('CO: Constant Throttle = 75%, Varying Timing'))
xlabel("Ignition timing (normalized)")
ylabel("Concentration (ppm)")

% CO2 plot
figure
gas = "CO2";
hold on
plotvary(gas, 3000, 75, -1:1);
plotvary(gas, 4000, 75, -1:1);
legend('3000 RPM', '4000 RPM', 'Location','northwest')
title(strcat('CO2: Constant Throttle = 75%, Varying Timing'))
xlabel("Ignition timing (normalized)")
ylabel("Concentration (ppm)")

figure
gas = "NOx";
plotvary(gas, 2000, 50:25:100, -1);
hold on
plotvary(gas, 3000, 50:25:100, -1);
plotvary(gas, 4000, 50:25:100, -1);
legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
title(strcat('NOx: Retarded Timing, Varying Throttle'))
xlabel("Throttle (%)")
ylabel("Concentration (ppm)")

figure
gas = "NOx";
plotvary(gas, 2000, 50:25:100, 1);
hold on
plotvary(gas, 3000, 50:25:100, 1);
plotvary(gas, 4000, 50:25:100, 1); 
legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
title(strcat('NOx: Advanced Timing, Varying Throttle'))
xlabel("Throttle (%)")
ylabel("Concentration (ppm)")