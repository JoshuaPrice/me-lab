function mat_out = make_datamat_opt()

    % This function currently generates a data matrix with all non-zero
    % runs from the first two days of testing. The strain gage and
    % pressure transducer values are calibrated in the output matrix.
    
    % This function depends on the cal_wind() function.
    
    % Column names:
    % A,1: Time, 
    % B,2: Fan Speed [RPM], 
    % C,3: Fan Speed StDev [RPM], 
    % D,4: Press. Transducer [V], 
    % E,5: Press. Trans. StDev [V], 
    % F,6: DC Rectified Generator Voltage [V], 
    % G,7: Voltage StDev [V], 
    % H,8: Ignore [-], 
    % I,9: Ignore [-], 
    % J,10: Rotor Speed [RPM], 
    % K,11: Strain Gage [V], 
    % L,12: Strain Gage StDev [V],  
    % M,13: set wind speed [m/s]
    % N,14: set rheostat value [1/ohm]
    % O,15: pitch angle
    % P,16: current
    
    % Load .xlsx files with run data
    raw_data = [];
    day5 = xlsread('data/day5.xlsx');
    raw_data = [raw_data; cal_wind(day5)];
    
    raw_data(:,16) = raw_data(:,16)*1000;
    
    mat_out = raw_data;
    
    % for troubleshooting
    % mat_out = raw_data(1:20,:);
end