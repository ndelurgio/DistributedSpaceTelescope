%% Config File
chiefOE = [7000e3, 0.001, deg2rad(59), deg2rad(84), deg2rad(188), deg2rad(180.1)];
aROE = [0, 100, 50, 100, 30, 200];

chiefOEqns = singular2quasiOE(chiefOE);
deputyOEqns = damicoROE2deputyOE(aROE/chiefOE(1), chiefOEqns);

deputyOE = quasi2singularOE(deputyOEqns);
J2_flag = 0;

loadSimConfig;