function mat_out = make_datamat()

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
    raw_data_day1 = xlsread('data/2018-03-19_runs.xlsx');
    raw_data = [raw_data; cal_wind(raw_data_day1)];
    day2_1 = xlsread('data/day2pitch-1.xlsx');
    raw_data = [raw_data; cal_wind(day2_1)];
    day2_3 = xlsread('data/day2pitch3.xlsx');
    raw_data = [raw_data; cal_wind(day2_3)];
    day2_5 = xlsread('data/day2pitch5.xlsx');
    raw_data = [raw_data; cal_wind(day2_5)];
    day2_7 = xlsread('data/day2pitch7.xlsx');
    raw_data = [raw_data; cal_wind(day2_7)];
    day2_9 = xlsread('data/day2pitch9.xlsx');
    raw_data = [raw_data; cal_wind(day2_9)];
    day3_7 = xlsread('data/day3pitch7.xlsx');
    raw_data = [raw_data; cal_wind(day3_7)];
    day3_7b = xlsread('data/day3pitch7b.xlsx');
    raw_data = [raw_data; cal_wind(day3_7b)];
    day3_9 = xlsread('data/day3pitch9.xlsx');
    raw_data = [raw_data; cal_wind(day3_9)];   
    day3_9b = xlsread('data/day3pitch9b.xlsx');
    raw_data = [raw_data; cal_wind(day3_9b)];
    day4_3 = xlsread('data/day4pitch3.xlsx');
    raw_data = [raw_data; cal_wind(day4_3)];
    day4_5 = xlsread('data/day4pitch5.xlsx');
    raw_data = [raw_data; cal_wind(day4_5)];
    
    for i = 1:length(raw_data)
        if raw_data(i,16) < 1
            raw_data(i,16) = raw_data(i,16)*1000;
        end
    end
    
    mat_out = raw_data;
    
    % for troubleshooting
    % mat_out = raw_data(1:20,:);
end