syms omega theta m l a real positive

% NOTE: you're supposed to set up a FBD for this and everything, I got up
% to the part where I solved for net torque and basically left it there.
% Ignore the steps associated with calculating a, and defer to the course
% solutions.

% Frames
% {B} blue rod
% {O} orange rod

B_omega_IB = [0; 0; 0];
B_omega_BO = [omega; 0; 0];

B_R_O = [cos(-theta), -sin(-theta), 0;
        sin(-theta), cos(theta), 0;
        0, 0, 1];

O_omega_BO = B_R_O.' * B_omega_BO;
O_omega_IO = O_omega_BO + B_R_O.' * B_omega_IB;

O_C_I = diag([0; 1/3 * (2/3 * m) * (2/3 * l)^2 + 1/3 * (1/3 * m) * (1/3 * l)^2; 1/3 * (2/3 * m) * (2/3 * l)^2 + 1/3 * (1/3 * m) * (1/3 * l)^2]);

% Get angular momentum about C in frame O, then differentiate
O_dO_omega_BO = [0; 0; 0];
O_h_C = O_C_I * O_omega_IO;
O_dO_h_C = O_C_I * O_dO_omega_BO;
O_dI_h_C = O_dO_h_C + cross(O_omega_IO, O_h_C)

% let's say the acceleration points to the right; the torque is therefore:
O_C_t_ext = [0; 0; -1/3 * l * a * (2/3 * m) * cos(theta) + 1/6 * l * a * (1/3 * m) * cos(theta)]

% we can solve for a
a = solve(O_C_t_ext == O_dI_h_C, a)

rxn = a * 2 * m