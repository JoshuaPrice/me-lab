function ppmval = conc(gas, range, raw)
% Converts raw value to ppm value for single value OR returns
% average of array of values
    
% Convert gas to number and import from ranges from csv file
% 1e4 multiplier on some rangemat to convert from % to ppm
if gas == 'THC'
    b = load('ranges/rangemats', 'THC_ranges')
    getfield(b, 'THC_ranges')
    rangemat = getfield(load('ranges/rangemats', 'THC_ranges'), 'THC_ranges');
elseif gas == 'O2'
    rangemat = getfield(load('ranges/rangemats', 'O2_ranges'), 'O2_ranges')*1e4;
elseif gas == 'CO'
    rangemat = getfield(load('ranges/rangemats', 'CO_ranges'), 'CO_ranges')*1e4;
elseif gas == 'CO2'
    rangemat = getfield(load('ranges/rangemats', 'CO2_ranges'), 'CO2_ranges')*1e4;
elseif gas == 'NOx'
    rangemat = getfield(load('ranges/rangemats', 'NOx_ranges'), 'NOx_ranges');
else
    error('ERROR: Unaccepted gas name provided')
end

% Interpolation coefficients
ic = rangemat(range, :);
ppmval_long = ic(1) + ic(2).*raw + ic(3).*raw.^2 + ic(4).*raw.^3 + ic(5).*raw.^4;
ppmval = mean(ppmval_long);
    
end