function relativeCartesianPosition = roeDamico2rtn(ROE_damico,OE)
da = ROE_damico(1);
dl = ROE_damico(2);
dex = ROE_damico(3);
dey = ROE_damico(4);
dix = ROE_damico(5);
diy = ROE_damico(6);

a = OE(1);
e = OE(2);
i = OE(3);
LAN = OE(4);
w = OE(5);
nu = M2nu(OE(6),e);
u = w + nu;
ex = e*cos(w);
ey = e*sin(w);

k = 1 + e*cos(nu);
kp = -e*sin(nu);
eta = sqrt(1-e^2);

r = a*eta^2/k;

xbar = da - k*kp/eta^3*dl - dex/eta^3*k*cos(u) - dey/eta^3*k*sin(u) + k/eta^3*(k-1)/(1+eta)*(ex*dex + ey*dey) + k*kp/eta^3*diy*cot(i);
ybar = k^2/eta^3*dl + dex/eta^2*(1+k)*sin(u) - dey/eta^2*(1+k)*cos(u) + 1/eta^3*(eta+k^2/(1+eta))*(ey*dex - ex*dey) + (1-k^2/eta^3)*diy*cot(i);
zbar = dix*sin(u) - diy*cos(u);

relativeCartesianPosition = r * [xbar, ybar, zbar];

end

