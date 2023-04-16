figure
set(gcf,'position',[300,300,800,800])
% hold on;
subplot(3,1,1)
hold on;
title("Position Error vs Time")
plot(time/3600,telem.("cartesianStateError_RTN")(:,1)/1000,"LineWidth",1)
xlabel("t [hr]")
ylabel("R [km]")
grid on;

subplot(3,1,2)
hold on;
title("R Component Velocity Error vs Time")
plot(time/3600,telem.("cartesianStateError_RTN")(:,4)/1000,"LineWidth",1)
xlabel("t [hr]")
ylabel("v_R [km/s]")
grid on;

subplot(3,1,3)
hold on;
title("T Component Velocity Error vs Time")
plot(time/3600,telem.("cartesianStateError_RTN")(:,5)/1000,"LineWidth",1)
xlabel("t [hr]")
ylabel("v_T (km/s)")
grid on;