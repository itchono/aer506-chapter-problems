mu = 3.986e14;
soi = 925000e3;

rp = 200e3 + 6378e3;
h = sqrt(2*mu*rp);

theta = acos(h^2 / mu / soi - 1);

M = 1/2 * tan(theta/2) + 1/6 * tan(theta/2)^3;

t = h^3 / mu^2 * M;

disp(t/86400)