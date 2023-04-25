clear
%% Init Bus & Struct
plantBus = Simulink.Bus;
plant = struct();

%% Environment
% Earth Properties 
plant.environment.earthProperties.radius_m = 6.378e6;
plant.environment.earthProperties.gravitationalParameter_m3_s2 = 3.986004419e14;
plant.environment.earthProperties.J2 = 0.108263e-2;
plant.environment.earthProperties.J2_flag = 0;

% Sun Properties
plant.environment.sunProperties.radius_m = 696340e3;
plant.environment.sunProperties.gravitationalParameter_m3_s2 = 1.32712440042e20;

%% Chief Properties
% Initial Conditions
plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m = 36943e3;
plant.chief.initialConditions.meanOrbitElements.eccentricity = 0.8111;
plant.chief.initialConditions.meanOrbitElements.inclination_rad = deg2rad(59);
plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad = deg2rad(84);
plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad = deg2rad(188);
plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad = deg2rad(180.1);

osc_oe = mean2osc([ ...
    plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.chief.initialConditions.meanOrbitElements.eccentricity, ...
    plant.chief.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ],plant.environment.earthProperties.J2_flag);

plant.chief.initialConditions.osculatingOrbitElements.semiMajorAxis_m = osc_oe(1);
plant.chief.initialConditions.osculatingOrbitElements.eccentricity = osc_oe(2);
plant.chief.initialConditions.osculatingOrbitElements.inclination_rad = osc_oe(3);
plant.chief.initialConditions.osculatingOrbitElements.longitudeAscendingNode_rad = osc_oe(4);
plant.chief.initialConditions.osculatingOrbitElements.argumentPerigee_rad = osc_oe(5);
plant.chief.initialConditions.osculatingOrbitElements.MeanAnomaly_rad = osc_oe(6);

[r_ijk,v_ijk] = oe2eci(...
    plant.chief.initialConditions.osculatingOrbitElements.semiMajorAxis_m,...
    plant.chief.initialConditions.osculatingOrbitElements.eccentricity,...
    plant.chief.initialConditions.osculatingOrbitElements.inclination_rad,...
    plant.chief.initialConditions.osculatingOrbitElements.longitudeAscendingNode_rad,...
    plant.chief.initialConditions.osculatingOrbitElements.argumentPerigee_rad,...
    M2nu(plant.chief.initialConditions.osculatingOrbitElements.MeanAnomaly_rad,plant.chief.initialConditions.osculatingOrbitElements.eccentricity),...
    plant.environment.earthProperties.gravitationalParameter_m3_s2);

plant.chief.initialConditions.cartesianState.positionX_J2000_m = r_ijk(1);
plant.chief.initialConditions.cartesianState.positionY_J2000_m = r_ijk(2);
plant.chief.initialConditions.cartesianState.positionZ_J2000_m = r_ijk(3);
plant.chief.initialConditions.cartesianState.velocityX_J2000_m = v_ijk(1);
plant.chief.initialConditions.cartesianState.velocityY_J2000_m = v_ijk(2);
plant.chief.initialConditions.cartesianState.velocityZ_J2000_m = v_ijk(3);
[~, R_eci2rtn] = eci2rtn([r_ijk; v_ijk]);
theta0_dot = computeTheta0_dot(norm(r_ijk),plant.environment.earthProperties.gravitationalParameter_m3_s2,plant.chief.initialConditions.osculatingOrbitElements.semiMajorAxis_m,plant.chief.initialConditions.osculatingOrbitElements.eccentricity);
clear r_ijk v_ijk

%% Deputy Properties
% Initial Conditions
plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m = 36943e3;
plant.deputy.initialConditions.meanOrbitElements.eccentricity = 0.811101;
plant.deputy.initialConditions.meanOrbitElements.inclination_rad = deg2rad(59.01);
plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad = deg2rad(84);
plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad = deg2rad(188);
plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad = deg2rad(180.1);

