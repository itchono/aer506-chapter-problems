% AER506 notation

% Givens
I_rO = [-16; 84; 59];
I_vO = [7; 9; 4];
I_aO = [3; -7; 4];

I_r_Pabs = [51; -45; 36];

I_w_IO = [-0.8; 0.7; 0.4];
I_wd_IO = [-0.4; 0.9; -1];

O_v_rel = [31; -68; -77];
O_a_rel = [2; -6; 5];

% Calculate Intermediates
% Rotation from units
I_R_O = [-0.1567 -0.12940 -0.97922;
       -0.31235 0.94698 -0.075324;
       0.93704 0.29409 -0.18831];

I_a_rel = I_R_O * O_a_rel;
I_v_rel = I_R_O * O_v_rel;
I_r_rel = I_r_Pabs - I_rO;

% Results
v_p = I_vO + I_v_rel + cross(I_w_IO, I_r_rel);
a_p = I_aO + I_a_rel + cross(I_wd_IO, I_r_rel) + 2*cross(I_w_IO, I_v_rel) + cross(I_w_IO, cross(I_w_IO, I_r_rel));

