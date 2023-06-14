figure
set(gcf,'Position',[100 100 900 900])
subplot(2,2,1)
hold on;
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
ylabel('$a\delta a$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta \lambda$ [m]','Interpreter','latex',"FontSize",20)
legend(["ROE","Start","End"])

subplot(2,2,[3 4])
hold on;
plot(dex,dey,'Color','blue',LineWidth=2)
scatter(dex(1),dey(1),'filled','green')
scatter(dex(end),dey(end),'filled','red')
grid on;
ylabel('$a\delta e_y$ [m]','Interpreter','latex',"FontSize",20)
xlabel('$a\delta e_x$ [m]','Interpreter','latex',"FontSize",20)
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
