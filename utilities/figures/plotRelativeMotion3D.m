function [] = plotRelativeMotion3D(time, telem)

apogee_idx = 1;
[~,perigee_idx] = min(abs(time-3.532572227135039e+04));

figure
% title("Relative Motion in RTN Plane")
plot3(telem.("relativeState")(1:end, 1),telem.("relativeState")(1:end, 2),telem.("relativeState")(1:end, 3))
% axis equal;
xlabel("\delta r_r [m]")
ylabel("\delta r_t [m]")
zlabel("\delta r_n [m]")
hold on;
scatter3(telem.("relativeState")(perigee_idx,1),telem.("relativeState")(perigee_idx,2),telem.("relativeState")(perigee_idx,3),"MarkerFaceColor","g")
scatter3(telem.("relativeState")(apogee_idx,1),telem.("relativeState")(apogee_idx,2), telem.("relativeState")(apogee_idx,3),"MarkerFaceColor","r")
legend("Deputy Trajectory", "Perigee", "Apogee")
grid on;
end
