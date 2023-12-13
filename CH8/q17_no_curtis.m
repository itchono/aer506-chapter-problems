% Initial params of orbit
mu = 3.986e14;
rpb = 8000e3;
rab = 13000e3;

Tb = 2 * pi * sqrt((rab/2 + rpb/2)^3 / mu);
eb = (rab - rpb) / (rab + rpb);
hb = sqrt((rab/2 + rpb/2) * (1-eb^2) * mu);

theta_2_0 = 30;
theta_2_f = 90;

E_2_0 = 2 * atan(sqrt((1-eb) / (1+eb)) * tand(theta_2_0/2));
E_2_f = 2 * atan(sqrt((1-eb) / (1+eb)) * tand(theta_2_f/2));

M_2_0 = E_2_0 - eb * sin(E_2_0);
M_2_f = E_2_f - eb * sin(E_2_f);

ToF = (M_2_f - M_2_0) / (2*pi) * Tb;

%% Set up Lambert's problem to solve for transfer orbit
% r1, r2, tof known
d_theta = pi/2;
r1 = rpb;
r2 = rpb * (1+eb);
r_vec_1 = [r1; 0; 0];
r_vec_2 = [0; r2; 0];

% use the AER506 algorithm for Lambert's problem
vt_vec_1 = lambert_elliptical(r_vec_1, r_vec_2, ToF, mu, 'pro');

%% Get details about transfer orbit
% propagate transfer orbit using lagrange coefficients
ht_vec = cross(r_vec_1, vt_vec_1);
ht = norm(ht_vec);

et_vec = cross(vt_vec_1, ht_vec) ./ mu - r_vec_1 / r1;
orbit_rot_angle = atan2d(et_vec(2), et_vec(1));
et = norm(et_vec);

% Note: perifocal frame here is bunk, because the perifocal frame of the
% transfer orbit is actually rotated!
% instead, use radial velocity, and alignment between r and e vectors
c_theta_t1 = dot(et_vec, r_vec_1) / et / r1;
s_theta_t1 = dot(vt_vec_1, r_vec_1) / r1 * ht / mu / et;
theta_t1 = atand(s_theta_t1 / c_theta_t1);
theta_t2 = theta_t1 + 90;

% to get proper velocities in this frame, we have to rotate the perifocal
% velocity by the rotation of the e vector
% {T} - transfer orbit frame
% {Q} - perifocal frame
Q_R_T = [cosd(orbit_rot_angle) -sind(orbit_rot_angle) 0;
       sind(orbit_rot_angle) cosd(orbit_rot_angle) 0;
       0 0 1];
vt_vec_2 = mu/ht * Q_R_T * [-sind(theta_t2); (et + cosd(theta_t2)); 0];

%% Get velocities of target orbit
vb_vec_1 = mu/hb * [-sind(0); eb + cosd(0); 0];
vb_vec_2 = mu/hb * [-sind(90); eb + cosd(90); 0];

dv1 = norm(vb_vec_1 - vt_vec_1);
dv2 = norm(vb_vec_2 - vt_vec_2);

fprintf("Total Delta V: %.3f km/s\n", (dv1 + dv2)/1e3);