pe = 400e3;
ap = 800e3;
re = 6378e3;
mu = 3.986e14;

% calculate SMA
a = ((pe + re) + (ap + re)) / 2;

% calculate period of orbit
T = 2*pi*sqrt(a^3/mu);

half_orbit_period = T / 2 / 60