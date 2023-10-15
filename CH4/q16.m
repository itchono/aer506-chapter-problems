mu = 3.986e14;

r_1 = 1000e3 + 6378e3;
theta_1 = 40;

r_2 = 2000e3 + 6378e3;
theta_2 = 150;

% h_1 = h_2
% r_1 * mu * (1 + e * cos(theta_1)) = r_2 * mu * (1 + e * cos(theta_2))
syms e

e = double(solve(r_1 * mu * (1 + e * cosd(theta_1)) == r_2 * mu * (1 + e * cosd(theta_2)), e))

h = sqrt(r_1 * mu * (1 + e * cosd(theta_1)));

r_p = h^2 / mu * 1/(1+e);
z_p = r_p - 6378e3

r_a = h^2 / mu * 1/(1-e);

a = (r_p+r_a)/2

