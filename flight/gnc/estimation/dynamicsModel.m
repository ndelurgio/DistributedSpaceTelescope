function xtp1 = dynamicsModel(x,uc,ud,sunPos,Bsrp_c,Bsrp_d,dt)

% CONSTANTS
mu_earth = 3.986004419e14;
J2 = 0.108263e-2;
Re = 6.378e6;
AU = 1.496e11;
p_sr = 4.5344321e-6;

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

dSRP_c = srp([rc;vc],Bsrp_c,p_sr,sunPos,Re,AU);
dSRP_d = srp([rd;vd],Bsrp_d,p_sr,sunPos,Re,AU);

a_c = aKEP_c + dJ2_c + dSRP_c + uc;
a_d = aKEP_d + dJ2_d + dSRP_d + ud;

xdot = [vc;a_c;vd;a_d;zeros(3,1);zeros(3,1);zeros(3,1);zeros(3,1)];

% Euler Step
xtp1 = x + dt*xdot;

end

