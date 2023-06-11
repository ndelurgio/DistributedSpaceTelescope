a_true = telem.("Osculating Chief Orbital Elements.semiMajorAxis_m");
e_true = telem.("Osculating Chief Orbital Elements.eccentricity");
i_true = telem.("Osculating Chief Orbital Elements.inclination_rad");
Om_true = telem.("Osculating Chief Orbital Elements.longitudeAscendingNode_rad");
w_true = telem.("Osculating Chief Orbital Elements.argumentPerigee_rad");
M_true = telem.("Osculating Chief Orbital Elements.MeanAnomaly_rad");

a_nav = telem.("Chief OE Estimate.signal1");
e_nav = telem.("Chief OE Estimate.signal2");
i_nav = telem.("Chief OE Estimate.signal3");
Om_nav = telem.("Chief OE Estimate.signal4");
w_nav = telem.("Chief OE Estimate.signal5");
M_nav = telem.("Chief OE Estimate.M");

figure
set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
% title('$a\delta a$','Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,a_nav-a_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('Error $a$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,2)
% title("$a\delta \lambda$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,e_nav-e_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $e$",'Interpreter','latex',"FontSize",20)

subplot(3,2,3)
% title("$a\delta e_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,rad2deg(i_nav-i_true),LineWidth=2)% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $i$ [deg]",'Interpreter','latex',"FontSize",20)

subplot(3,2,4)
% title("$a\delta e_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,rad2deg(Om_nav-Om_true),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $\Omega$ [deg]",'Interpreter','latex',"FontSize",20)

subplot(3,2,5)
% title("$a\delta i_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,rad2deg(w_nav-w_true),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $\omega$ [deg]",'Interpreter','latex',"FontSize",20)

subplot(3,2,6)
% title("$a\delta i_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,rad2deg(M_nav-M_true),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $M$ [deg]",'Interpreter','latex',"FontSize",20)