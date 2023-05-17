solver = 'cvx_min_sum_norm';
waypoint_dt = 3600;
dt = delta_t;
steps = ceil(waypoint_dt/dt);

n_waypoints = floor(time(end)/waypoint_dt);
% n_waypoints = 10;
u_mat_full = zeros(3,steps*n_waypoints);
% 
% Ad_full = [];
% Bd_full = [];

for i = 1:n_waypoints
    % Get initial and final states
    indx0 = steps*(i-1) + 1;
    indxf = steps*i;
    roe0 = deputyROE(indx0,:)';
    roef = deputyROE(indxf,:)';

    % Compute toeplitz matrix
    Ad = zeros(6,6,steps);
    Bd = zeros(6,3,steps);
    At = eye(6);
    for j = 1:steps
        oej = chiefOE(indx0 + j - 1,:);
        Ad(:,:,j) = getMatrixAdiscrete(oej,mu,dt);
        Bd(:,:,j) = getMatrixBdiscrete(oej,mu,dt);
        At = Ad(:,:,j)*At;
    end
    % Ad_full = [Ad_full; Ad];
    % Bd_full = [Bd_full; Ad];
    
    toeplitz = Bd(:,:,end);
    for j = (steps-1):-1:1
        term = Bd(:,:,j);
        for k = (j+1):steps
            term = Ad(:,:,k)*term;
        end
        toeplitz = [term, toeplitz];
    end
    switch solver
        case 'min_norm'
            % Least Norm Solution
            y = roef - At*roe0;
            uvec = toeplitz' * (toeplitz*toeplitz' \ y);
            % uvec = pinv(toeplitz) * y;
            umat = reshape(uvec,3,[]);
            u_mat_full(:,indx0:indxf) = umat;
        case 'cvx_min_sum_norm'
            cvx_begin
                cvx_precision best
                variable u(3*steps)
                um = reshape(u,3,[]);
                cost = 0;
                for j = 1:steps
                    cost = cost + norm(um(:, j));
                    
                end
                % for j = 2:steps
                %     cost = cost + norm((um(:,j)-um(:,j-1)));
                % end
                minimize (cost)
                subject to
                    y == toeplitz*u;
                    % a*norm(y-toeplitz*u) <= 1;
                    % for j = 1:i
                    %     norm(um(:,j)) <= 4.2183e-05 * dt * 100;
                    % end
            cvx_end
            % umat = reshape(u,3,[]);
            u_mat_full(:,indx0:indxf) = um;
    end
end

% Sim Test
roe = zeros(6,length(u_mat_full)+1);
roe(:,1) = deputyROE(1,:)';
for j = 1:length(u_mat_full)
    oej = chiefOE(j,:);
    Ad = getMatrixAdiscrete(oej,mu,dt);
    Bd = getMatrixBdiscrete(oej,mu,dt);
    roe(:,j+1) = Ad*roe(:,j) + Bd*u_mat_full(:,j);
    % roe(:,j+1) = Ad(:,:,j)*roe + Bd(:,:,j)*umat(:,j);
end

dv = 0;
for j = 1:length(u_mat_full(1,:))
    dv = dv + norm(u_mat_full(:,j));
end
