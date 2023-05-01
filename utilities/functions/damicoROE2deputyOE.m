function deputyOE = damicoROE2deputyOE(ROE,chiefOE)

a = chiefOE(1);
ex = chiefOE(2);
ey = chiefOE(3);
i = chiefOE(4);
O = chiefOE(5);
u = chiefOE(6);

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
Od = diy/sin(i) + O;
ud = dlam + u -(Od-O)*cos(i);

deputyOE = [ad,edx,edy,id,Od,ud];

end

