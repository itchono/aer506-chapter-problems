% Frames
% {I} inertial frame
% {C} cylinder - rotating wrt inertial, and holds the RED ROD
% {B} blue rod - rotating wrt cylinder + red rod
% {G} green rod - rotating wrt blue rod
% {P} plane - rotating wrt green rod

% ASSUME ALL FRAMES HAVE IDENTICAL ORIENTATION WHEN ANGLES ARE ZERO

syms theta(t) phi(t) nu(t) psi(t)
syms l real

% I -> C: Z rotation by theta
I_R_C = [cos(theta), -sin(theta), 0;
        sin(theta), cos(theta), 0;
        0, 0, 1];
C_omega_IC = [0; 0; diff(theta, t)];
C_rho_pB = [0; 5*l/4; 0];

% C -> B: Y rotation by phi 
C_R_B = [cos(phi), 0, sin(phi);
        0, 1, 0;
        -sin(phi), 0, cos(phi)];

B_omega_CB = [0; diff(phi, t); 0];
B_rho_pC = [0; 0; l];

% B -> G: Z rotation by nu
B_R_G = [cos(nu), -sin(nu), 0;
        sin(nu), cos(nu), 0;
        0, 0, 1];
G_omega_BG = [0; 0; diff(nu, t)];

% G --> P: Y rotation by psi
G_R_P = [cos(psi), 0, sin(psi);
        0, 1, 0;
        -sin(psi), 0, cos(psi)];

P_omega_GP = [0; diff(psi, t); 0];

% bring it all together
%% a)
% we want C_omega_IP
C_omega_IP = simplify(C_omega_IC + C_R_B * B_omega_CB...
    + C_R_B * B_R_G * G_omega_BG + C_R_B * B_R_G * G_R_P * P_omega_GP, "Steps", 10)

%% b)
% differentiate directly, assuming rotation rates are constant
C_dC_omega_IP = subs(diff(C_omega_IP), ...
    [diff(theta(t), t, 2),...
    diff(phi(t), t, 2),...
    diff(nu(t), t, 2),...
    diff(psi(t), t, 2)], [0, 0, 0, 0]);
C_dI_omega_IP = simplify(C_dC_omega_IP + cross(C_omega_IC, C_omega_IP), "Steps", 10)

%% c)
% we want C_dI_dI_position_pC
% solve for the second deriv of the point c
% first get the absolute position of point c

C_position_pC = C_rho_pB + C_R_B * B_rho_pC;

C_dC_position_pc = subs(diff(C_position_pC), ...
    [diff(theta(t), t, 2),...
    diff(phi(t), t, 2),...
    diff(nu(t), t, 2),...
    diff(psi(t), t, 2)], [0, 0, 0, 0]);

C_dI_position_pc = simplify(C_dC_position_pc + cross(C_omega_IC, C_position_pC), "Steps", 20);

C_dC_dI_position_pc = subs(diff(C_dI_position_pc), ...
    [diff(theta(t), t, 2),...
    diff(phi(t), t, 2),...
    diff(nu(t), t, 2),...
    diff(psi(t), t, 2)], [0, 0, 0, 0]);

C_dI_dI_position_pc = simplify(C_dC_dI_position_pc + cross(C_omega_IC, C_dI_position_pc), "Steps", 20)



