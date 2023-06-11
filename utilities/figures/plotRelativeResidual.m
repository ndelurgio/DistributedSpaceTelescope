% Plot the relative error, but only for position

% X
true_diff_x = telem.("Deputy Cartesian State J2000.positionX_J2000_m") - telem.("Chief Cartesian State J2000.positionX_J2000_m");
est_diff_x_ekf = telem.("Mean Filter New")(:, 7) - telem.("Mean Filter New")(:, 1);
est_diff_x_ukf = telem.("Mean Filter New")(:, 7) - telem.("Mean Filter New")(:, 1);
diff_x_error_ekf = est_diff_x_ekf(3:end) - true_diff_x(1:end-2);
diff_x_error_ukf = est_diff_x_ukf(3:end) - true_diff_x(1:end-2);
figure
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 1)
grid on
hold on;
title("Relative X Position Error")
% plot(time(4:end)/3600, diff_x_error_ekf(2:end), '--', 'LineWidth', 2)
plot(time(4:end)/3600, diff_x_error_ukf(2:end), '-', 'LineWidth', 2)
% legend("EKF", "UKF")
legend("UKF")
xlabel("t [hr]")
ylabel("Position [m]")

% Y
true_diff_y = telem.("Deputy Cartesian State J2000.positionY_J2000_m") - telem.("Chief Cartesian State J2000.positionY_J2000_m");
est_diff_y_ekf = telem.("Mean Filter New")(:, 8) - telem.("Mean Filter New")(:, 2);
est_diff_y_ukf = telem.("Mean Filter New")(:, 8) - telem.("Mean Filter New")(:, 2);
diff_y_error_ekf = est_diff_y_ekf(3:end) - true_diff_y(1:end-2);
diff_y_error_ukf = est_diff_y_ukf(3:end) - true_diff_y(1:end-2);
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 2)
grid on
hold on;
title("Relative Y Position Error")
% plot(time(4:end)/3600, diff_y_error_ekf(2:end), '--', 'LineWidth', 2)
plot(time(4:end)/3600, diff_y_error_ukf(2:end), '-', 'LineWidth', 2)
% legend("EKF", "UKF")
legend("UKF")
xlabel("t [hr]")
ylabel("Position [m]")


% Z
true_diff_z = telem.("Deputy Cartesian State J2000.positionZ_J2000_m") - telem.("Chief Cartesian State J2000.positionZ_J2000_m");
est_diff_z_ekf = telem.("Mean Filter New")(:, 9) - telem.("Mean Filter New")(:, 3);
est_diff_z_ukf = telem.("Mean Filter New")(:, 9) - telem.("Mean Filter New")(:, 3);
diff_z_error_ekf = est_diff_z_ekf(3:end) - true_diff_z(1:end-2);
diff_z_error_ukf = est_diff_z_ukf(3:end) - true_diff_z(1:end-2);
set(gcf,'Position',[100 100 700 700])
subplot(3, 1, 3)
grid on
hold on;
title("Relative Z Position Error")
% plot(time(4:end)/3600, diff_z_error_ekf(2:end), '--', 'LineWidth', 2)
plot(time(4:end)/3600, diff_z_error_ukf(2:end), '-', 'LineWidth', 2)
% legend("EKF", "UKF")
legend("UKF")
xlabel("t [hr]")
ylabel("Position [m]")
