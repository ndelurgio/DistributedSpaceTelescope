a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
scatter(a*telem.("Mean Eccentric Singular ROE True.relativeLongitude")(1),a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(1),'green','filled')
plot(a*telem.("Mean Eccentric Singular ROE True.relativeLongitude")(telem.("Thrust Cmd") == 0),a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Thrust Cmd") == 0),'Color','blue',LineWidth=2)
plot(a*telem.("Mean Eccentric Singular ROE True.relativeLongitude")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
legend(["Start","Drift","Maneuver"])

subplot(2,2,[3 4])
hold on;
scatter(a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX")(1),a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY")(1),'green','filled')
plot(a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX")(telem.("Thrust Cmd") == 0),a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY")(telem.("Thrust Cmd") == 0),'Color','blue',LineWidth=2)
plot(a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["Start","Drift","Maneuver"])

subplot(2,2,2)
hold on;
scatter(a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX")(1),a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY")(1),'green','filled')
plot(a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX")(telem.("Thrust Cmd") == 0),a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY")(telem.("Thrust Cmd") == 0),'Color','blue',LineWidth=2)
plot(a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX")(telem.("Thrust Cmd") == 1),a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY")(telem.("Thrust Cmd") == 1),'Color','red',LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["Start","Drift","Maneuver"])
