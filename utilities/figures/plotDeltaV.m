thrust_chief = vecnorm(telem.("Chief Thrust"),2,3) .* telem.("Chief Thrust Cmd");
T = plant.deputy.properties.actuators.thruster.thrust_N;
thrust_deputy = telem.("Deputy Thrust Cmd") * T;

accel_chief = thrust_chief ./  telem.("Chief Mass");
accel_deputy = thrust_deputy ./  telem.("Deputy Mass");

dv_chief = dt*cumsum(accel_chief);
dv_deputy = dt*cumsum(accel_deputy);

figure
% yyaxis left
hold on
% plot(time/3600, cumsum(vecnorm(telem.("accel"), 2, 2)))
plot(time/3600,dv_chief,Linewidth=2)
plot(time/3600,dv_deputy,Linewidth=2)
% yyaxis right
% plot(time/3600,telem.("Deputy Mass"),Linewidth=2)
% ylabel("Mass [kg]")
ylabel("\Deltav [m/s]")
xlabel("t [hr]")
% legend(["Accumulated \Delta v","CSC Mass"])
legend(["OSC", "CSC"])