osc_oe = mean2osc([ ...
    plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.deputy.initialConditions.meanOrbitElements.eccentricity, ...
    plant.deputy.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ],plant.environment.earthProperties.J2_flag);

% osc_oe = osc_oe + [0.0, 0.000001, deg2rad(0.01), 0.0, 0.0, 0.0];
% 
% mean_oe = osc2mean(osc_oe,1);

% plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m = mean_oe(1);
% plant.deputy.initialConditions.meanOrbitElements.eccentricity = mean_oe(2);
% plant.deputy.initialConditions.meanOrbitElements.inclination_rad = mean_oe(3);
% plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad = mean_oe(4);
% plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad = mean_oe(5);
% plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad = mean_oe(6);

plant.deputy.initialConditions.osculatingOrbitElements.semiMajorAxis_m = osc_oe(1);
plant.deputy.initialConditions.osculatingOrbitElements.eccentricity = osc_oe(2);
plant.deputy.initialConditions.osculatingOrbitElements.inclination_rad = osc_oe(3);
plant.deputy.initialConditions.osculatingOrbitElements.longitudeAscendingNode_rad = osc_oe(4);
plant.deputy.initialConditions.osculatingOrbitElements.argumentPerigee_rad = osc_oe(5);
plant.deputy.initialConditions.osculatingOrbitElements.MeanAnomaly_rad = osc_oe(6);

[r_ijk,v_ijk] = oe2eci(...
    plant.deputy.initialConditions.osculatingOrbitElements.semiMajorAxis_m,...
    plant.deputy.initialConditions.osculatingOrbitElements.eccentricity,...
    plant.deputy.initialConditions.osculatingOrbitElements.inclination_rad,...
    plant.deputy.initialConditions.osculatingOrbitElements.longitudeAscendingNode_rad,...
    plant.deputy.initialConditions.osculatingOrbitElements.argumentPerigee_rad,...
    M2nu(plant.deputy.initialConditions.osculatingOrbitElements.MeanAnomaly_rad,plant.deputy.initialConditions.osculatingOrbitElements.eccentricity),...
    plant.environment.earthProperties.gravitationalParameter_m3_s2);

plant.deputy.initialConditions.cartesianState.positionX_J2000_m = r_ijk(1);
plant.deputy.initialConditions.cartesianState.positionY_J2000_m = r_ijk(2);
plant.deputy.initialConditions.cartesianState.positionZ_J2000_m = r_ijk(3);
plant.deputy.initialConditions.cartesianState.velocityX_J2000_m = v_ijk(1);
plant.deputy.initialConditions.cartesianState.velocityY_J2000_m = v_ijk(2);
plant.deputy.initialConditions.cartesianState.velocityZ_J2000_m = v_ijk(3);
clear r_ijk v_ijk
clear osc_oe mean_oe
%% Relative RTN States
relativeState(1, 1) = plant.deputy.initialConditions.cartesianState.positionX_J2000_m - plant.chief.initialConditions.cartesianState.positionX_J2000_m;
relativeState(2, 1) = plant.deputy.initialConditions.cartesianState.positionY_J2000_m - plant.chief.initialConditions.cartesianState.positionY_J2000_m;
relativeState(3, 1) = plant.deputy.initialConditions.cartesianState.positionZ_J2000_m - plant.chief.initialConditions.cartesianState.positionZ_J2000_m;
relativeState(4, 1) = plant.deputy.initialConditions.cartesianState.velocityX_J2000_m - plant.chief.initialConditions.cartesianState.velocityX_J2000_m;
relativeState(5, 1) = plant.deputy.initialConditions.cartesianState.velocityY_J2000_m - plant.chief.initialConditions.cartesianState.velocityY_J2000_m;
relativeState(6, 1) = plant.deputy.initialConditions.cartesianState.velocityZ_J2000_m - plant.chief.initialConditions.cartesianState.velocityZ_J2000_m;
relativeState = vI2vRTN(relativeState, theta0_dot, R_eci2rtn);
plant.deputy.initialConditions.relativeCartesianState.positionX_RTN_m = relativeState(1);
plant.deputy.initialConditions.relativeCartesianState.positionY_RTN_m = relativeState(2);
plant.deputy.initialConditions.relativeCartesianState.positionZ_RTN_m = relativeState(3);
plant.deputy.initialConditions.relativeCartesianState.velocityX_RTN_m = relativeState(4);
plant.deputy.initialConditions.relativeCartesianState.velocityY_RTN_m = relativeState(5);
plant.deputy.initialConditions.relativeCartesianState.velocityZ_RTN_m = relativeState(6);

