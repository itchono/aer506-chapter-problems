% Frames
% {I} inertial
% {B} body

syms phi(t) theta(t) psi(t)

B_G_I = diag([1000; 2000; 3000]);

phi(t) = 2 * t * exp(-0.05*t);
theta(t) = 0.02 + 0.3 * sin(0.25 * t);
psi(t) = 0.6 * t;

Rz1 = [cos(phi), -sin(phi), 0;
        sin(phi), cos(phi), 0;
        0, 0, 1];
Rx2 = [1, 0, 0;
       0, cos(theta), -sin(theta);
       0, sin(theta), cos(theta)];

Rz3 = [cos(psi), -sin(psi), 0;
        sin(psi), cos(psi), 0;
        0, 0, 1];

% rotation from inertial to body frame
R = Rz1 * Rx2 * Rz3;  % I_R_B
crs_omega = diff(R) * R.';
crs_d_omega = diff(crs_omega);

crs_B_omega_10 = double(crs_omega(10));
crs_B_dB_omega_10 = double(crs_d_omega(10));

% These vectors are expressed in the inertial frame, need to convert them
I_omega_10 = [-crs_B_omega_10(2, 3); crs_B_omega_10(1, 3); -crs_B_omega_10(1, 2)];
I_dB_omega_10 = [-crs_B_dB_omega_10(2, 3); crs_B_dB_omega_10(1, 3); -crs_B_dB_omega_10(1, 2)]

S_matrix = [sin(phi)*sin(theta), cos(phi), 0;
            -cos(phi)*sin(theta), sin(phi), 0;
            cos(theta), 0, 1];
S_10 = S_matrix(10);

B_R_I = R(10).';

d_phi = diff(phi);
d_theta = diff(theta);
d_psi = diff(psi);
B_omega_10_by_s_matrix = double(B_R_I * S_10 * [d_psi(10); d_theta(10); d_phi(10)])

% rotate vectors to body frame (principal axes)
B_omega_10 = double(B_R_I * I_omega_10)
B_dB_omega_10 = double(B_R_I * I_dB_omega_10);

net_moment = B_G_I * B_dB_omega_10 + cross(B_omega_10, B_G_I * B_omega_10)