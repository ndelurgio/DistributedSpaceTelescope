close all
% xPosEKF = sim{10}.Values.Data(:,1);
% yPosEKF = sim{10}.Values.Data(:,2);
% zPosEKF = sim{10}.Values.Data(:,3);
xPosEKF = telem.("Mean Filter New")(:,1);
yPosEKF = telem.("Mean Filter New")(:,2);
zPosEKF = telem.("Mean Filter New")(:,3);

% xPosUKF = sim{13}.Values.Data(:,1);
% yPosUKF = sim{13}.Values.Data(:,2);
% zPosUKF = sim{13}.Values.Data(:,3);
xPosUKF = telem.("Mean Filter New")(:,1);
yPosUKF = telem.("Mean Filter New")(:,2);
zPosUKF = telem.("Mean Filter New")(:,3);

xPosTrue = telem.("Chief Cartesian State J2000.positionX_J2000_m");
yPosTrue = telem.("Chief Cartesian State J2000.positionY_J2000_m");
zPosTrue = telem.("Chief Cartesian State J2000.positionZ_J2000_m");

% xEKFerr = xPosEKF(2:end) - xPosTrue(1:end-1);
% yEKFerr = yPosEKF(2:end) - yPosTrue(1:end-1);
% zEKFerr = zPosEKF(2:end) - zPosTrue(1:end-1);
% 
% xUKFerr = xPosUKF(2:end) - xPosTrue(1:end-1);
% yUKFerr = yPosUKF(2:end) - yPosTrue(1:end-1);
% zUKFerr = zPosUKF(2:end) - zPosTrue(1:end-1);

xEKFerr = xPosEKF(3:end) - xPosTrue(1:end-2);
yEKFerr = yPosEKF(3:end) - yPosTrue(1:end-2);
zEKFerr = zPosEKF(3:end) - zPosTrue(1:end-2);

xUKFerr = xPosUKF(3:end) - xPosTrue(1:end-2);
yUKFerr = yPosUKF(3:end) - yPosTrue(1:end-2);
zUKFerr = zPosUKF(3:end) - zPosTrue(1:end-2);

xvar = telem.("Cov Filter New")(:,1,1);
xsigma_ekf = sqrt(xvar(:));

yvar = telem.("Cov Filter New")(:,2,2);
ysigma_ekf = sqrt(yvar(:));

zvar = telem.("Cov Filter New")(:,3,3);
zsigma_ekf = sqrt(zvar(:));

xvar = telem.("Cov Filter New")(:,1,1);
xsigma_ukf = sqrt(xvar(:));

yvar = telem.("Cov Filter New")(:,2,2);
ysigma_ukf = sqrt(yvar(:));

zvar = telem.("Cov Filter New")(:,3,3);
zsigma_ukf = sqrt(zvar(:));

