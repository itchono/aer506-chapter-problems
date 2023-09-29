syms wx wy wz

A_w_IB = [wx; wy; wz];
A_w_IA = [wx; wy; sym(0)];

A_wd_IB = cross(A_w_IA, A_w_IB)