computeScienceTrajectory;
computeOpenLoopControlLaw;

%% Config File
t_epoch = datetime(2024,6,1);
% mu = 3.986004419e14;

nu0 = deg2rad(170);
nuf = deg2rad(190);

deputyOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), nu2M(nu0,0.8111)];
chiefOE = eccentricROE2deputyOE(deputyROE(1,:)',deputyOE);

M0 = nu2M(nu0,chiefOE(2));
Mf = nu2M(nuf,chiefOE(2));
n = meanMotion(3.986004419e14,chiefOE(1));
tdur = (Mf-M0)/n;
t_final = t_epoch + seconds(tdur) + days(0.2);
J2_flag = 1;
srp_flag = 1;

[sunPosData, sunTimeData] = generateSunEphemeris(t_epoch,t_final,60);
sunPos = getSunPosition(sunPosData, sunTimeData, 1);
delta_t = 1;
% chiefOE = mean2osc(chiefOE,J2_flag);
% [rChiefECI, vChiefECI] = oe2eci(chiefOE(1), chiefOE(2), chiefOE(3), chiefOE(4), chiefOE(5), chiefOE(6), mu);
% 
% % Unit vector from the chief to the Sun
% r_chief2sun = (sunPos' - rChiefECI) / norm(sunPos - rChiefECI);
% 
% rDeputyECI = rChiefECI + 250 * r_chief2sun;
% deputyOE = eci2oe([rDeputyECI, vChiefECI], mu);
% deputyOE = osc2mean(deputyOE);

loadSimConfig;

% clear chiefOE deputyOE J2_flag srp_flag