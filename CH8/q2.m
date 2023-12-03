% Determine original orbit
mu = 3.986e14;
r = 500e3 + 6378e3;
v = sqrt(mu/r);

% To impact at point B, find the orbit which has r = 6378 at true anomaly
% of 60 degrees
ra = r;
r_impact = 6378e3;

e = fzero(@(e) (1-e)/(1+e/2) - r_impact/ra, 0.1);
h = sqrt(mu * ra * (1-e));
va = mu / h * (1-e);
dv = va - v;
fprintf("a) %.2f m/s\n", dv)

% To impact at point C, we kill all velocity and fall straight down
fprintf("b) %.2f m/s\n", -v)