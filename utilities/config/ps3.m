clear
%% Init Bus & Struct
plantBus = Simulink.Bus;
plant = struct();

%% Environment
% Earth Properties 
plant.environment.earthProperties.radius_m = 6.378e6;
plant.environment.earthProperties.gravitationalParameter_m3_s2 = 3.986004419e14;
plant.environment.earthProperties.J2 = 0.108263e-2;

% Sun Properties
plant.environment.sunProperties.radius_m = 696340e3;
plant.environment.sunProperties.gravitationalParameter_m3_s2 = 1.32712440042e20;

%% Chief Properties
% Initial Conditions
plant.chief.initialConditions.orbitElements.semiMajorAxis_m = 36943e3;
plant.chief.initialConditions.orbitElements.eccentricity = 0.8111;
plant.chief.initialConditions.orbitElements.inclination_rad = deg2rad(59);
plant.chief.initialConditions.orbitElements.longitudeAscendingNode_rad = deg2rad(84);
plant.chief.initialConditions.orbitElements.argumentPerigee_rad = deg2rad(188);
plant.chief.initialConditions.orbitElements.MeanAnomaly_rad = deg2rad(180.1);

[r_ijk,v_ijk] = oe2eci(...
    plant.chief.initialConditions.orbitElements.semiMajorAxis_m,...
    plant.chief.initialConditions.orbitElements.eccentricity,...
    plant.chief.initialConditions.orbitElements.inclination_rad,...
    plant.chief.initialConditions.orbitElements.longitudeAscendingNode_rad,...
    plant.chief.initialConditions.orbitElements.argumentPerigee_rad,...
    M2nu(plant.chief.initialConditions.orbitElements.MeanAnomaly_rad,plant.chief.initialConditions.orbitElements.eccentricity),...
    plant.environment.earthProperties.gravitationalParameter_m3_s2);

plant.chief.initialConditions.cartesianState.positionX_J2000_m = r_ijk(1);
plant.chief.initialConditions.cartesianState.positionY_J2000_m = r_ijk(2);
plant.chief.initialConditions.cartesianState.positionZ_J2000_m = r_ijk(3);
plant.chief.initialConditions.cartesianState.velocityX_J2000_m = v_ijk(1);
plant.chief.initialConditions.cartesianState.velocityY_J2000_m = v_ijk(2);
plant.chief.initialConditions.cartesianState.velocityZ_J2000_m = v_ijk(3);
[~, R_eci2rtn] = eci2rtn([r_ijk; v_ijk]);
theta0_dot = computeTheta0_dot(norm(r_ijk),plant.environment.earthProperties.gravitationalParameter_m3_s2,plant.chief.initialConditions.orbitElements.semiMajorAxis_m,plant.chief.initialConditions.orbitElements.eccentricity);
clear r_ijk v_ijk

%% Deputy Properties
% Initial Conditions
plant.deputy.initialConditions.orbitElements.semiMajorAxis_m = 36943e3;
plant.deputy.initialConditions.orbitElements.eccentricity = 0.811101;
plant.deputy.initialConditions.orbitElements.inclination_rad = deg2rad(59.01);
plant.deputy.initialConditions.orbitElements.longitudeAscendingNode_rad = deg2rad(84);
plant.deputy.initialConditions.orbitElements.argumentPerigee_rad = deg2rad(188);
plant.deputy.initialConditions.orbitElements.MeanAnomaly_rad = deg2rad(180.1);

[r_ijk,v_ijk] = oe2eci(...
    plant.deputy.initialConditions.orbitElements.semiMajorAxis_m,...
    plant.deputy.initialConditions.orbitElements.eccentricity,...
    plant.deputy.initialConditions.orbitElements.inclination_rad,...
    plant.deputy.initialConditions.orbitElements.longitudeAscendingNode_rad,...
    plant.deputy.initialConditions.orbitElements.argumentPerigee_rad,...
    M2nu(plant.deputy.initialConditions.orbitElements.MeanAnomaly_rad,plant.deputy.initialConditions.orbitElements.eccentricity),...
    plant.environment.earthProperties.gravitationalParameter_m3_s2);

plant.deputy.initialConditions.cartesianState.positionX_J2000_m = r_ijk(1);
plant.deputy.initialConditions.cartesianState.positionY_J2000_m = r_ijk(2);
plant.deputy.initialConditions.cartesianState.positionZ_J2000_m = r_ijk(3);
plant.deputy.initialConditions.cartesianState.velocityX_J2000_m = v_ijk(1);
plant.deputy.initialConditions.cartesianState.velocityY_J2000_m = v_ijk(2);
plant.deputy.initialConditions.cartesianState.velocityZ_J2000_m = v_ijk(3);
clear r_ijk v_ijk

%% Relative States
% Relative elements of deputy with respect to chief
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
clear relativeState

%% Sim Config
dt = 6;
max_step_size = 60;
relative_tolerance = 1e-11;

%% Generate Bus
% Environment
environment         = createBus(plant.environment);
earthProperties     = createBus(plant.environment.earthProperties);
sunProperties       = createBus(plant.environment.sunProperties);
environment         = addToBus(environment,"earthProperties","bus");
environment         = addToBus(environment,"sunProperties","bus");
plantBus            = addToBus(plantBus,"environment","bus");

% Chief
chief               = createBus(plant.chief);
orbitElements       = createBus(plant.chief.initialConditions.orbitElements);
cartesianState      = createBus(plant.chief.initialConditions.cartesianState);
relativeCartesianState = createBus(plant.chief.initialConditions.relativeCartesianState);
initialConditions   = createBus(plant.chief.initialConditions);
initialConditions   = addToBus(initialConditions,"orbitElements","bus");
initialConditions   = addToBus(initialConditions,"cartesianState","bus");
initialConditions = addToBus(initialConditions, "relativeCartesianState", "bus");
chief               = addToBus(chief,"initialConditions","bus");
plantBus = addToBus(plantBus,"chief","bus");

% Deputy
deputy              = createBus(plant.chief);
deputy              = addToBus(deputy,"initialConditions","bus");
plantBus = addToBus(plantBus,"deputy","bus");