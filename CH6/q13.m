mu = 3.986e14;
J2 = 1.080263e-3;
RE = 6378e3;

% PARAMETER, 
n_orbits_per_day = 15; % between 7 and 16 possible (17 is MAYBE possible)

T = 86400 / n_orbits_per_day;
a = ((T / (2*pi))^2 * mu) ^ (1/3);
h_orbit = (a - RE) / 1e3
e = 0;

target = deg2rad(360 / 365.26 / 86400);

fac = -3/2 * sqrt(mu) * RE^2 / ((1-e^2)^2 * a^3.5) * J2;

i = acosd(target/fac)