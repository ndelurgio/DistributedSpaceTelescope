
dex = telem.("Osculating Eccentric Singular ROE True.relativeEccentricityX");
dey = telem.("Osculating Eccentric Singular ROE True.relativeEccentricityY");
dix = telem.("Osculating Eccentric Singular ROE True.relativeInclinationX");
diy = telem.("Osculating Eccentric Singular ROE True.relativeInclinationY");
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
p = 1 + plant.chief.initialConditions.meanOrbitElements.eccentricity;

dr = [];
for i = 1:length(dex)
    de = [dex(i),dey(i)];
    di = [dix(i),diy(i)];
    min_sep = sqrt(2)*a*abs(dot(de,di/p)) / sqrt(norm(de)^2 + norm(di/p)^2 + dot(abs(de+di/p), abs(de-di/p)));
    dr = [dr, min_sep];
end

figure
plot(time/3600,dr)
xlabel("t [hr]")
ylabel("Min Sep [m]")