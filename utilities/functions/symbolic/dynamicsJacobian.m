syms rx ry rz vx vy vz mu J2 Re Cr A Psi m c AU r_sunx r_suny r_sunz

r = sqrt(rx^2+ry^2+rz^2);
B = 3/2*J2*mu*Re^2;
syms B

kepx = -mu*rx/r^3;
kepy = -mu*ry/r^3;
kepz = -mu*rz/r^3;
J2x = B/r^5*(rx*(5*rz^2/r^2 - 1));
J2y = B/r^5*(ry*(5*rz^2/r^2 - 1));
J2z = B/r^5*(rz*(5*rz^2/r^2 - 3));

rssx = r_sunx - rx;
rssy = r_suny - ry;
rssz = r_sunz - rz;
rss = sqrt(rssx^2+rssy^2+rssz^2);

K = -Cr*A*Psi/(m*c)*AU^2;
syms K
SRPx = K*rssx/rss^3;
SRPy = K*rssy/rss^3;
SRPz = K*rssz/rss^3;

f = [
    vx;
    vy;
    vz;
    kepx + J2x + SRPx;
    kepy + J2y + SRPy;
    kepz + J2z + SRPz;
];

jac = jacobian(f,[rx,ry,rz,vx,vy,vz]);
syms r
jac = subs(jac,rx^2+ry^2+rz^2,r^2);
syms rssx rssy rssz rss
jac = subs(jac, r_sunx-rx,rssx);
jac = subs(jac, r_suny-ry,rssy);
jac = subs(jac, r_sunz-rz,rssz);
% jac = simplifyFraction(jac);
jac = subs(jac,rssx^2+rssy^2+rssz^2,rss^2);
simplify(jac)



