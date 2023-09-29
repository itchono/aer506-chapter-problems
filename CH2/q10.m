syms h v d_r dd_r theta dd_theta d_theta real

% Basics
r = h / cos(theta);
O_R_I = [sin(theta), -cos(theta), 0; cos(theta), sin(theta), 0; 0, 0, 1];

% Angular velocity
I_omega_IO = [0; 0; -d_theta];
O_omega_IO = I_omega_IO;

% Components for velocity
I_v_A = [v; 0; 0];
O_rho_A = [r; 0; 0];

% Acceleration parts
O_v_A_rel = [d_r; 0; 0];  % O_dr_A_dO
O_a_A_rel = [dd_r; 0; 0];
O_d_omega_IO = [0; 0; -dd_theta];
I_a_A = sym([0; 0; 0]);

vel_eqn = I_v_A == O_R_I * (O_v_A_rel + cross(O_omega_IO, O_rho_A));
acc_eqn = O_R_I' * I_a_A == cross(O_d_omega_IO, O_rho_A) + cross(O_omega_IO, cross(O_omega_IO, O_rho_A)) + 2 * cross(O_omega_IO, O_v_A_rel) + O_a_A_rel;
results = solve([vel_eqn; acc_eqn], [d_theta, d_r, dd_r, dd_theta]);

d_r = simplify(results.d_r, "Steps", 10)
d_theta = simplify(results.d_theta, "Steps", 10)
dd_r = simplify(results.dd_r, "Steps", 10)
dd_theta = simplify(results.dd_theta, "Steps", 10)




