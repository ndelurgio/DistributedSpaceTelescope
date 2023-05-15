function [u, roe] = trajectoryCVX(roe_i, roe_f, STM, U_max, Gamma, N)
% Calculate the optimal trajectory using convex optimization (CVX)
% deltaDa_i: initial pseudostate (from guidance)
% deltaDa_i: final pseudostate (from guidance)
% STM: linear State Transition Matrix
% U_max: max thrust
% B: Control matrix
% N: number of points on trajectory between two consecutive guidance
% trajectory points

n = 6;
m = 3;
cost = 0;

cvx_begin
    variable u(m, N)
    variable deltaDa(n, N)
    for t = 1:N
        cost = cost + norm(u(:, t));
    end
    minimize (cost)  % norm apparently preferred by CVX over quad forms
    subject to
        % Initial time constraint
        deltaDa(:, 1) == roe_i';
        % The dynamics and deltaV constraints
        for t = 1:N-1
            deltaDa(:, t + 1) == STM * deltaDa(:, t) + Gamma * u(:, t);
            norm(u(:, t)) <= U_max;
        end
        norm(u(:, end)) <= U_max;
        % Final time constraint
        deltaDa(:, end) == roe_f';
        % Maximum thrust constraint
cvx_end

end
