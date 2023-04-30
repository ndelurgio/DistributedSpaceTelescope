function plotMotionPlanes(telem,linearModel)

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
axis equal
grid on
hold on;
title("Relative Position in T-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionX_RTN_m"),Color="black",LineWidth=3)
xlabel("T [m]")
ylabel("R [m]")


subplot(3, 1, 2)
axis equal
grid on
hold on;
title("Relative Position in N-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionX_RTN_m"),Color="black",LineWidth=3)
xlabel("N [m]")
ylabel("R [m]")

subplot(3, 1, 3)
axis equal
grid on
hold on;
title("Relative Position in T-N Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionZ_RTN_m"),Color="black",LineWidth=3)
xlabel("T [m]")
ylabel("N [m]")
switch linearModel
    case "YA"
        subplot(3, 1, 1)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"),LineWidth=3)
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 2)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionX_RTN_m"),LineWidth=3)
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 3)
        plot(telem.("Deputy Relative Cartesian State RTN YA.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.positionZ_RTN_m"),LineWidth=3)
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
    case "Guffanti"
        subplot(3, 1, 1)
        plot(telem.("Relative State RTN Guffanti Singular.positionY_RTN_m"),telem.("Relative State RTN Guffanti Singular.positionX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 2)
        plot(telem.("Relative State RTN Guffanti Singular.positionZ_RTN_m"),telem.("Relative State RTN Guffanti Singular.positionX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 3)
        plot(telem.("Relative State RTN Guffanti Singular.positionY_RTN_m"),telem.("Relative State RTN Guffanti Singular.positionZ_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
    case "Guffanti QNS"
        subplot(3, 1, 1)
        plot(telem.("Relative State RTN Guffanti QNS.positionY_RTN_m"),telem.("Relative State RTN Guffanti QNS.positionX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 2)
        plot(telem.("Relative State RTN Guffanti QNS.positionZ_RTN_m"),telem.("Relative State RTN Guffanti QNS.positionX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 3)
        plot(telem.("Relative State RTN Guffanti QNS.positionY_RTN_m"),telem.("Relative State RTN Guffanti QNS.positionZ_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
end

figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
axis equal
grid on
hold on;
title("Relative Velocity in T-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityX_RTN_m"),Color="black",LineWidth=3)
xlabel("T [m/s]")
ylabel("R [m/s]")

subplot(3, 1, 2)
axis equal
grid on
hold on;
title("Relative Velocity in N-R Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityX_RTN_m"),Color="black",LineWidth=3)
xlabel("N [m/s]")
ylabel("R [m/s]")

subplot(3, 1, 3)
axis equal
grid on
hold on;
title("Relative Velocity in T-N Plane")
plot(telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.velocityZ_RTN_m"),Color="black",LineWidth=3)
xlabel("T [m/s]")
ylabel("N [m/s]")
switch linearModel
    case "YA"
        subplot(3, 1, 1)
        plot(telem.("Deputy Relative Cartesian State RTN YA.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityX_RTN_m"),LineWidth=3)
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 2)
        plot(telem.("Deputy Relative Cartesian State RTN YA.velocityZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityX_RTN_m"),LineWidth=3)
        legend(["Nonlinear","Linear Y-A"])
        subplot(3, 1, 3)
        plot(telem.("Deputy Relative Cartesian State RTN YA.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN YA.velocityZ_RTN_m"),LineWidth=3)
        legend(["Nonlinear","Linear Y-A"])
    case "HCW"
        subplot(3, 1, 1)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.velocityX_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
        subplot(3, 1, 2)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.velocityZ_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.velocityX_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
        subplot(3, 1, 3)
        plot(telem.("Deputy Relative Cartesian State RTN HCW.velocityY_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.velocityZ_RTN_m"))
        legend(["Nonlinear","Linear HCW"])
    case "Guffanti Singular"
        subplot(3, 1, 1)
        plot(telem.("Relative State RTN Guffanti Singular.velocityY_RTN_m"),telem.("Relative State RTN Guffanti Singular.velocityX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 2)
        plot(telem.("Relative State RTN Guffanti Singular.velocityZ_RTN_m"),telem.("Relative State RTN Guffanti Singular.velocityX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 3)
        plot(telem.("Relative State RTN Guffanti Singular.velocityY_RTN_m"),telem.("Relative State RTN Guffanti Singular.velocityZ_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
    case "Guffanti QNS"
        subplot(3, 1, 1)
        plot(telem.("Relative State RTN Guffanti QNS.velocityY_RTN_m"),telem.("Relative State RTN Guffanti QNS.velocityX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 2)
        plot(telem.("Relative State RTN Guffanti QNS.velocityZ_RTN_m"),telem.("Relative State RTN Guffanti QNS.velocityX_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
        subplot(3, 1, 3)
        plot(telem.("Relative State RTN Guffanti QNS.velocityY_RTN_m"),telem.("Relative State RTN Guffanti QNS.velocityZ_RTN_m"),LineStyle="--",LineWidth=3)
        legend(["Nonlinear","Linear"])
end

end