%% Config File
<<<<<<< HEAD
=======
chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];
ROE = [0;0;0;0;3.4317e-06;0];
deputyOE = eccentricROE2deputyOE(ROE, chiefOE);
%1.2903e-06
>>>>>>> abf8a3dd0cb756a7a8337a7a3bb205aebc3ee5a5
t_epoch = datetime(2024,6,1);
t_final = t_epoch + days(2);
J2_flag = 1;
srp_flag = 0;

[sunPosData, sunTimeData] = generateSunEphemeris(t_epoch,t_final,60);
sunPos = getSunPosition(sunPosData, sunTimeData, 1);

chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
chiefECI = oe2eci(chiefOE);
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];

% Unit vector from the chief to the Sun
r_chief2sun = sunPos - chiefECI(1:3, 1)/ norm(sunPos - chiefECI(1:3, 1));

deputyECI = copy(chiefECI);
deputyECI(1:3, 1) = 250 * r_chief2sun;
deputyOE = eci2oe(deputyECI);

% ROE = [0,0,0,1.2903e-06,0,3.4317e-06];

loadSimConfig;

clear chiefOE deputyOE J2_flag srp_flag