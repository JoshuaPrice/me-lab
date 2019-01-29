function sixplots(gas)
    close all
    figure('Position',[0,100,1200,2000])
    subplot(3,3,1)
    plotvary(gas, 2500:500:4000, 50, 0);
    hold on
    plotvary(gas, 2000:500:4000, 75, 0);
    plotvary(gas, 2000:500:4000, 100, 0);
    hold off
    legend('50% thr.', '75% thr.', '100% thr.','Location','northwest')
    title(strcat('A: ', gas, ' Standard Timing, Varying RPM'))
    xlabel("RPM (1/min)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,2)
    plotvary(gas, 2500, 50:25:100, 0);
    hold on
    plotvary(gas, 3000, 50:25:100, 0);
    plotvary(gas, 4000, 50:25:100, 0);
    legend('2500 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
    title(strcat('B: ', gas, ' Standard Timing, Varying Throttle'))
    xlabel("Throttle (%)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,3)
    plotvary(gas, 3000, 50, -1:1);
    hold on
    plotvary(gas, 4000, 50, -1:1);
    legend('3000 RPM', '4000 RPM','Location','northwest')
    title(strcat('C: ', gas, ' Constant Throttle = 50%, Varying Timing'))
    xlabel("Ignition timing (normalized)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,4)
    plotvary(gas, 2000:1000:4000, 50, -1)
    hold on
    plotvary(gas, 2000:1000:4000, 75, -1);
    plotvary(gas, 2000:1000:4000, 100, -1);
    legend('50% thr.', '75% thr.', '100% thr.', 'Location','northwest')
    title(strcat('D: ', gas, ' Retarded Timing, Varying RPM'))
    xlabel("RPM (1/min)")
    ylabel("Concentration (ppm)")
    
    
    subplot(3,3,5)
    plotvary(gas, 2000, 50:25:100, -1);
    hold on
    plotvary(gas, 3000, 50:25:100, -1);
    plotvary(gas, 4000, 50:25:100, -1);
    legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
    title(strcat('E: ', gas, ' Retarded Timing, Varying Throttle'))
    xlabel("Throttle (%)")
    ylabel("Concentration (ppm)")
     
    subplot(3,3,6) 
    plotvary(gas, 2000, 75, -1:1);
    hold on
    plotvary(gas, 3000, 75, -1:1);
    plotvary(gas, 4000, 75, -1:1);
    legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
    title(strcat('F: ', gas, ' Constant Throttle = 75%, Varying Timing'))
    xlabel("Ignition timing (normalized)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,7)
    plotvary(gas, 2000:1000:4000, 50, 1)
    hold on
    plotvary(gas, 2000:1000:4000, 75, 1);
    plotvary(gas, 2000:1000:4000, 100, 1);
    legend('50% thr.', '75% thr.', '100% thr.', 'Location','northwest')
    title(strcat('G: ', gas, ' Advanced Timing, Varying RPM'))
    xlabel("RPM (1/min)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,8)
    plotvary(gas, 2000, 50:25:100, 1);
    hold on
    plotvary(gas, 3000, 50:25:100, 1);
    plotvary(gas, 4000, 50:25:100, 1); 
    legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
    title(strcat('H: ', gas, ' Advanced Timing, Varying Throttle'))
    xlabel("Throttle (%)")
    ylabel("Concentration (ppm)")
    
    subplot(3,3,9)
    plotvary(gas, 2000, 100, -1:1);
    hold on
    plotvary(gas, 3000, 100, -1:1);
    plotvary(gas, 4000, 100, -1:1);
    legend('2000 RPM', '3000 RPM', '4000 RPM', 'Location','northwest')
    title(strcat('I: ', gas, ' Constant Throttle = 100%, Varying Timing'))
    xlabel("Ignition timing (normalized)")
    ylabel("Concentration (ppm)")
    
end
