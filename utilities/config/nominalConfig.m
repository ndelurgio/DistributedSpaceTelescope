%% Config File
chiefOE = [36943e3, 0.8111, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.000), deg2rad(84), deg2rad(188), deg2rad(180.1)];
% deputyOE = [36943e3, 0.81111, deg2rad(59.002), deg2rad(84), deg2rad(188), deg2rad(180.1)];
ROE = [0;0;-3e-06;0;1e-6;0];
deputyOE = eccentricROE2deputyOE(ROE, chiefOE);
%1.2903e-06, 3.4317e-06
t_epoch = datetime(2024,6,1);
t_final = t_epoch + days(2);
J2_flag = 1;
srp_flag = 0;

loadSimConfig;

clear chiefOE deputyOE J2_flag srp_flag