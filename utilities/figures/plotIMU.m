
xIMU = sim{32}.Values.Data(1,1,:);
yIMU = sim{32}.Values.Data(2,1,:);
zIMU = sim{32}.Values.Data(3,1,:);
magIMU = sqrt(xIMU.^2+yIMU.^2+zIMU.^2);

xEKF = sim{10}.Values.Data(:,19);
yEKF = sim{10}.Values.Data(:,20);
zEKF = sim{10}.Values.Data(:,21);
magEKF = sqrt(xEKF.^2+yEKF.^2+zEKF.^2);

xUKF = sim{13}.Values.Data(:,19);
yUKF = sim{13}.Values.Data(:,20);
zUKF = sim{13}.Values.Data(:,21);
magUKF = sqrt(xUKF.^2+yUKF.^2+zUKF.^2);

figure
hold on;
plot(time/3600,magIMU(:))
plot(time/3600,magEKF(:),Linewidth=2)
plot(time/3600,magUKF(:),"--",Linewidth=2)
xlabel("Time [hr]")
ylabel("[m/s^2]")
legend(["Measurement","EKF Bias","UKF Bias"])
