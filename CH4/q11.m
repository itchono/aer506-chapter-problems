ap = 2000e3;
pe = 500e3;
re = 6378e3;
mu = 3.986e14;

r_pe = pe + re;
r_ap = ap + re;

% calculate SMA
a = (r_pe + r_ap) / 2;

% calculate eccentricity
e = (r_ap - r_pe) / (r_ap + r_pe)

% velocities at AP, PE
v_pe = sqrt(mu * (2/r_pe - 1/a))
v_ap = sqrt(mu * (2/r_ap - 1/a))

% period
T = 2*pi * sqrt(a^3 / mu) / 60 % min