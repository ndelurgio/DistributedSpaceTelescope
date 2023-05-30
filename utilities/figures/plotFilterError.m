
xPosEKF = sim{10}{10}.Values.Data(:,1);
yPosEKF = sim{10}{10}.Values.Data(:,2);
zPosEKF = sim{10}{10}.Values.Data(:,3);

xPosUKF = sim{10}{12}.Values.Data(:,1);
yPosUKF = sim{10}{12}.Values.Data(:,2);
zPosUKF = sim{10}{12}.Values.Data(:,3);

xPosTrue = sim{10}{15}.Values.positionX_J2000_m.Data(:);
yPosTrue = sim{10}{15}.Values.positionY_J2000_m.Data(:);
zPosTrue = sim{10}{15}.Values.positionZ_J2000_m.Data(:);

xEKFerr = xPosEKF(2:end) - xPosTrue(1:end-1);
yEKFerr = yPosEKF(2:end) - yPosTrue(1:end-1);
zEKFerr = zPosEKF(2:end) - zPosTrue(1:end-1);

figure
subplot 311
plot(time(1:end-1),xEKFerr)

subplot 312
plot(time(1:end-1),yEKFerr)

subplot 313
plot(time(1:end-1),zEKFerr)