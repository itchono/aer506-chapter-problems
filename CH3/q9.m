syms omega_p

% Frames
% {I} inertial
% {R} rod (the pivot axis, not moving with flywheel); xyz axis given by the
% problem
% {P} body of flywheel (rotating), principal axes

% we use the fact that the flywheel is axissymmetric, so that we can use
% its inertia matrix in the R frame.
% (otherwise, the direction of action of torque would be angle dependent on
% how much P has rotated, etc.)

R_omega_IR = [0; omega_p; 0];
R_omega_RP = [0; 0; 630];

R_omega_IP = R_omega_RP + R_omega_IR;
R_O_I = sym(diag([0.01406; 0.01406; 0.02812]));

R_h = R_O_I * R_omega_IP;

% this is the key observation to make
R_t_ext = [0.25 * 10 * 9.81; 0; 0];

% angular velocity is non-accelerating
R_dI_omega = [0; 0; 0] + cross(R_omega_IR, R_h);

double(solve(R_t_ext == R_dI_omega, omega_p))