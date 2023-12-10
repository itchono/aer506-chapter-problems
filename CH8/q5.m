% solve for an orbit such that the apoapsis is 200 km height, and time to
% reach 6378 km is 30 mins

mu = 3.986e14;
r_ap = 200e3 + 6378e3;

r_pe = fzero(@(r_pe) time_to_impact(r_pe) - 1800, [6377e3, 6000e3]);

dv = sqrt(mu) * sqrt(2/r_ap - 2 / (r_ap + r_pe)) - sqrt(mu/r_ap)

function t = time_to_impact(r_pe)
mu = 3.986e14;
r_ap = 200e3 + 6378e3;
a = (r_ap + r_pe) / 2;
e = (r_ap - r_pe) / (2*a);

h = sqrt(a * mu * (1-e^2));

theta_impact = acos((h^2 / mu / 6378e3 - 1) / e);

E_impact = 2 * atan(sqrt((1-e)/(1+e)) * tan(theta_impact/2));
M_impact = E_impact - e * sin(E_impact);
M_ap = pi;

dM = M_ap - M_impact;
T = 2 * pi * sqrt(a^3 / mu);

t = dM / (2*pi) * T;


end