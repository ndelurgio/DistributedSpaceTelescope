function deputyOE = eccentricROE2deputyOE(ROE,chiefOE)

a = chiefOE(1);
e = chiefOE(2);
i = chiefOE(3);
O = chiefOE(4);
w = chiefOE(5);
M = chiefOE(6);

eta = sqrt(1-e^2);
b = [1;
    M/eta + eta^2*(w+O*cos(i));
    e*cos(w) + e*sin(w)*M/eta;
    e*sin(w) - e*cos(w)*M/eta;
    eta^2*i;
    eta^2*O*sin(i)];


da = ROE(1);
dlam = ROE(2);
dex = ROE(3);
dey = ROE(4);
dix = ROE(5);
diy = ROE(6);

ad = a*da + a;
edx = dex + ex;
edy = dey + ey;
id = dix + i;
Od = wrapTo2Pi(diy/sin(i) + O);
ud = wrapTo2Pi(dlam + u -(Od-O)*cos(i));

deputyOE = [ad,ud,edx,edy,id,Od];

end

