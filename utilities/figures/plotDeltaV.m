thrust = vecnorm(telem.("Thrust Vector"),2,2);
accel = thrust ./  telem.("Deputy Mass");
dv = dt*cumsum(accel);

figure
yyaxis left
plot(time/3600,dv,Linewidth=2)
ylabel("\Delta v")
yyaxis right
plot(time/3600,telem.("Deputy Mass"),Linewidth=2)
ylabel("Mass [kg]")
xlabel("t [hr]")
legend(["Accumulated \Delta v","CSC Mass"])