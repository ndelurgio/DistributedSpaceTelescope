function deputyOE = damicoROE2deputyOE(ROE,chiefOE)

a = chiefOE(1);
u = chiefOE(2);
ex = chiefOE(3);
ey = chiefOE(4);
i = chiefOE(5);
O = chiefOE(6);


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

