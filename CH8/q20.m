mu = 3.986e14;

%% Part a) inefficient transfer
% basically set up two orbits, and calculate the differences in vr and vn
% at the same point
rc_o1 = 15000e3;

rp_o2 = 6878e3;
ra_o2 = 22000e3;
a_o2 = (ra_o2 + rp_o2) / 2;
e_o2 = (ra_o2 - rp_o2) / (ra_o2 + rp_o2);
h_o2 = sqrt(mu * a_o2 * (1-e_o2^2));

% find intersection point
theta_maneuver = acosd((a_o2 * (1-e_o2^2) / rc_o1 - 1) / e_o2);

% calculate characteristics of both orbits at intersection point
% orbit 1: trivial; circular orbit is always v_n only
vn_o1 = sqrt(mu/rc_o1);
vr_o1 = 0;
gamma_o1 = atan2d(vr_o1, vn_o1);

% orbit 2: use formulae
vn_o2 = mu / h_o2 * (1 + e_o2 * cosd(theta_maneuver));
vr_o2 = mu / h_o2 * e_o2 * sind(theta_maneuver);
gamma_o2 = atan2d(vr_o2, vn_o2);

dv_a = norm([vn_o1; vr_o1] - [vn_o2; vr_o2]);
fprintf("a) Delta V: %.3f km/s\n", dv_a/1e3);
fprintf("a) Change in gamma: %.3f deg\n", gamma_o2 - gamma_o1);


%% Part b) Hohmann transfer
vp_t = sqrt(mu) * sqrt(2/rc_o1 - 2/(rc_o1 + ra_o2));
va_t = sqrt(mu) * sqrt(2/ra_o2 - 2/(rc_o1 + ra_o2));
va_o2 = sqrt(mu) * sqrt(2/ra_o2 - 2/(rp_o2 + ra_o2));

dv_b = vp_t - vn_o1 + va_t - va_o2;
fprintf("b) Delta V: %.3f km/s\n", dv_b/1e3);
