simROE = zeros(length(uMatrix(:,1))+1,6);
simROE(1,:) = deputyROE(1,:);

a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
meanMot = meanMotion(mu,a);
K = 0.01*[1,0,0,0,0,0;0,1,0,0,0,0;0,0,1,0,0,0];
K = zeros(3,6);
oe = chiefOE(1,:);
for i = 1:length(uMatrix(:,1))
    phi = keplerSTM(oe,dt/N,plant.environment.earthProperties.gravitationalParameter_m3_s2);
    oe(6) = chiefOE(1,6) + meanMot*dt/N*i;
    gamma = getControlInputMatrix(oe,plant.environment.earthProperties.gravitationalParameter_m3_s2);
    simROE(i+1,:) = (phi*simROE(i,:)' + gamma*(uMatrix(i,:)' + K*(simROE(i,:)' - roeMatrix(i,:)')))';
end