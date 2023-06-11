da_true = a*telem.("Mean Eccentric Singular ROE True.relativeSemiMajorAxis");
dlam_true = a*telem.("Mean Eccentric Singular ROE True.relativeLongitude");
dex_true = a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityX");
dey_true = a*telem.("Mean Eccentric Singular ROE True.relativeEccentricityY");
dix_true = a*telem.("Mean Eccentric Singular ROE True.relativeInclinationX");
diy_true = a*telem.("Mean Eccentric Singular ROE True.relativeInclinationY");

da_nav = a*telem.("Deputy ROE Esimtate.signal1");
dlam_nav = a*telem.("Deputy ROE Esimtate.signal2");
dex_nav = a*telem.("Deputy ROE Esimtate.signal3");
dey_nav = a*telem.("Deputy ROE Esimtate.signal4");
dix_nav = a*telem.("Deputy ROE Esimtate.signal5");
diy_nav = a*telem.("Deputy ROE Esimtate.signal6");

figure
set(gcf,'Position',[100 100 1200 800])
subplot(3,2,1)
% title('$a\delta a$','Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,da_nav-da_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel('Error $a\delta a$ [m]','Interpreter','latex',"FontSize",20)

subplot(3,2,2)
% title("$a\delta \lambda$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,dlam_nav-dlam_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $a\delta \lambda$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,3)
% title("$a\delta e_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,dex_nav-dex_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $a\delta e_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,4)
% title("$a\delta e_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,dey_nav-dey_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $a\delta e_y$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,5)
% title("$a\delta i_x$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,dix_nav-dix_true,LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $a\delta i_x$ [m]",'Interpreter','latex',"FontSize",20)

subplot(3,2,6)
% title("$a\delta i_y$",'Interpreter','latex',"FontSize",20)
grid on;
hold on;
plot(time,(diy_nav-diy_true),LineWidth=2)
% legend(["SRP & Secular J2","Only Secular J2"])
xlabel("t [hr]")
ylabel("Error $a\delta i_y$ [m]",'Interpreter','latex',"FontSize",20)