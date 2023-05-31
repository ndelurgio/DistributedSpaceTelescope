close all
xPosEKF = sim{10}.Values.Data(:,1);
yPosEKF = sim{10}.Values.Data(:,2);
zPosEKF = sim{10}.Values.Data(:,3);

xPosUKF = sim{13}.Values.Data(:,1);
yPosUKF = sim{13}.Values.Data(:,2);
zPosUKF = sim{13}.Values.Data(:,3);

xPosTrue = sim{17}.Values.positionX_J2000_m.Data(:);
yPosTrue = sim{17}.Values.positionY_J2000_m.Data(:);
zPosTrue = sim{17}.Values.positionZ_J2000_m.Data(:);

% xEKFerr = xPosEKF(2:end) - xPosTrue(1:end-1);
% yEKFerr = yPosEKF(2:end) - yPosTrue(1:end-1);
% zEKFerr = zPosEKF(2:end) - zPosTrue(1:end-1);
% 
% xUKFerr = xPosUKF(2:end) - xPosTrue(1:end-1);
% yUKFerr = yPosUKF(2:end) - yPosTrue(1:end-1);
% zUKFerr = zPosUKF(2:end) - zPosTrue(1:end-1);

xEKFerr = xPosEKF(2:end) - xPosTrue(1:end-1);
yEKFerr = yPosEKF(2:end) - yPosTrue(1:end-1);
zEKFerr = zPosEKF(2:end) - zPosTrue(1:end-1);

xUKFerr = xPosUKF(2:end) - xPosTrue(1:end-1);
yUKFerr = yPosUKF(2:end) - yPosTrue(1:end-1);
zUKFerr = zPosUKF(2:end) - zPosTrue(1:end-1);

xvar = sim{9}.Values.Data(1,1,:);
xsigma_ekf = sqrt(xvar(:));

yvar = sim{9}.Values.Data(2,2,:);
ysigma_ekf = sqrt(yvar(:));

zvar = sim{9}.Values.Data(3,3,:);
zsigma_ekf = sqrt(zvar(:));

xvar = sim{12}.Values.Data(1,1,:);
xsigma_ukf = sqrt(xvar(:));

yvar = sim{12}.Values.Data(2,2,:);
ysigma_ukf = sqrt(yvar(:));

zvar = sim{12}.Values.Data(3,3,:);
zsigma_ukf = sqrt(zvar(:));

figure
subplot 311
hold on;
plot(time(20:end-1)/3600,xEKFerr(20:end)-mean(xEKFerr(20:end)))
plot(time(20:end-1)/3600,xUKFerr(20:end)-mean(xUKFerr(20:end)))
plot(time(20:end-1)/3600,xsigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,xsigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("X Error [m]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])

subplot 312
hold on;
plot(time(20:end-1)/3600,yEKFerr(20:end)-mean(yEKFerr(20:end)))
plot(time(20:end-1)/3600,yUKFerr(20:end)-mean(yUKFerr(20:end)))
plot(time(20:end-1)/3600,ysigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,ysigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("Y Error [m]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])

subplot 313
hold on;
plot(time(20:end-1)/3600,zEKFerr(20:end)-mean(zEKFerr(20:end)))
plot(time(20:end-1)/3600,zUKFerr(20:end)-mean(zUKFerr(20:end)))
plot(time(20:end-1)/3600,zsigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,zsigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("Z Error [m]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])


xVelEKF = sim{10}.Values.Data(:,4);
yVelEKF = sim{10}.Values.Data(:,5);
zVelEKF = sim{10}.Values.Data(:,6);

xVelUKF = sim{13}.Values.Data(:,4);
yVelUKF = sim{13}.Values.Data(:,5);
zVelUKF = sim{13}.Values.Data(:,6);

xVelTrue = sim{17}.Values.velocityX_J2000_m.Data(:);
yVelTrue = sim{17}.Values.velocityY_J2000_m.Data(:);
zVelTrue = sim{17}.Values.velocityZ_J2000_m.Data(:);

xEKFerr = xVelEKF(2:end) - xVelTrue(1:end-1);
yEKFerr = yVelEKF(2:end) - yVelTrue(1:end-1);
zEKFerr = zVelEKF(2:end) - zVelTrue(1:end-1);

xUKFerr = xVelUKF(2:end) - xVelTrue(1:end-1);
yUKFerr = yVelUKF(2:end) - yVelTrue(1:end-1);
zUKFerr = zVelUKF(2:end) - zVelTrue(1:end-1);

xvar = sim{9}.Values.Data(4,4,:);
xsigma_ekf = sqrt(xvar(:));

yvar = sim{9}.Values.Data(5,5,:);
ysigma_ekf = sqrt(yvar(:));

zvar = sim{9}.Values.Data(6,6,:);
zsigma_ekf = sqrt(zvar(:));

xvar = sim{12}.Values.Data(4,4,:);
xsigma_ukf = sqrt(xvar(:));

yvar = sim{12}.Values.Data(5,5,:);
ysigma_ukf = sqrt(yvar(:));

zvar = sim{12}.Values.Data(6,6,:);
zsigma_ukf = sqrt(zvar(:));

figure
subplot 311
hold on;
plot(time(20:end-1)/3600,xEKFerr(20:end))
plot(time(20:end-1)/3600,xUKFerr(20:end))
plot(time(20:end-1)/3600,xsigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,xsigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("V_X Error [m/s]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])

subplot 312
hold on;
plot(time(20:end-1)/3600,yEKFerr(20:end))
plot(time(20:end-1)/3600,yUKFerr(20:end))
plot(time(20:end-1)/3600,ysigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,ysigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("V_Y Error [m/s]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])

subplot 313
hold on;
plot(time(20:end-1)/3600,zEKFerr(20:end))
plot(time(20:end-1)/3600,zUKFerr(20:end))
plot(time(20:end-1)/3600,zsigma_ekf(20:end-1),LineWidth=2)
plot(time(20:end-1)/3600,zsigma_ukf(20:end-1),LineWidth=2)
xlabel("Time [hr]")
ylabel("V_Z Error [m/s]")
legend(["EKF Mean","UKF Mean","EKF 1-\sigma","UKF 1-\sigma"])

