syms mu alpha e a c_theta

v = sqrt(mu * (1 + e^2 + 2*e*c_theta)/(a*(e^2-1)));

v_inf = sqrt(2 * mu / (2*a));

simplify(solve(v == alpha * v_inf, c_theta))