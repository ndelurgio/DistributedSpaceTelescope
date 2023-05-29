function [mu,cov] = ekf(mu_prev, cov_prev, y, M, J, dt, Q, R)

% Predict
mu = zeros(10,1);
mu(1:7,1) = attitudeDynamicsEuler(mu_prev(1:7,1),M,J,dt);
mu(1:4,1) = mu(1:4,1)/norm(mu(1:4,1));
mu(8:10,1) = gyroBiasEuler(mu_prev(8:10,1),[0;0;0],dt);
q = mu(1:4);
y_qvec = y(1:3);
y_wvec = y(5:7);
A = jacobianest(@(x) [attitudeDynamicsEuler(x(1:7),M,J,dt); gyroBiasEuler(x(8:10),zeros(3,1),dt)], mu_prev);
cov = A*cov_prev*A' + Q;
% Kalman Gain
C = jacobianest(@(x) getSensors(x,R(5:7,5:7),R(1:4,1:4)),mu);
K = cov*C'*inv(C*cov*C'+R);
% Expected Measurement
Ey = getSensors(mu,zeros(3,3),zeros(4,4));
mu = mu + K*(y-Ey);
cov = cov - K*C*cov;


end

