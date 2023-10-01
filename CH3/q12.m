% Inertia tensor wrt body fixed frame, not necessarily CoM
O_O_I = [100 -20 -100; -20 300 -50; -100 -50 500];

[O_R_P, P_O_I] = eig(O_O_I)
% O_R_P is the rotation between principal and body frames,
% P_O_I is the inertia matrix in the principal frame