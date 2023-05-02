function STM = computeCircularROE_J2_STM(OE0,J2,earthRadius,mu,t)

a = OE0(1);
e = OE0(2);
i = OE0(3);
Om_i = OE0(4);
w_i = OE0(5);
M_i = OE0(6);

n = meanMotion(mu,a);
eta = sqrt(1-e^2);
k = 3/4*J2*earthRadius^2*sqrt(mu)/(a^(7/2)*eta^4);
E = 1 + eta;
F = 4 + 3*eta;
G = 1/eta^2;

P = 3*cos(i)^2-1;
Q = 5*cos(i)^2-1;
R = cos(i);
S = sin(2*i);
T = sin(i)^2;
U = sin(i);
V = tan(i/2);
W = cos(i/2)^2;

w_dot = k * Q;
% w_i = plant.chief.initialConditions.osculatingOrbitElements(5);
w_f = w_i + w_dot*t;
Om_dot = -2*k*R;
% Om_i = plant.chief.initialConditions.osculatingOrbitElements(4);
Om_f = Om_i + Om_dot*t;

e_xi = e * cos(w_i);
e_yi = e * sin(w_i);
e_xf = e * cos(w_f);
e_yf = e * sin(w_f);

phi_11 = 1;

phi_21 = -(3/2*n + 7/2*k*E*P)*t;
phi_22 = 1;
phi_23 = k*e_xi*F*G*P*t;
phi_24 = k*e_yi*F*G*P*t;
phi_25 = -k*F*S*t;

phi_31 = 7/2*k*e_yf*Q*t;
phi_33 = cos(w_dot*t) - 4*k*e_xi*e_yf*G*Q*t;
phi_34 = -sin(w_dot*t) - 4*k*e_yi*e_yf*G*Q*t;
phi_35 = 5*k*e_yf*S*t;

phi_41 = -7/2*k*e_xf*Q*t;
phi_43 = sin(w_dot*t) + 4*k*e_xi*e_xf*G*Q*t;
phi_44 = cos(w_dot*t) + 4*k*e_yi*e_xf*G*Q*t;
phi_45 = -5*k*e_xf*S*t;

phi_55 = 1;

phi_61 = 7/2*k*S*t;
phi_63 = -4*k*e_xi*G*S*t;
phi_64 = -4*k*e_yi*G*S*t;
phi_65 = 2*k*T*t;
phi_66 = 1;

STM = 1/eta^2*[
    phi_11, 0, 0, 0, 0, 0
    phi_21, phi_22, phi_23, phi_24, phi_25, 0
    phi_31, 0, phi_33, phi_34, phi_35, 0
    phi_41, 0, phi_43, phi_44, phi_45, 0
    0, 0, 0, 0, phi_55, 0
    phi_61, 0, phi_63, phi_64, phi_65, phi_66
];

end

