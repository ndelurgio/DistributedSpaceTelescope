function deltaV = impulsiveManeuverCalculator(a_chief, oe_deputy, mu)
% Function to calculate the size of an impulsive maneuver to remove the
% drift introduced by a difference in semi-major axis (a) between the
% deputy and chief
% We assume the impulsive maneuver is performed at the perigee (most
% efficient)

a_deputy = oe_deputy(1);
e_deputy = oe_deputy(2);
i_deputy  = oe_deputy(3);
Om_deputy  = oe_deputy(4);
w_deputy  = oe_deputy(5);
nu_deputy  = oe_deputy(6);

% Velocity of deputy at perigee
v_p = sqrt(mu / a_deputy * (1 + e_deputy) / (1 - e_deputy));
% Difference in semi-major axis between deputy and chief
deltaA = -(a_deputy - a_chief); % if a_deputy > a_chief: negative velocity and vice versa
deltaV_rtn = [0; deltaA * mu / (2 * a_deputy^2 * v_p); 0]; % In the +T direction as we're at perigee
disp(deltaV_rtn)

% This is in the RTN frame, we want it in the inertial frame
[r_eci, v_eci] = oe2eci(a_deputy, e_deputy, i_deputy, Om_deputy, w_deputy, nu_deputy, mu);
[~, R_eci2rtn] = eci2rtn([r_eci; v_eci]);
% r_rtn = cartesianState_rtn(1:3);
% r0 = norm(r_rtn);
% theta0_dot = computeTheta0_dot(r0, mu, a_deputy, e_deputy);
% w_rtn2I = [0; 0; theta0_dot];
% deltaV = deltaV_rtn + cross(w_rtn2I, r_rtn); % deltaV w.r.t I in RTN
deltaV = R_eci2rtn' * deltaV_rtn; % deltaV w.r.t I in I

end
