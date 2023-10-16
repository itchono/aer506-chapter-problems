r_1 = 402000e3;
theta_1 = 150;
v_1 = 2.23e3;
mu = 3.986e14;

% energy-SMA relations
energy = v_1^2 / 2 - mu / r_1
a = mu / (2*energy);

% rootfind
e = fzero(@(e) sqrt(mu * (1 + e.^2 + 2.*e.*cosd(theta_1)) / (a.*(e.^2-1))) - v_1, [1.0001, 100])

h = sqrt(mu * a * (e^2 - 1));

% periapsis parameters
r_p = h^2 / mu * 1/(1+e);
z_p = r_p - 6378e3

v_p = sqrt(mu * (1 + e.^2 + 2.*e) / (a.*(e.^2-1)))