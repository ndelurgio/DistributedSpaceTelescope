%% Config File
% chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.000), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% ROE = [0;0;-3e-06;0;1e-6;0];
% deputyOE = eccentricROE2deputyOE(ROE, chiefOE);
%1.2903e-06, 3.4317e-06
t_epoch = datetime(2024,6,1);
t_final = t_epoch + days(0.5);
J2_flag = 1;
srp_flag = 0;

[sunPosData, sunTimeData] = generateSunEphemeris(t_epoch,t_final,60);
sunPos = getSunPosition(sunPosData, sunTimeData, 1);
mu = 3.986004419e14;

chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
chiefOE = mean2osc(chiefOE);
[rChiefECI, vChiefECI] = oe2eci(chiefOE(1), chiefOE(2), chiefOE(3), chiefOE(4), chiefOE(5), chiefOE(6), mu);
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];

% Unit vector from the chief to the Sun
r_chief2sun = (sunPos' - rChiefECI) / norm(sunPos - rChiefECI);

rDeputyECI = rChiefECI + 250 * r_chief2sun;
deputyOE = eci2oe([rDeputyECI, vChiefECI], mu);
deputyOE = osc2mean(deputyOE);
chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% 
% chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];
delta_t = 1;
loadSimConfig;

clear chiefOE deputyOE J2_flag srp_flag