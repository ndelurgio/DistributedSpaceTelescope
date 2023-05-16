
i = 20;
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
uvec = toeplitz' * (toeplitz*toeplitz' \ y);
umat = reshape(uvec,3,[]);


% Sim Test
roe = roe0;
for j = 1:i
    roe = Ad(:,:,j)*roe + Bd(:,:,j)*umat(:,j);
end

