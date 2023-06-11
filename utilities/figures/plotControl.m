
u_chief = telem.("Chief Thrust").* telem.("Chief Thrust Cmd");
u_deputy = telem.("Thrust Vector");

figure
subplot 321

plot(u_chief(:,1,1))
title("OSC")
ylabel("T_x [N]")
subplot 323
plot(u_chief(:,1,2))
ylabel("T_y [N]")
subplot 325
plot(u_chief(:,1,3))
ylabel("T_z [N]")

subplot 322
plot(u_deputy(:,1))
title("CSC")
ylabel("T_x [N]")
subplot 324
plot(u_deputy(:,2))
ylabel("T_y [N]")
subplot 326
plot(u_deputy(:,3))
ylabel("T_z [N]")
