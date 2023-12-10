% Using values from the q10 solutions instead of answers to q9,
% because my q9 diverges from the solutions
r2 = [2908.04; 5474.36; -2500.03] * 1e3;
v2 = [1.99357; 2.20552; 7.12881] * 1e3;

ke = cartesian2keplerian([r2; v2], 3.986e14);
print_ke(ke);