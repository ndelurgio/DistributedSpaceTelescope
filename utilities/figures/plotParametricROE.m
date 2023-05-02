a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
plot(a*telem.("Osculating D'Amico ROE True.relativeLongitude"),a*telem.("Osculating D'Amico ROE True.relativeSemiMajorAxis"),LineWidth=2)
plot(a*telem.("Mean D'Amico ROE True.relativeLongitude"),a*telem.("Mean D'Amico ROE True.relativeSemiMajorAxis"),LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
legend(["Osculating","Mean"])

subplot(2,2,[3 4])
hold on;
plot(a*telem.("Osculating D'Amico ROE True.relativeEccentricityX"),a*telem.("Osculating D'Amico ROE True.relativeEccentricityY"),LineWidth=2)
plot(a*telem.("Mean D'Amico ROE True.relativeEccentricityX"),a*telem.("Mean D'Amico ROE True.relativeEccentricityY"),LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["Osculating","Mean"])

subplot(2,2,2)
hold on;
plot(a*telem.("Osculating D'Amico ROE True.relativeInclinationX"),a*telem.("Osculating D'Amico ROE True.relativeInclinationY"),LineWidth=2)
plot(a*telem.("Mean D'Amico ROE True.relativeInclinationX"),a*telem.("Mean D'Amico ROE True.relativeInclinationY"),LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["Osculating","Mean"])