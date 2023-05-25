rx=1;
ry=1;
rz=1;
vx=0.1;
vy=0.1;
vz=0.1;
B=1;
K=1;
mu=1;
r_sunx=2;
r_suny=2;
r_sunz=2;

drx = 1e-5;
dry = 1e-5;
drz = 1e-5;
dvx = 1e-8;
dvy = 1e-8;
dvz = 1e-8;

dxdot = phi(rx,ry,rz,vx,vy,vz,B,K,mu,r_sunx,r_suny,r_sunz,1e-5,1e-5,1e-5,1e-8,1e-8,1e-8) + f(rx,ry,rz,vx,vy,vz,B,K,mu,r_sunx,r_suny,r_sunz)
dxdot_nonlinear = f(rx+drx,ry+dry,rz+drz,vx+dvx,vy+dvy,vz+dvz,B,K,mu,r_sunx,r_suny,r_sunz)

function xdot = f(rx,ry,rz,vx,vy,vz,B,K,mu,r_sunx,r_suny,r_sunz)

r = sqrt(rx^2+ry^2+rz^2);

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

SRPx = K*rssx/rss^3;
SRPy = K*rssy/rss^3;
SRPz = K*rssz/rss^3;

xdot = [
    vx;
    vy;
    vz;
    kepx + J2x + SRPx;
    kepy + J2y + SRPy;
    kepz + J2z + SRPz;
];

end

function dxdot = phi(rx,ry,rz,vx,vy,vz,B,K,mu,r_sunx,r_suny,r_sunz,drx,dry,drz,dvx,dvy,dvz)

r = sqrt(rx^2+ry^2+rz^2);
rssx = r_sunx - rx;
rssy = r_suny - ry;
rssz = r_sunz - rz;
rss = sqrt(rssx^2+rssy^2+rssz^2);

A = [                                                                                                                                                                                                    0,                                                                                                                                                                                                     0,                                                                                                                                                                                                                0, 1, 0, 0
                                                                                                                                                                                                    0,                                                                                                                                                                                                     0,                                                                                                                                                                                                                0, 0, 1, 0
                                                                                                                                                                                                    0,                                                                                                                                                                                                     0,                                                                                                                                                                                                                0, 0, 0, 1
(3*K*rssx^2)/(rss^2)^(5/2) - mu/(r^2)^(3/2) - (B*(r^2 - 5*rz^2))/(r^2)^(7/2) - K/(rss^2)^(3/2) + (3*mu*rx^2)/(r^2)^(5/2) - (10*B*rx^2*rz^2)/(r^2)^(9/2) + (5*B*rx^2*(r^2 - 5*rz^2))/(r^2*(r^2)^(7/2)),                                                                 (3*K*rssx*rssy)/(rss^2)^(5/2) + (3*mu*rx*ry)/(r^2)^(5/2) - (5*B*rx*ry*((5*rz^2)/r^2 - 1))/(r^2)^(7/2) - (10*B*rx*ry*rz^2)/(r^2)^(9/2),                                                         (3*K*rssx*rssz)/(rss^2)^(5/2) - (B*rx*((10*rz^3)/r^4 - (10*rz)/r^2))/(r^2)^(5/2) + (3*mu*rx*rz)/(r^2)^(5/2) - (5*B*rx*rz*((5*rz^2)/r^2 - 1))/(r^2)^(7/2), 0, 0, 0
                                                                (3*K*rssx*rssy)/(rss^2)^(5/2) + (3*mu*rx*ry)/(r^2)^(5/2) - (5*B*rx*ry*((5*rz^2)/r^2 - 1))/(r^2)^(7/2) - (10*B*rx*ry*rz^2)/(r^2)^(9/2), (3*K*rssy^2)/(rss^2)^(5/2) - mu/(r^2)^(3/2) - (B*(r^2 - 5*rz^2))/(r^2)^(7/2) - K/(rss^2)^(3/2) + (3*mu*ry^2)/(r^2)^(5/2) - (10*B*ry^2*rz^2)/(r^2)^(9/2) + (5*B*ry^2*(r^2 - 5*rz^2))/(r^2*(r^2)^(7/2)),                                                         (3*K*rssy*rssz)/(rss^2)^(5/2) - (B*ry*((10*rz^3)/r^4 - (10*rz)/r^2))/(r^2)^(5/2) + (3*mu*ry*rz)/(r^2)^(5/2) - (5*B*ry*rz*((5*rz^2)/r^2 - 1))/(r^2)^(7/2), 0, 0, 0
                                                                   (3*K*rssx*rssz)/(rss^2)^(5/2) - (10*B*rx*rz^3)/(r^2)^(9/2) + (3*mu*rx*rz)/(r^2)^(5/2) - (5*B*rx*rz*((5*rz^2)/r^2 - 3))/(r^2)^(7/2),                                                                    (3*K*rssy*rssz)/(rss^2)^(5/2) - (10*B*ry*rz^3)/(r^2)^(9/2) + (3*mu*ry*rz)/(r^2)^(5/2) - (5*B*ry*rz*((5*rz^2)/r^2 - 3))/(r^2)^(7/2), -(3*B*r^4*(rss^2)^(5/2) + 35*B*rz^4*(rss^2)^(5/2) + K*rss^2*(r^2)^(9/2) - 3*K*rssz^2*(r^2)^(9/2) + mu*r^6*(rss^2)^(5/2) - 30*B*r^2*rz^2*(rss^2)^(5/2) - 3*mu*r^4*rz^2*(rss^2)^(5/2))/((r^2)^(9/2)*(rss^2)^(5/2)), 0, 0, 0]

dxdot = A*[drx;dry;drz;dvx;dvy;dvz];

end

