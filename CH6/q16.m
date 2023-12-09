mu = 3.986e14;
J2 = 1.080263e-3;
RE = 6378e3;

a = 6378e3 + 180e3;
e = 0;
T = 2 * pi * sqrt(a^3 / mu);

w = deg2rad(15.04) / 3600;  % rad/s, "westward shift"

fac = -3/2 * sqrt(mu) * RE^2 / ((1-e^2)^2 * a^3.5) * J2;
% per orbit change
dOmega = fac * cosd(30) * T; % "eastward shift"

spacing = T * w - dOmega;

distance = RE * spacing
