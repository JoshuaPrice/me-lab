function ppmval = conc_full(gas, rpm, thr, ig)
% Converts raw value to ppm value for single value OR returns
% average of array of values

% Get raw data from data directory
if ig == 0
    datastr = strcat('d', num2str(rpm), "_", num2str(thr), "_", num2str(ig));
elseif ig == 1
    datastr = strcat('d', num2str(rpm), "_", num2str(thr), "_pos");
elseif ig == -1
    datastr = strcat('d', num2str(rpm), "_", num2str(thr), "_neg");
end

rawdata = getfield(load('data/datamat', datastr), char(datastr));

% Get range numbers from range directory
allr = getfield(load('ranges/rangemats', 'trial_ranges'), 'trial_ranges');
tranges = allr(allr(:,1)==rpm & allr(:,2)==thr & allr(:,3)==ig,4:end);
if length(tranges) > 5
    error("Forgot to remove CO(L) from this dataset!")
end

% Convert gas to number and import from ranges from csv file
% 1e4 multiplier on some rangemat to convert from % to ppm
if gas == 'THC'
    granges = getfield(load('ranges/rangemats', 'THC_ranges'), 'THC_ranges');
    gasdata = rawdata(:,1);
    rangenum = tranges(1);
elseif gas == 'O2'
    granges = getfield(load('ranges/rangemats', 'O2_ranges'), 'O2_ranges')*1e4;
    gasdata = rawdata(:,2);
    rangenum = tranges(2);
elseif gas == 'CO'
    granges = getfield(load('ranges/rangemats', 'CO_ranges'), 'CO_ranges')*1e4;
    gasdata = rawdata(:,3);
    rangenum = tranges(3);
elseif gas == 'CO2'
    granges = getfield(load('ranges/rangemats', 'CO2_ranges'), 'CO2_ranges')*1e4;
    gasdata = rawdata(:,4);
    rangenum = tranges(4);
elseif gas == 'NOx'
    granges = getfield(load('ranges/rangemats', 'NOx_ranges'), 'NOx_ranges');
    gasdata = rawdata(:,5);
    rangenum = tranges(5);
else
    error('ERROR: Unaccepted gas name provided')
end

% Interpolation coefficients
ic = granges(rangenum, :);

% Calculate ppm value for gas at this range
d = gasdata(1:50);
ppmval_long = ic(1) + ic(2).*d + ic(3).*d.^2 + ic(4).*d.^3 + ic(5).*d.^4;
ppmval = mean(ppmval_long);
    
end