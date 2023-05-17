rtn_state = zeros(length(deputyROE(:,1)),6);
rtn_state_cvx = zeros(length(roe(1,:)),6);
for i = 1:length(deputyROE(:,1))
    % t = i*dt;
    phi = cartesianGuffantiSolution(chiefOE(i,:), 0, plant.environment.earthProperties.gravitationalParameter_m3_s2);
    rtn_state(i,:) = (phi*deputyROE(i,:)')';
end

for i = 1:length(roe(1,:))
    % t = i*dt;
    phi = cartesianGuffantiSolution(chiefOE(i,:), 0, plant.environment.earthProperties.gravitationalParameter_m3_s2);
    rtn_state_cvx(i,:) = (phi*roe(:,i))';
end

figure
set(gcf,'Position',[100 100 900 500])
title("Relative 3D Position (RTN)")
axis equal
grid on;
hold on;
view(30,30)
scatter3(0,0,0,'filled')
plot3(rtn_state(:,1),rtn_state(:,2),rtn_state(:,3),LineWidth=1.5)
scatter3(rtn_state(1,1),rtn_state(1,2),rtn_state(1,3),'filled','MarkerFaceColor','red')
scatter3(rtn_state(end,1),rtn_state(end,2),rtn_state(end,3),'filled')
% plot3(rtn_state_cvx(:,1),rtn_state_cvx(:,2),rtn_state_cvx(:,3),LineWidth=5,Color='green')
% legend(["Chief",'Deputy','CVX'])
legend(["Chief",'Deputy','Start','End'])

xlabel("x [m]")
ylabel("y [m]")
zlabel("z [m]")