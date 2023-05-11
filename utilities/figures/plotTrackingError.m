% Plotting the control tracking error

close all
figure
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
set(gcf,'Position',[100 100 1200 800])
% subplot(3,1,1)
grid on;
hold on;
delta_a = telem.("Osculating Eccentric Singular ROE True.relativeSemiMajorAxis");
delta_ix = telem.("Osculating Eccentric Singular ROE True.relativeInclinationX");
delta_iy = telem.("Osculating Eccentric Singular ROE True.relativeInclinationY");
plot(time(1:180000)/3600,a*abs(telem.("Osculating Eccentric Singular ROE True.relativeSemiMajorAxis")(1:180000) - 0),LineWidth=2)
plot(time(1:180000)/3600,a*abs(sqrt(2)*4e-6 - vecnorm([delta_ix(1:180000) - delta_ix(1), delta_iy(1:180000) - delta_iy(1)], 2, 2)),LineWidth=2)
% legend("$|a\delta a - a\delta a_{\mathrm{des}}|$", "$|a \| \delta i_f - \delta i_0 \| - a\delta i_{\mathrm{des}}|$",'Interpreter','latex', "FontSize", 15)
legend("$a\delta a$", "$a\delta i$",'Interpreter','latex', "FontSize", 15)
xlabel("t [hr]")
% ylabel("$|a\delta \mathbf{\alpha} - a\delta \mathbf{\alpha}_{\mathrm{des}}|$ [m]",'Interpreter','latex', "FontSize",20)
ylabel("Tracking Error [m]")
grid on;