plant.chief.initialConditions.relativeCartesianState.positionX_RTN_m = -relativeState(1);
plant.chief.initialConditions.relativeCartesianState.positionY_RTN_m = -relativeState(2);
plant.chief.initialConditions.relativeCartesianState.positionZ_RTN_m = -relativeState(3);
plant.chief.initialConditions.relativeCartesianState.velocityX_RTN_m = -relativeState(4);
plant.chief.initialConditions.relativeCartesianState.velocityY_RTN_m = -relativeState(5);
plant.chief.initialConditions.relativeCartesianState.velocityZ_RTN_m = -relativeState(6);

clear theta0_dot R_eci2rtn
%% Orbit Element Differences

plant.deputy.initialConditions.orbitElementDifferences.deltaSemiMajorAxis_m             = plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m - plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
plant.deputy.initialConditions.orbitElementDifferences.deltaEccentricity                = plant.deputy.initialConditions.meanOrbitElements.eccentricity - plant.chief.initialConditions.meanOrbitElements.eccentricity;
plant.deputy.initialConditions.orbitElementDifferences.deltaInclination_rad             = plant.deputy.initialConditions.meanOrbitElements.inclination_rad - plant.chief.initialConditions.meanOrbitElements.inclination_rad;
plant.deputy.initialConditions.orbitElementDifferences.deltaLongitudeAscendingNode_rad  = plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad - plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad;
plant.deputy.initialConditions.orbitElementDifferences.deltaArgumentPerigee_rad         = plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad - plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad;
plant.deputy.initialConditions.orbitElementDifferences.deltaMeanAnomaly_rad             = plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad - plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad;

plant.chief.initialConditions.orbitElementDifferences.deltaSemiMajorAxis_m             = -plant.deputy.initialConditions.orbitElementDifferences.deltaSemiMajorAxis_m;
plant.chief.initialConditions.orbitElementDifferences.deltaEccentricity                = -plant.deputy.initialConditions.orbitElementDifferences.deltaEccentricity;
plant.chief.initialConditions.orbitElementDifferences.deltaInclination_rad             = -plant.deputy.initialConditions.orbitElementDifferences.deltaInclination_rad;
plant.chief.initialConditions.orbitElementDifferences.deltaLongitudeAscendingNode_rad  = -plant.deputy.initialConditions.orbitElementDifferences.deltaLongitudeAscendingNode_rad;
plant.chief.initialConditions.orbitElementDifferences.deltaArgumentPerigee_rad         = -plant.deputy.initialConditions.orbitElementDifferences.deltaArgumentPerigee_rad;
plant.chief.initialConditions.orbitElementDifferences.deltaMeanAnomaly_rad             = -plant.deputy.initialConditions.orbitElementDifferences.deltaMeanAnomaly_rad;

