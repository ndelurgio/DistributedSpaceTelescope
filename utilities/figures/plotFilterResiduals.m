mu_EKF = sim{10}.Values.Data(:,1:6);
mu_EKF_prefit = sim{11}.Values.Data(:,1:6);
% mu_EKF_prefit = reshape(mu_EKF_prefit,length(mu_EKF_prefit(1,1,:)),length(mu_EKF_prefit(:,1,1)));
mu_UKF = sim{13}.Values.Data(:,1:6);
% mu_UKF_prefit = sim{14}.Values.Data(:,1,1:6);
mu_UKF_prefit = sim{14}.Values.Data(:,1:6);
% mu_UKF_prefit = reshape(mu_UKF_prefit,length(mu_UKF_prefit(1,1,:)),length(mu_UKF_prefit(:,1,1)));
% mu_UKF_prefit = mu_UKF_prefit(:,1:6);

xPosTrue = sim{17}.Values.positionX_J2000_m.Data(:);
yPosTrue = sim{17}.Values.positionY_J2000_m.Data(:);
zPosTrue = sim{17}.Values.positionZ_J2000_m.Data(:);
xVelTrue = sim{17}.Values.velocityX_J2000_m.Data(:);
yVelTrue = sim{17}.Values.velocityY_J2000_m.Data(:);
zVelTrue = sim{17}.Values.velocityZ_J2000_m.Data(:);

mu_True = [xPosTrue,yPosTrue,zPosTrue,xVelTrue,yVelTrue,zVelTrue];

xPosTrue = sim{20}.Values.positionX_J2000_m.Data(:);
yPosTrue = sim{20}.Values.positionY_J2000_m.Data(:);
zPosTrue = sim{20}.Values.positionZ_J2000_m.Data(:);
xVelTrue = sim{20}.Values.velocityX_J2000_m.Data(:);
yVelTrue = sim{20}.Values.velocityY_J2000_m.Data(:);
zVelTrue = sim{20}.Values.velocityZ_J2000_m.Data(:);

mu_dep = [xPosTrue,yPosTrue,zPosTrue,xVelTrue,yVelTrue,zVelTrue];

dif = mu_True-mu_dep;

chiefEst = sim{13}.Values.Data(:,1:6);
depEst = sim{13}.Values.Data(:,7:12);
dif_est = depEst - chiefEst;

r_EKF_prefit = vecnorm(mu_EKF_prefit(2:end,:)-mu_True(1:end-1,:),2,2);
r_EKF_postfit = vecnorm(mu_EKF(2:end,:)-mu_True(1:end-1,:),2,2);
r_UKF_prefit = vecnorm(mu_UKF_prefit(2:end,:)-mu_True(1:end-1,:),2,2);
r_UKF_postfit = vecnorm(mu_UKF(2:end,:)-mu_True(1:end-1,:),2,2);

figure
hold on;
plot(time(21:end)/3600,r_EKF_prefit(20:end)-250)
plot(time(21:end)/3600,r_EKF_postfit(20:end)-250)
xlabel("Time [hr]")
ylabel("EKF Residual")
legend(["Pre-fit","Post-fit"])

figure
hold on;
plot(time(21:end)/3600,r_UKF_prefit(20:end)-250)
plot(time(21:end)/3600,r_UKF_postfit(20:end)-250)
xlabel("Time [hr]")
ylabel("UKF Residual")
legend(["Pre-fit","Post-fit"])