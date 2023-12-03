r1 = [-294.32; 4265.1; 5986.7] * 1e3;
r2 = [-1365.5; 3637.6; 6346.8] * 1e3;
r3 = [-2940.3; 2473.7; 6555.8] * 1e3;

[v1, v2, v3] = gibbs(r1, r2, r3);
oe = cartesian2keplerian([r2; v2], 3.986e14);

fprintf("sma: %.2f km\n", oe(1)/1e3)
fprintf("ecc: %.4f\n", oe(2))
fprintf("inc: %.2f deg\n", oe(3))
fprintf("raan: %.2f deg\n", oe(4))
fprintf("aop: %.2f deg\n", oe(5))
fprintf("theta: %.2f deg\n", oe(6))
