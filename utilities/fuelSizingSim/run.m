a = 36943e3;
e = 0.8111;
i = deg2rad(59);
Om0 = deg2rad(84);
w0 = deg2rad(188);
nu = deg2rad(180);
mu = 3.986004419e14;
n = meanMotion(mu,a);

t_mission = 2*365*24*3600;
t_orbit = 2*pi/n;
n_orbits = floor(t_mission/t_orbit);

t_control = 60;
nu0 = deg2rad(170);
nuf = deg2rad(190);
waypoint_dt = (nu2M(nu,e) - nu2M(nu0,e))/n;
steps = floor(waypoint_dt/t_control);

% J2 Parameters
J2 = 0.108263e-2;
Re = 6.378e6;
eta = sqrt(1-e^2);
kappa = 3/4*J2*Re^2*sqrt(mu)/(a^(7/2)*eta^4);

% SRP Parameters
% Csrp = 1.29;
% A = 3.34;
% AU = 1.496e11;
% P = 4.5344321e-6;

% SPICE SETUP
t_epoch = datetime(2024,6,1);
t_final = t_epoch + seconds(t_mission);
% t_epoch = convertTo(t_epoch,'epochtime','Epoch','2000-01-01');
% t_final = convertTo(t_final,'epochtime','Epoch','2000-01-01');
[sunPosition, time] = generateSunEphemeris(t_epoch,t_final,t_orbit);

% Distance from chief to deputy at apogee
rho = 50;

dv_total = [];
Om = Om0;
w = w0;
for iter = 1:n_orbits-1
    % J2 Perturbations
    dOm_J2 = (kappa*-2*cos(i))*t_orbit;
    dw_J2 = kappa*(5*cos(i)^2-1)*t_orbit;

    % SRP Perturbations
    % r_sunSC = 0
    % Bsrp = Csrp * A / m;
    % Fsrp = Bsrp * P * (AU / relative_r)^2 / relative_r;
    
    % r_sun = sunPosition(:,iter);
    % v_sun = (sunPosition(:,iter+1) - r_sun)/t_orbit;
    % oe_sun = eci2oe([r_sun;v_sun],mu)
    
    % dOm_SRP = 0;
    % dw_SRP = 0;

    % Update parameters
    Om = Om + dOm_J2 + dOm_SRP;
    w = w + dw_J2 + dw_SRP;

    [r_chief, v_chief] = oe2eci(a,e,i,Om,w,nu,mu);  % at apogee
    
    r_dep = r_chief + rho * (r_sun - r_chief)/norm(r_sun - r_chief);
    v_dep = v_chief;
    deputyECI = [r_dep; v_dep];
    [deputyOE, ~, ~, ~] = eci2oe(deputyECI, mu);
    deputyOE(6,1) = nu2M(real(deputyOE(6,1)),deputyOE(2,1));
    chiefOE = [a;e;i;Om;w;nu2M(nu,e)];
    ROE = computeEccentricSingularROE(chiefOE,deputyOE);

    % Get time-varying matrices
    Ad = zeros(6,6,steps);
    Bd = zeros(6,3,steps);
    At = eye(6);
    for j = 1:steps
        % oej = chiefOE(indx0 + j - 1,:);
        chiefOE(6,1) = chiefOE(6,1) + n*t_control;
        Ad(:,:,j) = getMatrixAdiscrete(chiefOE',mu,t_control);
        Bd(:,:,j) = getMatrixBdiscrete(chiefOE',mu,t_control);
        At = Ad(:,:,j)*At;
    end

    % Compute toeplitz (block) matrix for dynamics
    toeplitz = Bd(:,:,end);
    for j = (steps-1):-1:1
        term = Bd(:,:,j);
        for k = (j+1):steps
            term = Ad(:,:,k)*term;
        end
        toeplitz = [term, toeplitz];
    end

    % Solve min-norm problem
    roe0 = zeros(6,1);
    y = ROE - At*roe0;
    uvec = toeplitz' * (toeplitz*toeplitz' \ y);
    umat = reshape(uvec,3,[]);
    % u_mat_full(:,indx0:indxf) = umat;

    % Compute delta-v
    dv = 0;
    for j = 1:length(umat(1,:))
        dv = dv + t_control*norm(umat(:,j));
    end
    dv_total = [dv_total, dv];

    % Print i every 20 orbits
    if mod(iter,1) == 0
        fprintf('i = %d\n',iter);
        fprintf('dv = %d\n',dv);
    end
end


