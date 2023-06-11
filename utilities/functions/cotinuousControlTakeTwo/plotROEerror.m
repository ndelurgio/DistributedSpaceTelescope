figure
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
t = time(telem.("Chief Thrust Cmd") == 1)/3600;
n = floor(length(t)/6);
da = -telem.("Osculating Eccentric Singular ROE True.relativeSemiMajorAxis")(telem.("Chief Thrust Cmd") == 1);
dlam = -telem.("Osculating Eccentric Singular ROE True.relativeLongitude")(telem.("Chief Thrust Cmd") == 1);
dex = -telem.("Osculating Eccentric Singular ROE True.relativeEccentricityX")(telem.("Chief Thrust Cmd") == 1);
dey = -telem.("Osculating Eccentric Singular ROE True.relativeEccentricityY")(telem.("Chief Thrust Cmd") == 1);
dix = -telem.("Osculating Eccentric Singular ROE True.relativeInclinationX")(telem.("Chief Thrust Cmd") == 1);
diy = -telem.("Osculating Eccentric Singular ROE True.relativeInclinationY")(telem.("Chief Thrust Cmd") == 1);

set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
% title('$a\delta a$','Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),abs(a*(da(1:6:length(roe_mat)*6)-roe_mat(1,:)')),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,2)
% title("$a\delta \lambda$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),abs(a*(dlam(1:6:length(roe_mat)*6)-roe_mat(2,:)')),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta \lambda$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,3)
% title("$a\delta e_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),abs(a*(dex(1:6:length(roe_mat)*6)-roe_mat(3,:)')),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta e_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,4)
% title("$a\delta e_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),abs(a*(dey(1:6:length(roe_mat)*6)-roe_mat(4,:)')),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta e_y$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,5)
% title("$a\delta i_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),abs(a*(dix(1:6:length(roe_mat)*6)-roe_mat(5,:)')),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta i_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,6)
% title("$a\delta i_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t(1:6:length(roe_mat)*6),a*(diy(1:6:length(roe_mat)*6)-roe_mat(6,:)'),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta i_y$ [m]",'Interpreter','latex',"FontSize",20)

clear a




figure
a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
t = time/3600;
n = floor(length(t)/6);
da = -telem.("Osculating Eccentric Singular ROE True.relativeSemiMajorAxis");
dlam = -telem.("Osculating Eccentric Singular ROE True.relativeLongitude");
dex = -telem.("Osculating Eccentric Singular ROE True.relativeEccentricityX");
dey = -telem.("Osculating Eccentric Singular ROE True.relativeEccentricityY");
dix = -telem.("Osculating Eccentric Singular ROE True.relativeInclinationX");
diy = -telem.("Osculating Eccentric Singular ROE True.relativeInclinationY");

set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
% title('$a\delta a$','Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*da,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,2)
% title("$a\delta \lambda$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*dlam,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta \lambda$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,3)
% title("$a\delta e_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*dex,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta e_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,4)
% title("$a\delta e_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*dey,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta e_y$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,5)
% title("$a\delta i_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*dix,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta i_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,6)
% title("$a\delta i_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(t,a*diy,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("$a\delta i_y$ [m]",'Interpreter','latex',"FontSize",20)

clear a