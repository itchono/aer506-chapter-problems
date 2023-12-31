% A little broken?
% Frames: {O} - spacecraft, {S} - solar panel

% Givens
theta = deg2rad(40);
d_theta = 0.01;
N = 0.1;
l = 6;
w = 2;
d0 = 1.5;
t = 0.025;
m = 50;

% inertia matrix
S_G_I = 1/12 * m * diag([l^2 + t^2; w^2 + t^2; l^2 + w^2]);

% parallel axis theorem
% A_I = B_I - m * tilde(r_B<-A) * tilde(r_B<-A)
S_O_I = S_G_I - m * skew(-[0; d0 + l/2; 0]) * skew(-[0; d0 + l/2; 0]);

%% Frame rotations
O_omega_IO = [0; 0; N];
O_omega_OS = [0; -d_theta; 0];
O_omega_IS = O_omega_OS + O_omega_IO;

% this rotation was set up wrong, because I assumed a different coord
% system when I did in in CH2, lmao
O_R_S = [cos(-theta), 0, sin(-theta);
        0 1 0;
        -sin(-theta), 0, cos(-theta)] * ...
        [0 0 1;
        0 -1 0;
        1 0 0];

S_omega_IS = O_R_S' * O_omega_IS;
S_h_O = S_O_I * S_omega_IS;
O_h_O = O_R_S * S_h_O

% Euler's equation: moment = d/dt(h) + omega cross h
% and, we're doing net moment about G


% Figured this out from looking at the solutions
S_dS_omega_IS = [-N*d_theta*sin(theta); 0; N*d_theta*cos(theta)];
S_dI_omega_IS = S_dS_omega_IS + cross(S_omega_IS, S_dS_omega_IS);

S_h_G = S_G_I * S_omega_IS;
S_dI_h_G = S_G_I * S_dI_omega_IS + cross(S_omega_IS, S_h_G)

