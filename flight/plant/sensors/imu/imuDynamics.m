function bdot = imuDynamics(Q)

rng('default')
bdot = mvnrnd([0;0;0],Q)';

end

