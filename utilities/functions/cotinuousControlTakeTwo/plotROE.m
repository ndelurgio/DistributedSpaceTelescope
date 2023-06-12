
figure
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
% title('$a\delta a$','Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis"))
% plot(time(1:end-1)/3600,a*deputyROE(:,1),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(1,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,1),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','southeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeSemiMajorAxis"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,2)
% title("$a\delta \lambda$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeLongitude"))
% plot(time(1:end-1)/3600,a*deputyROE(:,2),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(2,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,2),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','southeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeLongitude"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,3)
% title("$a\delta e_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX"))
% plot(time(1:end-1)/3600,a*deputyROE(:,3),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(3,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,3),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','northeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeEccentricityX"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,4)
% title("$a\delta e_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY"))
% plot(time(1:end-1)/3600,a*deputyROE(:,4),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(4,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,4),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','southeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeEccentricityY"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,5)
% title("$a\delta i_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX"))
% plot(time(1:end-1)/3600,a*deputyROE(:,5),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(5,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,5),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','southeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeInclinationX"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,6)
% title("$a\delta i_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time/3600, a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY"))
% plot(time(1:end-1)/3600,a*deputyROE(:,6),LineWidth=2)
% plot(time(1:length(roe(1,:)))/3600,a*roe(6,:),LineWidth=2)
% scatter(time(1:steps:end-1)/3600,a*deputyROE(1:steps:end,6),'filled','magenta')
% legend(["Deputy Command","Deputy Trajectory","Waypoints"],'Location','southeast')
% plot(time/3600,a*telem.("Eccentric ROE Secular J2.relativeInclinationY"),LineWidth=2,LineStyle="--")
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)

clear a