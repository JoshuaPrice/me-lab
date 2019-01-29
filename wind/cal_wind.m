function mat_out = cal_wind(mat_in)

    % Calibrate an individual data file by subtracting by the
    % average of the first ten rows of pressure transducer and strain
    % gage data. 
    
    a_extra = mat_in;
    a_extra(11:end,[4,11]) = a_extra(11:end,[4,11]) - mean(a_extra(1:10,[4,11]));
    a = a_extra(11:end,1:16);
    
    mat_out = [];
    
    % Group into 10s
    % lena = length(a)
    for i = 0:length(a)/10-1
        begin_avg = 10*i+1;
        end_avg = 10*(i+1);
        subset_a = a(begin_avg:end_avg,:);
        mat_out(i+1,:) = mean(subset_a);
    end
    
    % mat_out = a;
end