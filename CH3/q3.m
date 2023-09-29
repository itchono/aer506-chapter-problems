syms d_theta Omega theta d m l real

% Frame C spins at rate
P_omega_IC = [d_theta; 0; Omega];

% How do we arrive at this??
I_rod = 1/12 * m * l^2 .* [1, 0, 0;
    0, sin(theta)^2, -sin(2*theta)/2;
    0 -sin(2*theta)/2, cos(theta)^2];

h = I_rod * P_omega_IC