figure
subplot 311
hold on;
area(time(20:end-1)/3600,3*xsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*xsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,xEKFerr(20:end)-mean(xEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("X Error [m]")
legend(["EKF 3-\sigma","","EKF Mean"])

subplot 312
hold on;
area(time(20:end-1)/3600,3*ysigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*ysigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,yEKFerr(20:end)-mean(yEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("Y Error [m]")
% legend(["EKF 3-\sigma","","EKF Mean"])

subplot 313
hold on;
area(time(20:end-1)/3600,3*zsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*zsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,zEKFerr(20:end)-mean(zEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("Z Error [m]")
% legend(["EKF 3-\sigma","","EKF Mean"])


figure
subplot 311
hold on;
area(time(20:end-1)/3600,3*xsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*xsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,xUKFerr(20:end)-mean(xUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("X Error [m]")
legend(["UKF 3-\sigma","","UKF Mean"])

subplot 312
hold on;
area(time(20:end-1)/3600,3*ysigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*ysigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,yUKFerr(20:end)-mean(yUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("Y Error [m]")
% legend(["UKF 3-\sigma","","UKF Mean"])

subplot 313
hold on;
area(time(20:end-1)/3600,3*zsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*zsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,zUKFerr(20:end)-mean(zUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("Z Error [m]")
% legend(["UKF 3-\sigma","","UKF Mean"])




xVelEKF = telem.("Mean Filter New")(:,4);
yVelEKF = telem.("Mean Filter New")(:,5);
zVelEKF = telem.("Mean Filter New")(:,6);

xVelUKF = telem.("Mean Filter New")(:,4);
yVelUKF = telem.("Mean Filter New")(:,5);
zVelUKF = telem.("Mean Filter New")(:,6);

xVelTrue = telem.("Chief Cartesian State J2000.velocityX_J2000_m");
yVelTrue = telem.("Chief Cartesian State J2000.velocityY_J2000_m");
zVelTrue = telem.("Chief Cartesian State J2000.velocityZ_J2000_m");

xEKFerr = xVelEKF(3:end) - xVelTrue(1:end-2);
yEKFerr = yVelEKF(3:end) - yVelTrue(1:end-2);
zEKFerr = zVelEKF(3:end) - zVelTrue(1:end-2);

xUKFerr = xVelUKF(3:end) - xVelTrue(1:end-2);
yUKFerr = yVelUKF(3:end) - yVelTrue(1:end-2);
zUKFerr = zVelUKF(3:end) - zVelTrue(1:end-2);

xvar = telem.("Cov Filter New")(:,4,4);
xsigma_ekf = sqrt(xvar(:));

yvar = telem.("Cov Filter New")(:,5,5);
ysigma_ekf = sqrt(yvar(:));

zvar = telem.("Cov Filter New")(:,6,6);
zsigma_ekf = sqrt(zvar(:));

xvar = telem.("Cov Filter New")(:,4,4);
xsigma_ukf = sqrt(xvar(:));

yvar = telem.("Cov Filter New")(:,5,5);
ysigma_ukf = sqrt(yvar(:));

zvar = telem.("Cov Filter New")(:,6,6);
zsigma_ukf = sqrt(zvar(:));

figure
subplot 311
hold on;
area(time(20:end-1)/3600,3*xsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*xsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,xEKFerr(20:end)-mean(xEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("V_x Error [m]")
legend(["EKF 3-\sigma","","EKF Mean"])

subplot 312
hold on;
area(time(20:end-1)/3600,3*ysigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*ysigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,yEKFerr(20:end)-mean(yEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("V_y Error [m]")
% legend(["EKF 3-\sigma","","EKF Mean"])

subplot 313
hold on;
area(time(20:end-1)/3600,3*zsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*zsigma_ekf(20:end-1),'FaceColor','b',FaceAlpha=0.2)
plot(time(20:end-2)/3600,zEKFerr(20:end)-mean(zEKFerr(20:end)),'b')
xlabel("Time [hr]")
ylabel("V_z Error [m]")
% legend(["EKF 3-\sigma","","EKF Mean"])


figure
subplot 311
hold on;
area(time(20:end-1)/3600,3*xsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*xsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,xUKFerr(20:end)-mean(xUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("V_x Error [m]")
legend(["UKF 3-\sigma","","UKF Mean"])

subplot 312
hold on;
area(time(20:end-1)/3600,3*ysigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*ysigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,yUKFerr(20:end)-mean(yUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("V_y Error [m]")
% legend(["UKF 3-\sigma","","UKF Mean"])

subplot 313
hold on;
area(time(20:end-1)/3600,3*zsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
area(time(20:end-1)/3600,-3*zsigma_ukf(20:end-1),'FaceColor','m',FaceAlpha=0.2)
plot(time(20:end-2)/3600,zUKFerr(20:end)-mean(zUKFerr(20:end)),'Color',[0.4940 0.1840 0.5560])
xlabel("Time [hr]")
ylabel("V_z Error [m]")
% legend(["UKF 3-\sigma","","UKF Mean"])

