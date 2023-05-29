%% Plot position measurement error
figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
grid on
hold on;
title("X Position Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Pos")(2:end, 1)-telem.("Chief Cartesian State J2000.positionX_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m]")

subplot(3, 1, 2)
grid on
hold on;
title("Y Position Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Pos")(2:end, 2)-telem.("Chief Cartesian State J2000.positionY_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m]")

subplot(3, 1, 3)
grid on
hold on;
title("Z Position Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Pos")(2:end, 3)-telem.("Chief Cartesian State J2000.positionZ_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m]")

%% Plot velocity measurement error
figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
grid on
hold on;
title("X Velocity Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Vel")(2:end, 1)-telem.("Chief Cartesian State J2000.velocityX_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m/s]")

subplot(3, 1, 2)
grid on
hold on;
title("Y Velocity Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Vel")(2:end, 2)-telem.("Chief Cartesian State J2000.velocityY_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m/s]")

subplot(3, 1, 3)
grid on
hold on;
title("Z Velocity Measurement Error")
plot(time(2:end)/3600, (telem.("Chief GPS Vel")(2:end, 3)-telem.("Chief Cartesian State J2000.velocityZ_J2000_m")(2:end)))
xlabel("t [hr]")
ylabel("Error [m/s]")
