function plotvary(gas, rpm, thr, ig)

if length(rpm) > 1 % vary rpm, thr and ig constant
    xvals = rpm;
    yvals = zeros(1,length(rpm));
    errs = zeros(1,length(rpm));
    for j = 1:length(rpm)
        [yvals(1,j), errs(1,j)] = conc(gas, rpm(j), thr, ig);
    end
end

if length(thr) > 1 % vary thr, ig and rpm constant
    xvals = thr;
    yvals = zeros(1,length(thr));
    errs = zeros(1,length(thr));
    for j = 1:length(thr)
        [yvals(1,j), errs(1,j)] = conc(gas, rpm, thr(j), ig);
    end
end

if length(ig) > 1 % vary ig, constant thr, contant rpm
    xvals = ig;
    yvals = zeros(1,length(ig));
    errs = zeros(1,length(ig));
    for j = 1:length(ig)
        [yvals(1,j), errs(1,j)] = conc(gas, rpm, thr, ig(j));
    end
end


errorbar(xvals, yvals, errs)
% legend(string(thr))
    
end
