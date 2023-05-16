
i = 100;
mu = plant.environment.earthProperties.gravitationalParameter_m3_s2;

roe0 = deputyROE(1,:)';
roef = deputyROE(i+1,:)';

dt = delta_t;
At = eye(6);

Ad = zeros(6,6,i);
Bd = zeros(6,3,i);
for j = 1:i
    oej = chiefOE(j,:);
    Ad(:,:,j) = getMatrixAdiscrete(oej,mu,dt);
    Bd(:,:,j) = getMatrixBdiscrete(oej,mu,dt);
    At = Ad(:,:,j)*At;
end

toeplitz = Bd(:,:,end);
for j = i-1:-1:1
    term = Bd(:,:,j);
    for k = (j+1):i
        term = Ad(:,:,k)*term;
    end
    toeplitz = [term, toeplitz];
end

y = roef - At*roe0;

cvx_begin
    cvx_precision best
    % cvx_solver sedumi
    variable u(3*i)
    
    um = reshape(u,3,[]);
    cost = 0;
    for j = 1:i
        cost = cost + norm(um(:, j));
    end
    minimize (cost)
    subject to
        y == toeplitz*u;
        for j = 1:i
            norm(um(:,j)) <= 4.2183e-05 * dt * 100;
        end
cvx_end

umat = reshape(u,3,[]);
dv = 0;
for j = 1:length(umat(1,:))
    dv = dv + norm(umat(:,j));
end

% Sim Test
roe = roe0;
for j = 1:i
    roe = Ad(:,:,j)*roe + Bd(:,:,j)*umat(:,j);
end

