function IC_hcw = computeHCWIntConstants(relativeCartesianState0, a, mu)
% Compute the integration constants for the HCW equations using the initial
% conditions

n = meanMotion(mu, a);

I_matrix = [a*eye(3), zeros(3); zeros(3), a*n*eye(3)];
t_matrix = [1, 0, 1, 0, 0, 0;
            0, 2, 0, 1, 0, 0;
            0, 0, 0, 0, 0, 1;
            0, 1, 0, 0, 0, 0;
            -3/2, 0, -2, 0, 0, 0;
            0, 0, 0, 0, 1, 0];

IC_hcw = (I_matrix * t_matrix) \ relativeCartesianState0;

end
