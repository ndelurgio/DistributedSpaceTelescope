hkepmag = vecnorm([telem.("KeplerAngMomentumVector")(:,1),telem.("KeplerAngMomentumVector")(:,2),telem.("KeplerAngMomentumVector")(:,3)],2,2);
hpermag = vecnorm([telem.("PerturbedAngMomentumVector")(:,1),telem.("PerturbedAngMomentumVector")(:,2),telem.("PerturbedAngMomentumVector")(:,3)],2,2);

figure
set(gcf,'position',[300,300,800,800])
% hold on;
subplot(4,1,1)
hold on;
title("X Angular Momentum Component vs Time")
plot(time/3600,telem.("KeplerAngMomentumVector")(:,1)./hkepmag,"LineWidth",1)
plot(time/3600,telem.("PerturbedAngMomentumVector")(:,1)./hpermag,"LineWidth",1)
legend("Unperturbed","J2 Perturbed")
xlabel("t [hr]")
ylabel("h_X")
grid on;

subplot(4,1,2)
hold on;
title("Y Angular Momentum Component vs Time")
plot(time/3600,telem.("KeplerAngMomentumVector")(:,2)./hkepmag,"LineWidth",1)
plot(time/3600,telem.("PerturbedAngMomentumVector")(:,2)./hpermag,"LineWidth",1)
legend("Unperturbed","J2 Perturbed")
xlabel("t [hr]")
ylabel("h_Y")
grid on;

subplot(4,1,3)
hold on;
title("Z Angular Momentum Component vs Time")
plot(time/3600,telem.("KeplerAngMomentumVector")(:,3)./hkepmag,"LineWidth",1)
plot(time/3600,telem.("PerturbedAngMomentumVector")(:,3)./hpermag,"LineWidth",1)
legend("Unperturbed","J2 Perturbed")
xlabel("t [hr]")
ylabel("h_Z")
grid on;

subplot(4,1,4)
hold on;
title("Angular Momentum Magnitude vs Time")
plot(time/3600,hkepmag,"LineWidth",1)
plot(time/3600,hpermag,"LineWidth",1)
legend("Unperturbed","J2 Perturbed")
xlabel("t [hr]")
ylabel("||H|| [m^2/s]")
grid on;

clear hmag