% a pure calculation question

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
R = Rz1 * Rx2 * Rz3;
crs_omega = diff(R) * R.';
crs_d_omega = diff(crs_omega);

crs_B_omega_10 = double(crs_omega(10));
crs_B_dB_omega_10 = double(crs_d_omega(10));

% These vectors are expressed in the inertial frame, need to convert them
I_omega_10 = [-crs_B_omega_10(2, 3); crs_B_omega_10(1, 3); -crs_B_omega_10(1, 2)];
I_dB_omega_10 = [-crs_B_dB_omega_10(2, 3); crs_B_dB_omega_10(1, 3); -crs_B_dB_omega_10(1, 2)]

% why am I rotating this way (i.e. why did I need to transpose?)
B_omega_10 = double(R(10).' * I_omega_10);
B_dB_omega_10 = double(R(10).' * I_dB_omega_10);

net_moment = B_G_I * B_dB_omega_10 + cross(B_omega_10, B_G_I * B_omega_10)