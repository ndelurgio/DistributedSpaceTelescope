figure
hold on;
plot(time(1:length(u_mat_full(1,:)))/3600,vecnorm(u_mat_full,2,1)*1000,Linewidth=2)
xlabel("Time [hr]")
ylabel("||u|| [mm/s^2]")