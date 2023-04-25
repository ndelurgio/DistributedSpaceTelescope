function eccentricSingularROE = computeEccentricSingularROE(chiefOE, deputyOE)

ac = chiefOE(1);
ec = chiefOE(2);
ic = chiefOE(3);
Oc = chiefOE(4);
wc = chiefOE(5);
Mc = chiefOE(6);

ad = deputyOE(1);
ed = deputyOE(2);
id = deputyOE(3);
Od = deputyOE(4);
wd = deputyOE(5);
Md = deputyOE(6);

eta = sqrt(1-ec^2);
eccentricSingularROE = [
    eta^2*(ad-ac)/ac;
    1/eta*(Md-Mc) + eta^2*(wd-wc+(Od-Oc)*cos(ic));
    (ed-ec)*cos(wc) + ec/eta*(Md-Mc)*sin(wc);
    (ed-ec)*sin(wc) - ec/eta*(Md-Mc)*cos(wc);
    eta^2*(id-ic);
    eta^2*(Od-Oc)*sin(ic)
];

end

