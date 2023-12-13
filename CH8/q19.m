mu = 3.986e14;

% Define first orbit
rp1 = 8100e3;
ra1 = 18900e3;
e1 = (ra1 - rp1) / (ra1 + rp1);
a_o1 = (ra1 + rp1)/2;
T_o1 = 2*pi * sqrt(a_o1^3 / mu);
h_o1 = sqrt(mu * a_o1 * (1-e1^2));

% find time difference between the orbits
theta_b1 = 45;
theta_c1 = 150;

E_b1 = 2 * atan(sqrt((1-e1) / (1+e1)) * tand(theta_b1/2));
E_c1 = 2 * atan(sqrt((1-e1) / (1+e1)) * tand(theta_c1/2));

M_b1 = E_b1 - e1 * sin(E_b1);
M_c1 = E_c1 - e1 * sin(E_c1);

dM = M_c1 - M_b1;
dT = dM / (2*pi) * T_o1;

% New orbit has periapsis at the point of maneuver, smaller orbit so we
% catch up
rp2 = a_o1 * (1-e1^2) / (1 + e1 * cosd(theta_b1));
T_o2 = T_o1 - dT;
a_o2 = ((T_o2/(2*pi))^2 * mu)^(1/3);
ra2 = 2 * a_o2 - rp2;
e2 = (ra2 - rp2) / (ra2 + rp2);
h_o2 = sqrt(mu * a_o2 * (1-e2^2));

% Delta-v change is made twice, calculate radial and normal velocity
% component at B
vr_o1 = mu / h_o1 * e1 * sind(theta_b1);
vn_o1 = mu / h_o1 * (1 + e1 * cosd(theta_b1));

% at periapsis
vr_o2 = 0;
vn_o2 = h_o2 / rp2;

dv = 2 * norm([vr_o1; vn_o1] - [vr_o2; vn_o2]);
fprintf("Total Delta V: %.3f km/s\n", dv/1e3);
