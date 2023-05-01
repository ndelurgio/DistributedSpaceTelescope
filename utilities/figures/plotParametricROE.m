a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
figure
hold on;
set(gca,"LineWidth",3)
set(gca,"GridLineWidth",1)
plot(a*telem.("Osculating D'Amico ROE True.relativeLongitude"),a*telem.("Osculating D'Amico ROE True.relativeSemiMajorAxis"),LineWidth=2)
axis equal;
grid on;
ylabel('$a\delta a$','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$','Interpreter','latex',"FontSize",20)