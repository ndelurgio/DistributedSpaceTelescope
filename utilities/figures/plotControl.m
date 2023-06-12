
u_chief = telem.("Chief Thrust").* telem.("Chief Thrust Cmd");
u_deputy = telem.("Thrust Vector");

figure
subplot 321

plot(time/3600,u_chief(:,1,1))
title("OSC")
ylabel("T_x [N]")
xlim([900/3600,5.3])
subplot 323
plot(time/3600,u_chief(:,1,2))
xlim([900/3600,5.2])
ylabel("T_y [N]")
subplot 325
plot(time/3600,u_chief(:,1,3))
ylabel("T_z [N]")
xlabel("Time [hr]")
xlim([900/3600,5.2])

subplot 322
plot(time/3600,u_deputy(:,1))
xlim([900/3600,5.3])
title("CSC")
ylabel("T_x [N]")
subplot 324
plot(time/3600,u_deputy(:,2))
xlim([900/3600,5.3])
ylabel("T_y [N]")
subplot 326
plot(time/3600,u_deputy(:,3))
xlim([900/3600,5.3])
ylabel("T_z [N]")
xlabel("Time [hr]")

figure
subplot 311

plot(time/3600,u_chief(:,1,1))
title("OSC")
ylabel("T_x [N]")
xlim([900/3600,5.2])
subplot 312
plot(time/3600,u_chief(:,1,2))
xlim([900/3600,5.2])
ylabel("T_y [N]")
subplot 313
plot(time/3600,u_chief(:,1,3))
ylabel("T_z [N]")
xlabel("Time [hr]")
xlim([900/3600,5.2])

