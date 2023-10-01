%% TOREDO, BROKEN

% Frames
% {I} inertial
% {B} base, spinning at omega_p wrt inertial axes
% {G} gimbal
% {F} flywheel
% Let's set it up so that {I} has the same orientation as {F}.

% inertia matrix
F_F_I = diag([5; 5; 10]);

% angular velocities given
I_omega_IB = [0; 0.5; 0];
B_omega_BG = [0; 0; 0];
G_omega_GF = [10; 0; 0];

% since all the frames are identically oriented and we don't need to care
% about any derivatives of rotation matrices, we don't need to care about
% anything, and we can just add components

G_omega_IF = I_omega_IB + B_omega_BG + G_omega_GF;

G_F_t_ext = [600; 0; 0];

% t = I * dI_omega + omega x (I * omega)
% dI_omega = I \ (t - omega x (I * omega))

G_dI_omega_IF = F_F_I \ (G_F_t_ext - cross(G_omega_IF, F_F_I * G_omega_IF))
