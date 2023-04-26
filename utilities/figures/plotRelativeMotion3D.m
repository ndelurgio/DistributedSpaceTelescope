function [] = plotRelativeMotion3D(telem)

% apogee_idx = 1;
% [~,perigee_idx] = min(abs(time-3.532572227135039e+04));

figure
% title("Relative Motion in RTN Plane")
hold on;
plot3(telem.("Deputy Relative Cartesian State RTN Nonlinear.positionX_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN Nonlinear.positionZ_RTN_m"),Color="black",LineWidth=1.5)
plot3(telem.("Deputy Relative Cartesian State RTN HCW.positionX_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.positionY_RTN_m"),telem.("Deputy Relative Cartesian State RTN HCW.positionZ_RTN_m"))

axis equal;
xlabel("\delta r_r [m]")
ylabel("\delta r_t [m]")
zlabel("\delta r_n [m]")
view(30,30)
hold on;
% scatter3(telem.("relativeState")(perigee_idx,1),telem.("relativeState")(perigee_idx,2),telem.("relativeState")(perigee_idx,3),"MarkerFaceColor","g")
% scatter3(telem.("relativeState")(apogee_idx,1),telem.("relativeState")(apogee_idx,2), telem.("relativeState")(apogee_idx,3),"MarkerFaceColor","r")
legend(["Nonlinear","Linear"])
grid on;
end
