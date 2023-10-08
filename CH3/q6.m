% Frames
% {I} inertial
% {B} base, spinning at omega_p wrt inertial axes
% {G} gimbal
% {F} flywheel
% Let's set it up so that {I} has the same orientation as {F}.

syms G_dG_omega_IF [3 1]

% inertia matrix
F_F_I = diag([5; 5; 10]);

% angular velocities given
I_omega_IB = [0; 0.5; 0];
B_omega_BG = [0; 0; 0];  % initially stationary wrt base
G_omega_GF = [0; 0; 100];

% since all the frames are identically oriented and we don't need to care
% about any derivatives of rotation matrices, we don't need to care about
% anything, and we can just add components
G_omega_IF = I_omega_IB + B_omega_BG + G_omega_GF;
G_omega_IG = I_omega_IB + B_omega_BG;

% Get inertial derivative of angular momentum, so that we can equate it to 
% applied moment (using Euler's equation of rotation)
% (i.e. dI_h_F = F_F_t_ext)
G_dI_h_F = F_F_I * G_dG_omega_IF + cross(G_omega_IG, F_F_I * G_omega_IF);
F_F_t_ext = [600; 0; 0];

sol = solve(G_dI_h_F == F_F_t_ext);
G_dG_omega_IF = [sol.G_dG_omega_IF1; sol.G_dG_omega_IF2; sol.G_dG_omega_IF3];

% Take inertial derivative of angular acceleration
G_dI_omega_IF = G_dG_omega_IF + cross(G_omega_IG, G_omega_IF)
% very nice