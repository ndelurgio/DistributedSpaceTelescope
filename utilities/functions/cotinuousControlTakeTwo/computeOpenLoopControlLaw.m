solver = 'min_norm';
waypoint_dt = 20000; % Time between waypoints
dt = delta_t;
steps = ceil(waypoint_dt/dt); % Number of Discrete Steps between waypoints

n_waypoints = floor(time(end)/waypoint_dt); % Total number of waypoints
u_mat_full = zeros(3,steps*n_waypoints);

for i = 1:n_waypoints
    % Get initial and final states
    indx0 = steps*(i-1) + 1;
    indxf = steps*i;
    roe0 = deputyROE(indx0,:)';
    roef = deputyROE(indxf,:)';

    % Compute linear system matrices for each time step
    Ad = zeros(6,6,steps);
    Bd = zeros(6,3,steps);
    At = eye(6);
    for j = 1:steps
        oej = chiefOE(indx0 + j - 1,:);
        Ad(:,:,j) = getMatrixAdiscrete(oej,mu,dt);
        Bd(:,:,j) = getMatrixBdiscrete(oej,mu,dt);
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
    % Solve the control problem using different methods
    switch solver
        case 'min_norm' % Least Norm Solution, Minimize Sum of the Squares
            y = roef - At*roe0;
            uvec = toeplitz' * (toeplitz*toeplitz' \ y);
            umat = reshape(uvec,3,[]);
            u_mat_full(:,indx0:indxf) = umat;
        case 'cvx_min_sum_norm' % Convex Program without control constraints
            y = roef - At*roe0;
            cvx_begin
                cvx_precision best
                variable u(3*steps)
                um = reshape(u,3,[]);
                cost = 0;
                for j = 1:steps
                    cost = cost + norm(um(:, j)); % Minimize Sum of the Norms
                end
                minimize (cost)
                subject to
                    y == toeplitz*u;
            cvx_end
            u_mat_full(:,indx0:indxf) = um;
        case 'cvx_constrained' % Convex Program with control constraints
            y = roef - At*roe0;
            cvx_begin
                cvx_precision best
                variable u(3*steps)
                um = reshape(u,3,[]);
                cost = 0;
                for j = 1:steps
                    cost = cost + norm(um(:, j));
                end
                minimize (cost) % Minimize Sum of the Norms
                subject to
                    y == toeplitz*u;
                    for j = 1:steps
                        norm(um(:,j)) <= 6.777e-05 * dt;
                    end
            cvx_end
            u_mat_full(:,indx0:indxf) = um;
    end
end

% Low fidelity simulator to test accuracy of algorithms
roe = zeros(6,length(u_mat_full)+1);
roe(:,1) = deputyROE(1,:)';
for j = 1:length(u_mat_full)
    oej = chiefOE(j,:);
    Ad = getMatrixAdiscrete(oej,mu,dt);
    Bd = getMatrixBdiscrete(oej,mu,dt);
    roe(:,j+1) = Ad*roe(:,j) + Bd*u_mat_full(:,j);
end

dv = 0;
for j = 1:length(u_mat_full(1,:))
    dv = dv + norm(u_mat_full(:,j));
end
