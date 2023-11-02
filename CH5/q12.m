mu = 3.986e14;
gamma = -80;
r = 100000e3 + 6378e3;
v = 6e3;

vn = v * cosd(gamma);
vr = v * sind(gamma);
h = r * vn;

energy = v^2 / 2 - mu/r;
a = mu / (2*energy); % hyperbolic

% h = sqrt(mu * a * (e^2-1))
e = sqrt(h^2 / mu / a + 1);

rp = h^2 / mu * 1/(1+e);
flyby_alt = rp - 6378e3;  % no impact

% theta must be negative, because gamma < 0
theta_current = -acos((h^2 / mu / r - 1)/e);

E_current = 2*atanh(sqrt((e-1)/(e+1)) * tan(theta_current/2));
M_current = e*sinh(E_current) - E_current;
t_current = M_current * h^3 / mu^2 / (e^2-1)^1.5;

t_till_pe = -t_current / 3600
