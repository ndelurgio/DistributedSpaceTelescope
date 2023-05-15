% Test the trajectory generated using convex optimization

mu = 3.986004419e14;
roeTraj = load('roeTrajectory.mat');
roeTraj = roeTraj.deputyROE;
oeChief = load('chiefOE.mat');
oeChief = oeChief.chiefOE;
dt = 6;
simPoints = 3500;  % truncated
simPoints = 100;
N = 5;  % tune this parameter
n = 6;
m = 3;
U_max = 4.2183e-05;
uMatrix = zeros(simPoints * N, m);
deltaDaMatrix = zeros(simPoints * N, n);

% Run the simulation
for i = 1:simPoints
    t = i * dt;
    STM = keplerSTM(oeChief(i, :), t, mu);
    Gamma = getControlInputMatrix(oeChief(i, :), mu);
    deltaDa_i = roeTraj(i, :);
    deltaDa_f = roeTraj(i+1, :);
    [u, deltaDa] = trajectoryCVX(deltaDa_i, deltaDa_f, STM, U_max, Gamma, N);
    uMatrix((i-1)*N+1:i*N, :) = u';
    deltaDaMatrix((i-1)*N+1:i*N, :) = deltaDa';
end
