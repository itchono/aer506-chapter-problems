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

% parallel axis theorem to reach origin
S_O_I = S_G_I + diag([0; 0; m*(l/2 + d0)^2]);

%% Frame rotations
O_omega_IO = [0; 0; N];
O_omega_OS = [0; -d_theta; 0];
O_omega_IS = O_omega_OS + O_omega_IO;

O_R_S = [cos(-theta), 0, sin(-theta);
        0 1 0;
        -sin(-theta), 0, cos(-theta)];

S_omega_IS = O_R_S.' * O_omega_IS;

S_h_O = S_O_I * S_omega_IS

t_ext = cross(S_omega_IS, S_h_O)
