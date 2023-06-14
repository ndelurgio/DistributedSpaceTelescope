dvt = cumsum(dv_total);
dvt = dvt(end);
isp = 68;
g0 = 9.81;
mi = 339;
mf = mi/exp(dvt/(isp*g0));
