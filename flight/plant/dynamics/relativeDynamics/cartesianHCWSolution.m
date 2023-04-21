function cartesianRelativeState = cartesianHCWSolution(IC_hcw, a, mu, t)
% The matrix-vector solution of the HCW linearized equations of relative
% motion

n = meanMotion(mu, a);

I_matrix = [a*eye(3), zeros(3); zeros(3), a*n*eye(3)];
t_matrix = [1, sin(n*t), cos(n*t), 0, 0, 0;
            -3/2*n*t, 2*cos(n*t), -2*sin(n*t), 1, 0, 0;
            0, 0, 0, 0, sin(n*t), cos(n*t);
            0, cos(n*t), -sin(n*t), 0, 0, 0;
            -3/2, -2*sin(n*t), -2*cos(n*t), 0, 0, 0;
            0, 0, 0, 0, cos(n*t), -sin(n*t)];

cartesianRelativeState = I_matrix * t_matrix * IC_hcw;

end
