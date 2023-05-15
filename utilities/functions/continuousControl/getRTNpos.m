rtn_state = zeros(length(deputyROE(:,1)),6);
for i = 1:length(deputyROE(:,1))
    % t = i*dt;
    phi = cartesianGuffantiSolution(chiefOE(i,:), 0, plant.environment.earthProperties.gravitationalParameter_m3_s2);
    rtn_state(i,:) = (phi*deputyROE(i,:)')';
end

figure
set(gcf,'Position',[100 100 900 500])
title("Relative 3D Position")
axis equal
grid on;
hold on;
view(30,30)
scatter3(0,0,0,'filled')
plot3(rtn_state(:,1),rtn_state(:,2),rtn_state(:,3),LineWidth=1.5)
legend(["Chief",'Deputy'])

xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")