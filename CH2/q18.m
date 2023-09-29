% Frames
% {B} body - rotating
% {C} comoving frame - rotating wrt inertial at w
% {I} inertial frame

syms w_x w_y w_z real

% rewrite knowns in frame C
C_omega_IC = [w_x; w_y; 0];
C_omega_IB = [w_x; w_y; w_z];

% set up coriolis formula
C_dC_omega_IB = sym([0; 0; 0]);  % local deriv. is zero

% differentiate using coriolis formula. since we represent everything in
% frame C, we use omega_IC as the angular velocity to cross with.
C_dI_omega_IB = C_dC_omega_IB + cross(C_omega_IC, C_omega_IB)