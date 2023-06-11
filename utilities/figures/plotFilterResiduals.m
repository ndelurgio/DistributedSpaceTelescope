mu_EKF = telem.("Mean Filter New")(:, 1:6);
mu_EKF_prefit = telem.("Prefit mu Filter")(:, 1:6);
mu_UKF = telem.("Mean Filter New")(:, 1:6);
mu_UKF_prefit = telem.("Prefit mu Filter")(:, 1:6);

xPosTrue = telem.("Chief Cartesian State J2000.positionX_J2000_m");
yPosTrue = telem.("Chief Cartesian State J2000.positionY_J2000_m");
zPosTrue = telem.("Chief Cartesian State J2000.positionZ_J2000_m");
xVelTrue = telem.("Chief Cartesian State J2000.velocityX_J2000_m");
yVelTrue = telem.("Chief Cartesian State J2000.velocityY_J2000_m");
zVelTrue = telem.("Chief Cartesian State J2000.velocityZ_J2000_m");

mu_True = [xPosTrue,yPosTrue,zPosTrue,xVelTrue,yVelTrue,zVelTrue];

% xPosTrue = sim{20}.Values.positionX_J2000_m.Data(:);
% yPosTrue = sim{20}.Values.positionY_J2000_m.Data(:);
% zPosTrue = sim{20}.Values.positionZ_J2000_m.Data(:);
% xVelTrue = sim{20}.Values.velocityX_J2000_m.Data(:);
% yVelTrue = sim{20}.Values.velocityY_J2000_m.Data(:);
% zVelTrue = sim{20}.Values.velocityZ_J2000_m.Data(:);

% mu_dep = [xPosTrue,yPosTrue,zPosTrue,xVelTrue,yVelTrue,zVelTrue];

% dif = mu_True-mu_dep;

% chiefEst = sim{13}.Values.Data(:,1:6);
% depEst = sim{13}.Values.Data(:,7:12);
% dif_est = depEst - chiefEst;

r_EKF_prefit = vecnorm(mu_EKF_prefit(2:end,:)-mu_True(1:end-1,:),2,2);
r_EKF_postfit = vecnorm(mu_EKF(3:end,:)-mu_True(1:end-2,:),2,2);
r_UKF_prefit = vecnorm(mu_UKF_prefit(2:end,:)-mu_True(1:end-1,:),2,2);
r_UKF_postfit = vecnorm(mu_UKF(3:end,:)-mu_True(1:end-2,:),2,2);

% figure
% hold on;
% % plot(time(21:end)/3600,r_EKF_prefit(20:end)-250)
% % plot(time(22:end)/3600,r_EKF_postfit(20:end)-250)
% scatter(time(21:end)/3600,r_EKF_prefit(20:end)-250, '.')
% scatter(time(22:end)/3600,r_EKF_postfit(20:end)-250, '.')
% xlabel("Time [hr]")
% ylabel("Residual")
% legend(["Pre-fit","Post-fit"])

figure
hold on;
% plot(time(21:end)/3600,r_UKF_prefit(20:end)-250)
% plot(time(22:end)/3600,r_UKF_postfit(20:end)-250)
scatter(time(21:end)/3600,r_UKF_prefit(20:end)-200, '.')
scatter(time(22:end)/3600,r_UKF_postfit(20:end)-200, '.')
xlabel("Time [hr]")
ylabel("Residual")
legend(["Pre-fit","Post-fit"])
