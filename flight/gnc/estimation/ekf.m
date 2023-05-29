function [mu,cov] = ekf(mu_prev,cov_prev, y, u, Bsrp_c, Bsrp_d, sunPos, dt, Q, R)

% CONSTANTS
mu_earth = 3.986004419e14;
J2 = 0.108263e-2;
Re = 6.378e6;
AU = 1.496e11;
p_sr = 4.5344321e-6;

% Predict
mu = dynamicsModel(mu_prev,u,sunPos,Bsrp_c,Bsrp_d,dt,mu_earth,J2,Re,AU,p_sr);
A = getA(mu_prev,u,sunPos,Bsrp_c,Bsrp_d,dt,mu_earth,J2,Re,AU,p_sr);
cov = A*cov_prev*A' + Q;
% Kalman Gain
H = getMatrixH(x,sunPos,Bsrp_c,Bsrp_d,p_sr);
K = cov*H'*inv(H*cov*H'+R);
% Expected Measurement
Ey = measurementModel(x,u,Bsrp_c,Bsrp_d,p_sr,sunPos,Re,AU);
mu = mu + K*(y-Ey);
cov = cov - K*C*cov;


end

