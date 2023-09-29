%% To fix

% Frames
% {R} - Rotor
% {G} - Gimbal ring frame (xyz)
% {B} - Base frame
% {I} - Inertial frame (XYZ)

syms omega_spin d_theta theta N real
Phi = sym(pi/2);

G_omega_GR = [0; 0; omega_spin];  % wrt xyz axes
G_omega_BG = [d_theta; 0; 0];
B_omega_IB = [0; 0; N];  % wrt inertial axes

% Rotation between gimbal ring and gyro base
B_R_G = [1, 0, 0;
         0, cos(theta), -sin(theta);
         0, sin(theta), cos(theta)];

% Rotation between gyro base and inertial frame
I_R_B = [cos(Phi), -sin(Phi), 0;
        sin(Phi), cos(Phi), 0;
        0, 0, 1];

I_R_G = I_R_B * B_R_G;

%% Absolute angular velocity
G_omega_IB = B_R_G' * B_omega_IB;

% a)
G_omega_IR = G_omega_IB + G_omega_BG + G_omega_GR

%% Absolute angular acceleration
% b)
G_omega_IG = G_omega_IB + G_omega_BG;  % must get rate of frame G because we express in it

% compute derivative of components in G frame
G_dG_omega_IR = [0; d_theta * N * cos(theta); d_theta * N * sin(theta)];

G_d_omega_IR = simplify(G_dG_omega_IR + cross(G_omega_IG, G_omega_IR), "Steps", 10)


