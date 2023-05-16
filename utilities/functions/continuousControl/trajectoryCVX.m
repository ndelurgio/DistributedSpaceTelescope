function [u, da, da_int] = trajectoryCVX(roe_i, roe_f, STM, U_max, Gamma, N, a)
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
    cvx_precision best
    cvx_solver sedumi
    variable u(m, N)
    variable da(n, N+1)
    for t = 1:N
        cost = cost + norm(u(:, t));
        % cost  = cost + (da(1,end) - roe_f(1))^2*1000;
    end
    minimize (cost)  % norm apparently preferred by CVX over quad forms
    subject to
        % Initial time constraint
        da(:, 1) == roe_i';
        % The dynamics and deltaV constraints
        for t = 1:N
            da(:, t + 1) == (STM * da(:, t) + Gamma(:,:,t) * u(:, t));
            norm(u(:, t)) <= U_max;
        end
        % norm(u(:, end)) <= U_max;
        % Final time constraint
        da(:, end) == roe_f';
        % Maximum thrust constraint
cvx_end
da_int = (STM*da(:,1) + Gamma(:,:,1)*u(:,1));
end
