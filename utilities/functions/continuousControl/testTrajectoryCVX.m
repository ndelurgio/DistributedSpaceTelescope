% Test the trajectory generated using convex optimization

mu = 3.986004419e14;
% roeTraj = load('roeTrajectory.mat');
% roeTraj = roeTraj.deputyROE;
% oeChief = load('chiefOE.mat');
% oeChief = oeChief.chiefOE;
roeTraj = deputyROE;
oeChief = chiefOE;
dt = delta_t;
simPoints = 3500;  % truncated
simPoints = 100;
N = 10;  % tune this parameter
n = 6;
m = 3;
U_max = a;
uMatrix = zeros(simPoints * N, m);
roeMatrix = zeros(simPoints * N, n);
roeMatrix(1,:) = roeTraj(1,:);

a = plant.chief.initialConditions.meanOrbitElements.semiMajorAxis_m;
meanMot = meanMotion(mu,a);
% Run the simulation
for i = 1:simPoints
    STM = keplerSTM(oeChief(i, :), dt/N, mu);
    Gamma = zeros(6,3,N);
    for j =1:N
        oe = oeChief(i,:);
        oe(6) = oe(6) + meanMot*dt/N*j;
        Gamma(:,:,j) = getControlInputMatrix(oe, mu);
    end
    % Gamma = getControlInputMatrix(oeChief(i, :), mu);
    % roe_i = roeTraj(i, :);
    roe_i = roeMatrix((i-1)*N+1,:);
    roe_f = roeTraj(i+1, :);
    [u, roe, roe_int] = trajectoryCVX(roe_i, roe_f, STM, U_max, Gamma, N, a);
    uMatrix((i-1)*N+1:i*N, :) = u';
    for j = 1:length(N)
        roeMatrix((i-1)*N+j+1, :) = STM*roeMatrix((i-1)*N+j,:)' + Gamma(:,:,j)*u(:,j);
    end
    % roeMatrix((i-1)*N+1:i*N, :) = roe(:,1:end-1)';
end
