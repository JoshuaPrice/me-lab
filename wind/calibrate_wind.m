function mat_out = cal_wind(mat_in)
    a = mat_in;
    a(11:end,[4,11]) = a(11:end,[4,11]) - mean(a(1:10,[4,11]));
    mat_out = a(11:end,:);
end