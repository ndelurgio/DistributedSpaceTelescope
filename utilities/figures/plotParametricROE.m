a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
hold on;
set(gca,"LineWidth",3)
plot(a*telem.("Osculating D'Amico ROE True.relativeLongitude"),a*telem.("Osculating D'Amico ROE True.relativeSemiMajorAxis"),LineWidth=2)
axis equal;
grid on;