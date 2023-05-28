function [yR, yV] = measurementGPS(cartesianState, biasRnew, biasVnew, sigmaR, sigmaV)
% The measurement model for the GPS sensor

r = cartesianState(1:3);
v = cartesianState(4:6);

rng('default')  % For reproducibility
mu = zeros(3, 1);
errorR = mvnrnd(mu, sigmaR);
errorV = mvnrnd(mu, sigmaV);

yR = r + biasRnew + errorR;
yV = v + biasVnew + errorV;

end
