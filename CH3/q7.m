syms L g m omega theta real positive

% Frames
% {I} Inertial
% {S} Shaft, rotating at [0; 0; omega] wrt inertial
% {R} Rod, at an angle theta

S_omega_IS = [0; 0; omega];

% frame rotation; x rot by theta
S_R_R = [1, 0, 0;
        0, sin(theta), cos(theta);
        0, -cos(theta), sin(theta)];

% net torque is a "seesaw balance" of both ends of the rod
R_R_t_ext = [1/3 * m * L/6  * sin(theta) * g ...
    - 2/3 * m *L/3 * sin(theta) * g; 0; 0];

% rod is not moving
S_omega_SR = [0; 0; 0];
S_omega_IR = S_omega_SR + S_omega_IS;
R_omega_IR = S_R_R.' * S_omega_IR;

% Inertia matrix (2 rods end-to-end (1/3 ml^2))
R_R_I = diag([1/3 * (2/3 * m) * (2/3*L)^2; 0; 1/3 * (2/3 * m) * ...
    (2/3*L)^2]) + diag([1/3 * (1/3 * m) * (1/3*L)^2; 0; 1/3 * (1/3 * m) * (1/3*L)^2]);

% Angular momentum
R_h_R = R_R_I * R_omega_IR;
R_dR_h_R = [0; 0; 0];  % assumed stationary rod (equilibrium)

R_dI_h_R = R_dR_h_R + cross(R_omega_IR, R_h_R);

% solve assuming theta is constant
simplify(solve(subs(R_R_t_ext == R_dI_h_R, diff(theta, t), 0), omega), "Steps", 10)