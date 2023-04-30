function roe_damico = computeROE_damico(oe_c, oe_d)
% Computation of quasi-nonsingular Relative Orbit Elements (ROEs) as
% provide by D'Amico
a_c = oe_c(1);
e_c = oe_c(2);
i_c = oe_c(3);
Om_c = oe_c(4);
w_c = oe_c(5);
M_c = oe_c(6);

a_d = oe_d(1);
e_d = oe_d(2);
i_d = oe_d(3);
Om_d = oe_d(4);
w_d = oe_d(5);
M_d = oe_d(6);

delta_a = (a_d - a_c) / a_c;
delta_lambda = (M_d + w_d) - (M_c + w_c) + (Om_d - Om_c) * cos(i_c);
delta_lambda = min(abs(delta_lambda),abs(delta_lambda+2*pi));
delta_ex = e_d * cos(w_d) - e_c * cos(w_c);
delta_ey = e_d * sin(w_d) - e_c * sin(w_c);
delta_ix = i_d - i_c;
delta_iy = (Om_d - Om_c) * sin(i_c);

roe_damico = [delta_a;
              delta_lambda;
              delta_ex;
              delta_ey;
              delta_ix;
              delta_iy];

end
