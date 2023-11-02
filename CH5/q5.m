mu = 3.986e14;
r_earth = 6378e3;

r_a = 600e3 + r_earth;
r_p = 200e3 + r_earth;

a = (r_a + r_p) / 2;
e = (r_a-r_p) / (r_a + r_p);
h = sqrt(mu * a * (1-e^2));

theta_400 = acos((h^2/mu / (400e3 + r_earth) - 1) /e)

T = 2*pi*sqrt(a^3 / mu);

E = 2 * atan(sqrt((1-e)/(1+e)) * tan(theta_400/2));
M_400 = E - e*sin(E);
T_pe_400 = M_400 / (2*pi) * T;

% subtract the parts under 400 km

T_above = (T - 2*T_pe_400)/60


