a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
plot(a*deputyROE(:,2),a*deputyROE(:,1),'Color','blue',LineWidth=2)
% scatter(a*deputyROE(1,2),a*deputyROE(1,1),'filled','MarkerFaceColor','red')
% scatter(a*deputyROE(end,2),a*deputyROE(end,1),'filled','MarkerFaceColor','magenta')
% legend(["Deputy Trajectory","Start","Finish"],'Location','northwest')
plot(a*roe(2,:),a*roe(1,:),'Color','red',LineWidth=2)
plot(a*telem.("Chief Mean Eccentric Singular ROE True.relativeLongitude")(telem.("Chief Thrust Cmd") == 1),a*telem.("Chief Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Chief Thrust Cmd") == 1),'Color','yellow',LineWidth=2)
scatter(a*deputyROE(1:steps:end,2),a*deputyROE(1:steps:end,1),'filled','magenta')
legend(["Deputy Command","Deputy Trajectory","Nonlinear","Waypoints"])
% plot(a*roeMatrix(:,2),a*roeMatrix(:,1),'Color','red',LineWidth=2)
% plot(a*telem.("Mean Eccentric Singular ROE True.relativeLongitude")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
% axis equal;
grid on;
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])

subplot(2,2,[3 4])
hold on;
plot(a*deputyROE(:,3),a*deputyROE(:,4),'Color','blue',LineWidth=2)% plot(a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
% scatter(a*deputyROE(1,3),a*deputyROE(1,4),'filled','MarkerFaceColor','red')
% scatter(a*deputyROE(end,3),a*deputyROE(end,4),'filled','MarkerFaceColor','magenta')
% legend(["Deputy Trajectory","Start","Finish"],'Location','southwest')
plot(a*roe(3,:),a*roe(4,:),'Color','red',LineWidth=2)
plot(a*telem.("Chief Mean Eccentric Singular ROE True.relativeEccentricityX")(telem.("Chief Thrust Cmd") == 1),a*telem.("Chief Mean Eccentric Singular ROE True.relativeEccentricityY")(telem.("Chief Thrust Cmd") == 1),'Color','yellow',LineWidth=2)
scatter(a*deputyROE(1:steps:end,3),a*deputyROE(1:steps:end,4),'filled','magenta')
legend(["Deputy Command","Deputy Trajectory","Nonlinear","Waypoints"])
% axis equal;
grid on;
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])plot(a*trajROE(:,2),a*trajROE(:,1),'Color','red',LineWidth=2)plot(a*trajROE(:,2),a*trajROE(:,1),'Color','red',LineWidth=2)plot(a*trajROE(:,3),a*trajROE(:,4),'Color','red',LineWidth=2)


subplot(2,2,2)
hold on;
plot(a*deputyROE(:,5),a*deputyROE(:,6),'Color','blue',LineWidth=2)% plot(a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
% scatter(a*deputyROE(1,5),a*deputyROE(1,6),'filled','MarkerFaceColor','red')
% scatter(a*deputyROE(end,5),a*deputyROE(end,6),'filled','MarkerFaceColor','magenta')
% legend(["Deputy Trajectory","Start","Finish"],'Location','northwest')
plot(a*roe(5,:),a*roe(6,:),'Color','red',LineWidth=2)
plot(a*telem.("Chief Mean Eccentric Singular ROE True.relativeInclinationX")(telem.("Chief Thrust Cmd") == 1),a*telem.("Chief Mean Eccentric Singular ROE True.relativeInclinationY")(telem.("Chief Thrust Cmd") == 1),'Color','yellow',LineWidth=2)
scatter(a*deputyROE(1:steps:end,5),a*deputyROE(1:steps:end,6),'filled','magenta')
legend(["Deputy Command","Deputy Trajectory","Nonlinear","Waypoints"])
% axis equal;
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])
