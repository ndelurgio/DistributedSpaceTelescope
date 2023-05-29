function [y] = measurementModel(x, u, BsrpChief, BsrpDep, p_sr, sunPos, Re, AU)
% The measurement model for the GPS and IMU

[dSRPChief, ~] = computeSRPcartesianPertubation_J2000(cartesianState, BsrpChief, p_sr, sunPos, Re, AU);
[dSRPDep, ~] = computeSRPcartesianPertubation_J2000(cartesianState, BsrpDep, p_sr, sunPos, Re, AU);

posChief = x(1:3, 1);
velChief = x(4:6, 1);
posDep = x(7:9, 1);
velDep = x(10:12, 1);
biasR = x(13:15, 1);
biasV = x(16:18, 1);
biasAChief = x(19:21, 1);
biasADep = x(22:24, 1);

yRChief = posChief + biasR;
yVChief = velChief + biasV;
yAChief = dSRPChief + u + biasAChief;
yChief = [yRChief; yVChief; yAChief];

yRDep = posDep + biasR;
yVDep = velDep + biasV;
yADep = dSRPDep + u + biasADep;
yDep = [yRDep; yVDep; yADep];

y = [yChief; yDep];

end
