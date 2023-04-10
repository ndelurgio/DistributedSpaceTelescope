figure
hold on;
plot3(  telem.("cartesianStateKepler.positionX_J2000_m"),...
        telem.("cartesianStateKepler.positionY_J2000_m"),...
        telem.("cartesianStateKepler.positionZ_J2000_m"),LineWidth=2);
legend("Chief")
title("Inertial (J2000) Orbit")
xlabel("X (m)")
ylabel("Y (m)")
zlabel("Z (m)")
axis equal;
grid on;
view(90,30);
hold off;