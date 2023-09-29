% Frames
% {B} blue rod, rotates about inertial 
% {R} red rod, rotates about x-axis of blue (axes ijk)
% {G} green spinner about x-axis of red
% {I} inertial (axes IJK)
syms phi theta real

% NOTE: THETA CHANGES BY 3 RAD/S

% let the blue rod's frame coincide with inertial for phi = 0
I_R_B = [cos(phi), -sin(phi), 0;
        sin(phi), cos(phi), 0;
        0 0 1;];
B_R_I = I_R_B';

% we know the ang vel of blue rod wrt inertial [2 K]
B_omega_IB = sym([0; 0; 2]);

% set up rotation between blue and red shafts
B_R_R = [0, 1, 0;
         -sin(theta), 0, cos(theta);
         cos(theta), 0, sin(theta)];
R_R_B = B_R_R';

% angular velocity of red rod wrt blue (in red coord system) [3 j]
R_omega_BR = [0; 3; 0];

% combined rotation = red rot wrt inertial IB -> BR = IR
R_omega_IR = R_R_B * B_omega_IB + R_omega_BR;

% angular velocity of spinner [4 j]
R_omega_RG = [4; 0; 0];
R_omega_IG = R_omega_IR + R_omega_RG;

% coriolis in frame R; local deriv is zero
R_dR_omega_IG = diff(R_omega_IG, theta) * 3;  % (deriv wrt theta times theta dot)
R_dI_omega_IG = simplify(R_dR_omega_IG + cross(R_omega_IR, R_omega_IG))

mag_a_3 = expand(norm(R_dI_omega_IG))
