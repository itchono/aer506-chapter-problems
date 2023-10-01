% principal axes inertia matrix about G
P_G_I = diag([320; 320; 560]);

% Nutation and rotation stuff, solve for components of angular velocity in
% P
theta = 20; % degrees
omega_s = 1;
omega_p = P_G_I(3,3) / (P_G_I(1,1) - P_G_I(3,3)) * omega_s / cosd(theta);
omega_xy = omega_p * sind(theta);
omega_0 = omega_s + omega_xy/tand(theta);

% Imagine a case where omega_xy is entirely in the y component
P_C_h = P_G_I * [0; omega_xy; omega_0];
% this is the CURRENT angular momentum in P
% eventually, P will rotate so that P_C_h is only in a single component
% this means the magnitude is invariant, but direction will change

% the angular momentum will eventually converge to the norm of the angular
% momentum in the P frame
omega_final_mag = norm(P_C_h) / P_G_I(3, 3)
