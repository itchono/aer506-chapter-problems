v = 7.6e3;
r = 6378e3 + 500e3;
mu = 3.986e14;

% r, v -> energy -> a
energy = v^2 / 2 - mu/r;
a = -mu / (2*energy);

T = 2*pi * sqrt(a^3/mu) / 3600

