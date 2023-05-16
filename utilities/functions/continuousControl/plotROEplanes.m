a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
plot(a*deputyROE(:,2),a*deputyROE(:,1),'Color','blue',LineWidth=2)
plot(a*simROE(:,2),a*simROE(:,1),'Color','red',LineWidth=2)
% plot(a*roeMatrix(:,2),a*roeMatrix(:,1),'Color','red',LineWidth=2)
% plot(a*telem.("Mean Eccentric Singular ROE True.relativeLongitude")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])

subplot(2,2,[3 4])
hold on;
plot(a*deputyROE(:,3),a*deputyROE(:,4),'Color','blue',LineWidth=2)% plot(a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
plot(a*simROE(:,3),a*simROE(:,4),'Color','red',LineWidth=2)

axis equal;
grid on;
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])plot(a*trajROE(:,2),a*trajROE(:,1),'Color','red',LineWidth=2)plot(a*trajROE(:,2),a*trajROE(:,1),'Color','red',LineWidth=2)plot(a*trajROE(:,3),a*trajROE(:,4),'Color','red',LineWidth=2)


subplot(2,2,2)
hold on;
plot(a*deputyROE(:,5),a*deputyROE(:,6),'Color','blue',LineWidth=2)% plot(a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
plot(a*simROE(:,5),a*simROE(:,6),'Color','red',LineWidth=2)

axis equal;
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
% legend(["Start","Drift","Maneuver"])
