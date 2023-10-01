% N.B. you could do this problem way more intelligently with scalars, but
% this is a very explicit form to practice the notation in the course.

% Imagine a long tall cylinder
P_C_I = diag([5000; 5000; 1000]);

P_omega_initial = [0; 0; 6];
P_C_h_intiial = P_C_I * P_omega_initial;
T_r_initial = 1/2 * P_omega_initial' * P_C_I * P_omega_initial;

% switch from z-axis rotation to x-axis rotation
P_C_h_final = [norm(P_C_h_intiial); 0; 0];
P_omega_final = P_C_I \ P_C_h_final;
T_r_final = 1/2 * P_omega_final' * P_C_I * P_omega_final;

% change in KE
dT_r = T_r_final - T_r_initial

