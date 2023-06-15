%% Plot Parametric ROEs for rho=50 m
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
ROEmat = ROEmat_all(1, :, :);
ROEmat = squeeze(ROEmat);
da = movmean(a*ROEmat(1,:),10);
dlam = movmean(a*ROEmat(2,:),10);
dex = movmean(a*ROEmat(3,:),10);
dey = movmean(a*ROEmat(4,:),10);
dix = movmean(a*ROEmat(5,:),10);
diy = movmean(a*ROEmat(6,:),10);

plot(dlam,da,'Color','blue',LineWidth=2)
scatter(dlam(1),da(1),'filled','green')
scatter(dlam(end),da(end),'filled','red')
grid on;
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

subplot(2,2,[3 4])
hold on;
plot(dex,dey,'Color','blue',LineWidth=2)
scatter(dex(1),dey(1),'filled','green')
scatter(dex(end),dey(end),'filled','red')
grid on;
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

subplot(2,2,2)
hold on;
plot(dix,diy,'Color','blue',LineWidth=2)
scatter(dix(1),diy(1),'filled','green')
scatter(dix(end),diy(end),'filled','red')
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

%% Plot Parametric ROEs for rho=250 m
figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
ROEmat = ROEmat_all(3, :, :);
ROEmat = squeeze(ROEmat);
da = movmean(a*ROEmat(1,:),10);
dlam = movmean(a*ROEmat(2,:),10);
dex = movmean(a*ROEmat(3,:),10);
dey = movmean(a*ROEmat(4,:),10);
dix = movmean(a*ROEmat(5,:),10);
diy = movmean(a*ROEmat(6,:),10);

plot(dlam,da,'Color','blue',LineWidth=2)
scatter(dlam(1),da(1),'filled','green')
scatter(dlam(end),da(end),'filled','red')
grid on;
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

subplot(2,2,[3 4])
hold on;
plot(dex,dey,'Color','blue',LineWidth=2)
scatter(dex(1),dey(1),'filled','green')
scatter(dex(end),dey(end),'filled','red')
grid on;
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

subplot(2,2,2)
hold on;
plot(dix,diy,'Color','blue',LineWidth=2)
scatter(dix(1),diy(1),'filled','green')
scatter(dix(end),diy(end),'filled','red')
grid on;
ylabel('$a\delta i_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta i_x$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

%% Plot delta V's for all rho values
figure
set(gcf,'Position',[100 100 900 600])
hold on
for rho_idx=1:length(rhos)
    plot(1:n_orbits, dv_all(rho_idx, :),LineWidth=2)
end
grid on
xlabel('Orbit Number',"FontSize",20)
ylabel('OSC $\Delta v$ [m/s]','Interpreter','latex',"FontSize",20)
legend(["$\|\rho_m \|_2=50$ [m]","$\|\rho_m \|_2=150$ [m]","$\|\rho_m \|_2=250$ [m]"],'Interpreter','latex',"FontSize",20)
ylim([0, 0.1])

%% Plot cumulative delta V's for all rho values
figure
set(gcf,'Position',[100 100 900 600])
hold on
for rho_idx=1:length(rhos)
    plot(1:n_orbits, cumsum(dv_all(rho_idx, :)),LineWidth=2)
end
grid on
xlabel('Orbit Number',"FontSize",20)
ylabel('OSC Cumulative $\Delta v$ [m/s]','Interpreter','latex',"FontSize",20)
legend(["$\|\rho_m \|_2=50$ [m]","$\|\rho_m \|_2=150$ [m]","$\|\rho_m \|_2=250$ [m]"],'Interpreter','latex',"FontSize",20)
