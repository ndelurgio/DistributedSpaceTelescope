function plotGeoVsYA(telem)

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
axis equal
grid on
hold on;
title("Relative Position in T-R Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionY_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionX_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("T [m]")
ylabel("R [m]")

subplot(3, 1, 2)
axis equal
grid on
hold on;
title("Relative Position in N-R Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionZ_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionX_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("N [m]")
ylabel("R [m]")

subplot(3, 1, 3)
axis equal
grid on
hold on;
title("Relative Position in T-N Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionY_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.positionZ_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("T [m]")
ylabel("N [m]")
subplot(3, 1, 1)
plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])
subplot(3, 1, 2)
plot(telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])
subplot(3, 1, 3)
plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
axis equal
grid on
hold on;
title("Relative Velocity in T-R Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityY_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityX_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("T [m/s]")
ylabel("R [m/s]")

subplot(3, 1, 2)
axis equal
grid on
hold on;
title("Relative Velocity in N-R Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityZ_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityX_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("N [m/s]")
ylabel("R [m/s]")

subplot(3, 1, 3)
axis equal
grid on
hold on;
title("Relative Velocity in T-N Plane")
plot(telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityY_RTN_m")(2:end),telem.("Deputy Relative Cartesian State D'Amico ROE Map.velocityZ_RTN_m")(2:end),Color="black",LineWidth=1)
xlabel("T [m/s]")
ylabel("N [m/s]")
subplot(3, 1, 1)
plot(telem.("Deputy Relative Cartesian State RTN YA.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityX_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])
subplot(3, 1, 2)
plot(telem.("Deputy Relative Cartesian State RTN YA.velocityZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityX_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])
subplot(3, 1, 3)
plot(telem.("Deputy Relative Cartesian State RTN YA.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityZ_RTN_m"),LineWidth=1)
legend(["Geometric","Y-A"])

end