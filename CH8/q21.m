mu = 3.986e14;

% Determine initial orbit/trajectory
vp_1 = 9e3;
rp_1 = 1270e3 + 6378e3;

h_1 = vp_1 * rp_1;
nrg_1 = vp_1^2 / 2 - mu / rp_1;
a_1 = -mu / (2*nrg_1);
ra_1 = 2*a_1 - rp_1;
e_1 = (ra_1 - rp_1) / (ra_1 + rp_1);

% Find characteristics of current orbit at maneuver point
vn_1 = mu / h_1 * (1 + e_1 * cosd(100));
vr_1 = mu / h_1 * e_1 * sind(100);
r_mnv = a_1 * (1-e_1^2) / (1 + e_1 * cosd(100));
gamma_1 = atan2d(vr_1, vn_1);

% we have enough constraints now: radius = r_mnv, theta = 100, e = 0.4
% solve for SMA
e_2 = 0.4;
a_2 = r_mnv * (1 + e_2 * cosd(100)) / (1-e_2^2);
h_2 = sqrt(mu * a_2 * (1-e_2^2));

% find velocities
vn_2 = mu / h_2 * (1 + e_2 * cosd(100));
vr_2 = mu / h_2 * e_2 * sind(100);
gamma_2 = atan2d(vr_2, vn_2);

dv_a = norm([vn_1; vr_1] - [vn_2; vr_2]);
fprintf("Delta V: %.3f km/s\n", dv_a/1e3);
fprintf("Change in gamma: %.3f deg\n", gamma_2 - gamma_1);
