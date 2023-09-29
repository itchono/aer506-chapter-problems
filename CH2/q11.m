syms rho l omega_yaw omega_spin v real

% Frames - airframe (A), hub (H)
% Both frames are at same orientation to the inertial frame
% Basically we want the 

%% Velocity
A_r_A = [0; -rho; 0];
A_omega_IA = [0; omega_yaw; v/rho];
A_omega_IH = [omega_spin; omega_yaw; v/rho];
A_rho_HP = [0; l; 0];

% A does not move wrt A
A_v_A = cross(A_omega_IA, A_r_A);
A_v_P = A_v_A + cross(A_omega_IH, A_rho_HP);

% Get "inertial-wrt" velocity
A_v_P_wrt_A = simplify(A_v_P - A_v_A);
disp(A_v_P_wrt_A)

%% Acceleration
% figure out RoC of prop speed wrt inertial; doesn't change wrt self
A_d_omega_IH = cross(A_omega_IA, A_omega_IH);

% v_rel and a_rel are all zero
A_a_P_wrt_A = cross(A_d_omega_IH, A_rho_HP) + cross(A_omega_IH, cross(A_omega_IH, A_rho_HP));
disp(simplify(A_a_P_wrt_A))
