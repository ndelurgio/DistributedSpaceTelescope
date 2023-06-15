dvt_all = cumsum(dv_all, 2);
dvt = dvt_all(:, end);
isp = 68;
g0 = 9.81;
mi = 339;
for i=1:length(rhos)
    mf = mi/exp(dvt(i)/(isp*g0));
    mp = mi - mf;
    fprintf('Used propellant mass: %d\n', mp)
end
