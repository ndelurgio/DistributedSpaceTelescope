function theta0_ddot = compute_theta0_ddot(r0,r0_dot,theta0_dot)

theta0_ddot = -2*r0_dot*theta0_dot/r0;

end