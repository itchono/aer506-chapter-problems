r = 6378e3 + 1000e3;
v = 10e3;
gamma = 15;

v_n = v * cosd(gamma);
h = r * v_n;

energy = v^2 / 2 - mu/r;
a = -mu / (2*energy);
e = sqrt(-h^2 / (mu * a) + 1);

% answer
theta = rad2deg(fzero(@(theta) atand(e*sin(theta) / (1+e*cos(theta)))- gamma, 0))
T = 2*pi * sqrt(a^3 / mu) / 3600