%% HCW Integration Constants
HCWIntConstantsDeputy = computeHCWIntConstants([plant.deputy.initialConditions.relativeCartesianState.positionX_RTN_m,plant.deputy.initialConditions.relativeCartesianState.positionY_RTN_m,plant.deputy.initialConditions.relativeCartesianState.positionZ_RTN_m,plant.deputy.initialConditions.relativeCartesianState.velocityX_RTN_m,plant.deputy.initialConditions.relativeCartesianState.velocityY_RTN_m,plant.deputy.initialConditions.relativeCartesianState.velocityZ_RTN_m]',plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m,plant.environment.earthProperties.gravitationalParameter_m3_s2);
HCWIntConstantsChief  = computeHCWIntConstants([plant.chief.initialConditions.relativeCartesianState.positionX_RTN_m,plant.chief.initialConditions.relativeCartesianState.positionY_RTN_m,plant.chief.initialConditions.relativeCartesianState.positionZ_RTN_m,plant.chief.initialConditions.relativeCartesianState.velocityX_RTN_m,plant.chief.initialConditions.relativeCartesianState.velocityY_RTN_m,plant.chief.initialConditions.relativeCartesianState.velocityZ_RTN_m]',plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m,plant.environment.earthProperties.gravitationalParameter_m3_s2);


plant.deputy.initialConditions.integrationConstants_HCW.K1 = HCWIntConstantsDeputy(1);
plant.deputy.initialConditions.integrationConstants_HCW.K2 = HCWIntConstantsDeputy(2);
plant.deputy.initialConditions.integrationConstants_HCW.K3 = HCWIntConstantsDeputy(3);
plant.deputy.initialConditions.integrationConstants_HCW.K4 = HCWIntConstantsDeputy(4);
plant.deputy.initialConditions.integrationConstants_HCW.K5 = HCWIntConstantsDeputy(5);
plant.deputy.initialConditions.integrationConstants_HCW.K6 = HCWIntConstantsDeputy(6);

plant.chief.initialConditions.integrationConstants_HCW.K1 = HCWIntConstantsChief(1);
plant.chief.initialConditions.integrationConstants_HCW.K2 = HCWIntConstantsChief(2);
plant.chief.initialConditions.integrationConstants_HCW.K3 = HCWIntConstantsChief(3);
plant.chief.initialConditions.integrationConstants_HCW.K4 = HCWIntConstantsChief(4);
plant.chief.initialConditions.integrationConstants_HCW.K5 = HCWIntConstantsChief(5);
plant.chief.initialConditions.integrationConstants_HCW.K6 = HCWIntConstantsChief(6);

clear HCWIntConstantsDeputy HCWIntConstantsChief
%% YA Integration Constants
nuChief = M2nu(plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad, plant.chief.initialConditions.meanOrbitElements.eccentricity);
nuDeputy = M2nu(plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad, plant.deputy.initialConditions.meanOrbitElements.eccentricity);

YAIntConstantsDeputy = computeYAIntConstants(relativeState,plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m,plant.chief.initialConditions.meanOrbitElements.eccentricity,nuChief,plant.environment.earthProperties.gravitationalParameter_m3_s2);
YAIntConstantsChief  = computeYAIntConstants(relativeState,plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m,plant.deputy.initialConditions.meanOrbitElements.eccentricity,nuDeputy,plant.environment.earthProperties.gravitationalParameter_m3_s2);

plant.deputy.initialConditions.integrationConstants_YA.K1 = YAIntConstantsDeputy(1);
plant.deputy.initialConditions.integrationConstants_YA.K2 = YAIntConstantsDeputy(2);
plant.deputy.initialConditions.integrationConstants_YA.K3 = YAIntConstantsDeputy(3);
plant.deputy.initialConditions.integrationConstants_YA.K4 = YAIntConstantsDeputy(4);
plant.deputy.initialConditions.integrationConstants_YA.K5 = YAIntConstantsDeputy(5);
plant.deputy.initialConditions.integrationConstants_YA.K6 = YAIntConstantsDeputy(6);

plant.chief.initialConditions.integrationConstants_YA.K1 = YAIntConstantsChief(1);
plant.chief.initialConditions.integrationConstants_YA.K2 = YAIntConstantsChief(2);
plant.chief.initialConditions.integrationConstants_YA.K3 = YAIntConstantsChief(3);
plant.chief.initialConditions.integrationConstants_YA.K4 = YAIntConstantsChief(4);
plant.chief.initialConditions.integrationConstants_YA.K5 = YAIntConstantsChief(5);
plant.chief.initialConditions.integrationConstants_YA.K6 = YAIntConstantsChief(6);

clear YAIntConstantsDeputy YAIntConstantsChief nuChief nuDeputy

clear relativeState

%% Eccentric Singular Relative Orbit Elements
eccentricSingularROE = computeEccentricSingularROE([ ...
    plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.chief.initialConditions.meanOrbitElements.eccentricity, ...
    plant.chief.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ],[ ...
    plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.deputy.initialConditions.meanOrbitElements.eccentricity, ...
    plant.deputy.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ]);
plant.deputy.initialConditions.eccentricSingularROE.relativeSemiMajorAxis = eccentricSingularROE(1);
plant.deputy.initialConditions.eccentricSingularROE.relativeLongitude = eccentricSingularROE(2);
plant.deputy.initialConditions.eccentricSingularROE.relativeEccentricityX = eccentricSingularROE(3);
plant.deputy.initialConditions.eccentricSingularROE.relativeEccentricityY = eccentricSingularROE(4);
plant.deputy.initialConditions.eccentricSingularROE.relativeInclinationX = eccentricSingularROE(5);
plant.deputy.initialConditions.eccentricSingularROE.relativeInclinationY = eccentricSingularROE(6);

plant.chief.initialConditions.eccentricSingularROE.relativeSemiMajorAxis = -eccentricSingularROE(1);
plant.chief.initialConditions.eccentricSingularROE.relativeLongitude = -eccentricSingularROE(2);
plant.chief.initialConditions.eccentricSingularROE.relativeEccentricityX = -eccentricSingularROE(3);
plant.chief.initialConditions.eccentricSingularROE.relativeEccentricityY = -eccentricSingularROE(4);
plant.chief.initialConditions.eccentricSingularROE.relativeInclinationX = -eccentricSingularROE(5);
plant.chief.initialConditions.eccentricSingularROE.relativeInclinationY = -eccentricSingularROE(6);

%% Eccentric Quasi-Nonsingular Relative Orbit Elements
eccentricQNSROE = computeEccentricQNSROE([ ...
    plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.chief.initialConditions.meanOrbitElements.eccentricity, ...
    plant.chief.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ],[ ...
    plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.deputy.initialConditions.meanOrbitElements.eccentricity, ...
    plant.deputy.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ]);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeSemiMajorAxis = eccentricQNSROE(1);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeLongitude = eccentricQNSROE(2);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeEccentricityX = eccentricQNSROE(3);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeEccentricityY = eccentricQNSROE(4);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeInclinationX = eccentricQNSROE(5);
plant.deputy.initialConditions.eccentricQuasiNonsingularROE.relativeInclinationY = eccentricQNSROE(6);

plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeSemiMajorAxis = -eccentricQNSROE(1);
plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeLongitude = -eccentricQNSROE(2);
plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeEccentricityX = -eccentricQNSROE(3);
plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeEccentricityY = -eccentricQNSROE(4);
plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeInclinationX = -eccentricQNSROE(5);
plant.chief.initialConditions.eccentricQuasiNonsingularROE.relativeInclinationY = -eccentricQNSROE(6);

clear eccentricQNSROE
%% D'Amico Relative Orbit Elements
damicoROE = computeROE_damico([ ...
    plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.chief.initialConditions.meanOrbitElements.eccentricity, ...
    plant.chief.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.chief.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.chief.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.chief.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ],[ ...
    plant.deputy.initialConditions.meanOrbitElements.semiMajorAxis_m, ...
    plant.deputy.initialConditions.meanOrbitElements.eccentricity, ...
    plant.deputy.initialConditions.meanOrbitElements.inclination_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.longitudeAscendingNode_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.argumentPerigee_rad, ...
    plant.deputy.initialConditions.meanOrbitElements.MeanAnomaly_rad...
    ]);
plant.deputy.initialConditions.damicoROE.relativeSemiMajorAxis = damicoROE(1);
plant.deputy.initialConditions.damicoROE.relativeLongitude = damicoROE(2);
plant.deputy.initialConditions.damicoROE.relativeEccentricityX = damicoROE(3);
plant.deputy.initialConditions.damicoROE.relativeEccentricityY = damicoROE(4);
plant.deputy.initialConditions.damicoROE.relativeInclinationX = damicoROE(5);
plant.deputy.initialConditions.damicoROE.relativeInclinationY = damicoROE(6);

plant.chief.initialConditions.damicoROE.relativeSemiMajorAxis = -damicoROE(1);
plant.chief.initialConditions.damicoROE.relativeLongitude = -damicoROE(2);
plant.chief.initialConditions.damicoROE.relativeEccentricityX = -damicoROE(3);
plant.chief.initialConditions.damicoROE.relativeEccentricityY = -damicoROE(4);
plant.chief.initialConditions.damicoROE.relativeInclinationX = -damicoROE(5);
plant.chief.initialConditions.damicoROE.relativeInclinationY = -damicoROE(6);

clear damicoROE
%% Sim Config
dt = 6;
t_duration = 2*86400;
max_step_size = 60;
relative_tolerance = 1e-11;

%% Generate Plant Bus
% Environment
environment         = createBus(plant.environment);
earthProperties     = createBus(plant.environment.earthProperties);
sunProperties       = createBus(plant.environment.sunProperties);
environment         = addToBus(environment,"earthProperties","bus");
environment         = addToBus(environment,"sunProperties","bus");
plantBus            = addToBus(plantBus,"environment","bus");

% Chief
chief               = createBus(plant.chief);
meanOrbitElements   = createBus(plant.chief.initialConditions.meanOrbitElements);
osculatingOrbitElements   = createBus(plant.chief.initialConditions.osculatingOrbitElements);
cartesianState      = createBus(plant.chief.initialConditions.cartesianState);
relativeCartesianState = createBus(plant.chief.initialConditions.relativeCartesianState);
orbitElementDifferences = createBus(plant.chief.initialConditions.orbitElementDifferences);
integrationConstants_HCW = createBus(plant.chief.initialConditions.integrationConstants_HCW);
integrationConstants_YA = createBus(plant.chief.initialConditions.integrationConstants_YA);
eccentricSingularROE = createBus(plant.chief.initialConditions.eccentricSingularROE);
eccentricQuasiNonsingularROE = createBus(plant.chief.initialConditions.eccentricQuasiNonsingularROE);
damicoROE = createBus(plant.chief.initialConditions.damicoROE);

initialConditions   = createBus(plant.chief.initialConditions);
initialConditions   = addToBus(initialConditions,"meanOrbitElements","bus");
initialConditions   = addToBus(initialConditions,"osculatingOrbitElements","bus");
initialConditions   = addToBus(initialConditions,"cartesianState","bus");
initialConditions   = addToBus(initialConditions, "relativeCartesianState", "bus");
initialConditions   = addToBus(initialConditions,"orbitElementDifferences","bus");
initialConditions   = addToBus(initialConditions,"integrationConstants_HCW","bus");
initialConditions   = addToBus(initialConditions,"integrationConstants_YA","bus");
initialConditions   = addToBus(initialConditions,"eccentricSingularROE","bus");
initialConditions   = addToBus(initialConditions,"eccentricQuasiNonsingularROE","bus");
initialConditions   = addToBus(initialConditions,"damicoROE","bus");
chief               = addToBus(chief,"initialConditions","bus");
plantBus = addToBus(plantBus,"chief","bus");

% Deputy
deputy              = createBus(plant.chief);
deputy              = addToBus(deputy,"initialConditions","bus");
plantBus = addToBus(plantBus,"deputy","bus");
