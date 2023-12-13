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

% Use the curtis solver for Lambert's problem
[vt_vec_1, vt_vec_2] = lambert(r_vec_1, r_vec_2, ToF, mu, 'pro');

%% Get velocities of target orbit
vb_vec_1 = mu/hb * [-sind(0); eb + cosd(0); 0];
vb_vec_2 = mu/hb * [-sind(90); eb + cosd(90); 0];

dv1 = norm(vb_vec_1 - vt_vec_1);
dv2 = norm(vb_vec_2 - vt_vec_2);

fprintf("Total Delta V: %.3f km/s\n", (dv1 + dv2)/1e3);