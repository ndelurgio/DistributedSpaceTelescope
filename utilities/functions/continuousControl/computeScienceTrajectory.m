pset6;

out = sim('getChiefData');

time = out.tout;
telem = extractTimetable(out.logsout);

chiefPos = [telem.("Chief Cartesian State J2000.positionX_J2000_m"), telem.("Chief Cartesian State J2000.positionY_J2000_m"), telem.("Chief Cartesian State J2000.positionZ_J2000_m")];

deputyPos = zeros(length(time),3);
for i = 1:length(time)
    sunPos = telem.("Sun Position")(i,:);
    r_chief2sun = (sunPos - chiefPos(i,:)) / norm(sunPos - chiefPos(i,:));
    deputyPos(i,:) = chiefPos(i,:) + 250 * r_chief2sun;
end

deputyVel = diff(deputyPos)/dt;
deputyECI = [deputyPos(1:end-1,:), deputyVel];

deputyOE = zeros(length(deputyECI(:,1)),6);
chiefOE = zeros(length(deputyECI(:,1)),6);
deputyROE = zeros(length(deputyECI(:,1)),6);
for i = 1:length(deputyECI(:,1))
    [deputyOE(i,:),~,~,~] = eci2oe(deputyECI(i,:),plant.environment.earthProperties.gravitationalParameter_m3_s2);
    deputyOE(i,6) = nu2M(deputyOE(i,6),deputyOE(i,2));
    chiefOE(i,:) = [
        telem.("Osculating Chief Orbital Elements.semiMajorAxis_m")(i),...
        telem.("Osculating Chief Orbital Elements.eccentricity")(i),...
        telem.("Osculating Chief Orbital Elements.inclination_rad")(i),...
        telem.("Osculating Chief Orbital Elements.longitudeAscendingNode_rad")(i),...
        telem.("Osculating Chief Orbital Elements.argumentPerigee_rad")(i),...
        telem.("Osculating Chief Orbital Elements.MeanAnomaly_rad")(i),...
    ];
    deputyROE(i,:) = computeEccentricSingularROE(chiefOE(i,:),deputyOE(i,:));
end