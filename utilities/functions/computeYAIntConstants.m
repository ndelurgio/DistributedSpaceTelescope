function IC_ya = computeYAIntConstants(relativeCartesianState0, a, e, nu, mu)
% Compute the integration constants for the HCW equations using the initial
% conditions

n = meanMotion(mu, a);
k = 1 + e*cos(nu);
kp = -e*sin(nu);
eta = sqrt(1-e^2);
t = 0;
tau = n*t/eta^3;

I_matrix = [a*eta^2*eye(3), zeros(3); zeros(3), a*n/eta*eye(3)];

psi_x1 = 1/k + 3/2*kp*tau;
psi_x2 = sin(nu);
psi_x3 = cos(nu);
psi_y1 = -3/2*k*tau;
psi_y2 = (1+1/k)*cos(nu);
psi_y3 = -(1+1/k)*sin(nu);
psi_y4 = 1/k;
psi_z5 = 1/k*sin(nu);
psi_z6 = 1/k*cos(nu);
psi_xd1 = kp/2 - 3/2*k^2*(k-1)*tau;
psi_xd2 = k^2*cos(nu);
psi_xd3 = -k^2*sin(nu);
psi_yd1 = -3/2*(k+k^2*kp*tau);
psi_yd2 = -(k^2+1)*sin(nu);
psi_yd3 = -e - (k^2+1)*cos(nu);
psi_yd4 = -kp;
psi_zd5 = e + cos(nu);
psi_zd6 = -sin(nu);

t_matrix = [
    psi_x1, psi_x2, psi_x3, 0, 0, 0;
    psi_y1, psi_y2, psi_y3, psi_y4, 0, 0;
    0, 0, 0, 0, psi_z5, psi_z6;
    psi_xd1, psi_xd2, psi_xd3, 0, 0, 0;
    psi_yd1, psi_yd2, psi_yd3, psi_yd4, 0, 0;
    0, 0, 0, 0, psi_zd5, psi_zd6
    ];

IC_ya = (I_matrix * t_matrix) \ relativeCartesianState0;

end
