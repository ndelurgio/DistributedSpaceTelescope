
figure
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
title("Relative Semi-Major Axis")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeSemiMajorAxis"),LineWidth=2)
xlabel("t [hr]")
ylabel('$a\delta a$ [m]','Interpreter','latex','FontSize',15)

subplot(3,2,2)
title("Relative Longitude")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeLongitude"),LineWidth=2)
xlabel("t [hr]")
ylabel("$a\delta \lambda$ [m]",'Interpreter','latex','FontSize',15)

subplot(3,2,3)
title("Relative X Eccentricity")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeEccentricityX"),LineWidth=2)
xlabel("t [hr]")
ylabel("$a\delta e_x$ [m]",'Interpreter','latex','FontSize',15)

subplot(3,2,4)
title("Relative Y Eccentricity")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeEccentricityY"),LineWidth=2)
xlabel("t [hr]")
ylabel("$a\delta e_y$ [m]",'Interpreter','latex','FontSize',15)

subplot(3,2,5)
title("Relative X Inclination")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeInclinationX"),LineWidth=2)
xlabel("t [hr]")
ylabel("$a\delta i_x$ [m]",'Interpreter','latex','FontSize',15)

subplot(3,2,6)
title("Relative Y Inclindation")
grid on;
hold on;
plot(time/3600,a*telem.("Mean D'Amico ROE True.relativeInclinationY"),LineWidth=2)
xlabel("t [hr]")
ylabel("$a\delta i_y$ [m]",'Interpreter','latex','FontSize',15)

clear a