function [outputArg1,outputArg2] = dynamicsModel(x,u,sunPos,Bsrp_c, Bsrp_d)

% CONSTANTS
mu_earth = 3.986004419e14;
J2 = 0.108263e-2;
Re = 6.378e6;
AU = 1.496e11;

rc = x(1:3,1);
vc = x(4:6,1);
rd = x(7:9,1);
vd = x(10:12,1);
br = x(13:15,1);
bv = x(16:18,1);
bac = x(19:21,1);
bad = x(22:24,1);


aKEP_c = -mu_earth/norm(rc)^3*rc;
aKEP_d = -mu_earth/norm(rd)^3*rd;

dJ2_c = computeJ2cartesianPerturbation_J2000([rc;vc], mu_earth, J2, Re);
dJ2_d = computeJ2cartesianPerturbation_J2000([rd;vd], mu_earth, J2, Re);



end

