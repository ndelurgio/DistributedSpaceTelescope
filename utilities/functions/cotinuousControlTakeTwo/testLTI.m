
i = 20;
mu = plant.environment.earthProperties.gravitationalParameter_m3_s2;

roe0 = deputyROE(1,:)';
roef = deputyROE(i+1,:)';


dt = delta_t;
oej = chiefOE(1,:);
Ad = getMatrixAdiscrete(oej,mu,dt);
Bd = getMatrixBdiscrete(oej,mu,dt);
% toeplitz = Bd;
toeplitz = [];
% At = Ad;
At = Ad^i;
for j=1:i
    toeplitz = [(Ad^(j-1))*Bd, toeplitz];
end

y = roef - At*roe0;
uvec = toeplitz' * (toeplitz*toeplitz' \ y);
umat = reshape(uvec,3,[])


% Sim Test
roe = roe0;
for j = 1:i
    roe = Ad*roe + Bd*umat(:,j)
end

