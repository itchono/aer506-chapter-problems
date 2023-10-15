v = 7e3;
r = 1000e3 + 6378e3;
gamma = 10;

mu = 3.986e14;

v_n = cosd(gamma) * v;
h = v_n * r;

energy = v^2/2 - mu/r;
a = -mu / (2*energy);

e = sqrt(1-h^2 / (mu*a))
T = 2*pi * sqrt(a^3 / mu) / 60
