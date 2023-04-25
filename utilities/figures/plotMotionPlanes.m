function plotMotionPlanes(telem,linearModel)

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
axis equal
grid on
hold on;
title("Relative Motion in T-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionX_RTN_m"))
xlabel("T [m]")
ylabel("R [m]")

subplot(3, 1, 2)
axis equal
grid on
hold on;
title("Relative Motion in N-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionX_RTN_m"))
xlabel("N [m]")
ylabel("R [m]")

subplot(3, 1, 3)
axis equal
grid on
hold on;
title("Relative Motion in T-N Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionZ_RTN_m"))
xlabel("T [m]")
ylabel("N [m]")
switch linearModel
    case "YA"
        subplot(3, 1, 1)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"))
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 2)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"))
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 3)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"))
        legend(["Nonlinear","Linear Y-A"])
    case "HCW"
        subplot(3, 1, 1)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.positionX_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
        subplot(3, 1, 2)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.positionX_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
        subplot(3, 1, 3)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.positionZ_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
end