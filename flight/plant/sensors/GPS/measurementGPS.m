function [yR, yV] = measurementGPS(cartesianState, biasRnew, biasVnew, sigmaR, sigmaV, noiseR, noiseV)
% The measurement model for the GPS sensor

r = cartesianState(1:3,1);
v = cartesianState(4:6,1);

noiseR = sqrtm(sigmaR) * noiseR;
noiseV = sqrtm(sigmaV) * noiseV;

yR = r + biasRnew + noiseR;
yV = v + biasVnew + noiseV;

end
