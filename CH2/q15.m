% Frames
% {B} Blue rod, spins about inertial Z at 3 rad/s
% {R} Red rod, spins about blue X at 6 rad/s, x blue = y red
% {G} Green spinner, spins about red X at 9 rad/s

% Set up ang vel of blue
B_omega_IB = [0; 0; 3];


% Rotation between blue and red (instantaneous)
B_R_R = [0 1 0;
        -1 0 0;
        0 0 1];
% REMEMBER: B_R_R is NOT constant; this is instantaneous.

R_R_B = B_R_R';
R_omega_IB = R_R_B * B_omega_IB;
% REMEMBER: R_R_B is NOT constant, so differentiating omega_IB's components
% in R requires us to account for d/dt (R_R_B * B_omega_IB)

% Ang vel of red
R_omega_BR = [0; 6; 0];
R_omega_RB = -R_omega_BR;

% Ang vel of green
R_omega_RG = [9; 0; 0];

% Get absolute ang vel of green IB -> BR -> RG
R_omega_IG = R_omega_IB + R_omega_BR + R_omega_RG;

%% take deriv wrt inertial, from R frame
% R_omega_IB is not actually constant; we must get its derivative
R_dR_omega_IB = -skew(R_omega_RB) * R_R_B * B_omega_IB;
R_dR_omega_IG = [0; 0; 0] + R_dR_omega_IB;

R_omega_IR = R_omega_IB + R_omega_BR;  % IR = IB + BR
R_dI_omega_IG = R_dR_omega_IG + cross(R_omega_IR, R_omega_IG)

mag_a_3 = norm(R_dI_omega_IG)
