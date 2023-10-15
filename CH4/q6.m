r = 1e3 * [7000; -2000; -4000];
v = 1e3 * [3; -6; 5];

mu = 3.986e14;

h = cross(r, v);
ecc_vec = cross(v, h) / mu - r / norm(r)

% we have to figure out that it's after periapsis
true_anomaly = rad2deg(fzero(@(theta) norm(h)^2 / mu * 1/(1 + norm(ecc_vec) * cos(theta)) - norm(r), 0.1))
