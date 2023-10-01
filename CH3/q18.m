% Get principal frame
C_C_I = [0.1522 -0.03975 0.012;
        -0.03975 0.07177 0.04057;
        0.012 0.04057 0.1569];
[C_R_P, P_C_I] = eig(C_C_I)

% Compute angular momentum (constant)
C_omega_IC = [10; 0; 0];
C_C_h = C_C_I * C_omega_IC;
% also get initial KE
T_r_i = 1/2 * C_omega_IC.' * C_C_I * C_omega_IC;

% Eventually, the C frame will rotate to become the P frame once it loses
% energy, and everything will be spinning about Z (major axis). So:
P_C_h_final = [0; 0; norm(C_C_h)];

% solve for angular velocity
P_omega_IC_final = P_C_I \ P_C_h_final
T_r_final = 1/2 * P_omega_IC_final.' * P_C_I * P_omega_IC_final

% NOTE: small discrepancy from course solution, but this is more precise
dT_r = T_r_final - T_r_i