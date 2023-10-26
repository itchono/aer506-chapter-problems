% Givens for problem
% {I} inertial
% {O} body
I_R_O = [-0.1567 -0.12940 -0.97922;
       -0.31235 0.94698 -0.075324;
       0.93704 0.29409 -0.18831];

I_r_O = [-16; 84; 59];
I_v_O = [7; 9; 4];
I_a_O = [3; -7; 4];

I_omega_IO = [-0.8; 0.7; 0.4];
I_dI_omega_IO = [-0.4; 0.9; -1];

I_r_P = [51; -45; 36];
O_dO_r_P = [31; -68; -77];
O_dO_dO_r_P = [2; -6; 5];

% IMPORTANT: BASED ON RELATIVE LEVER ARM
I_r_OP = I_r_P - I_r_O;


% Conversion
O_R_I = I_R_O';
O_r_OP = O_R_I * I_r_OP;
O_v_O = O_R_I * I_v_O;
O_a_O = O_R_I * I_a_O;
O_omega_IO = O_R_I * I_omega_IO;
O_dO_omega_IO = O_R_I * I_dI_omega_IO;

O_v_P = O_dO_r_P + cross(O_omega_IO, O_r_OP)  + O_v_O;
I_v_P = I_R_O * O_v_P

O_a_P = O_dO_dO_r_P + cross(O_dO_omega_IO, O_r_OP) + 2 * cross(O_omega_IO, O_dO_r_P) + cross(O_omega_IO, cross(O_omega_IO, O_r_OP)) + O_a_O;
I_a_P = I_R_O * O_a_P