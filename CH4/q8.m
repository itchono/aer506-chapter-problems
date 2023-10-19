syms mu e a c_theta

% r = a
v_circ = sqrt(mu/a);
v_elliptical = sqrt(mu * (1 + e^2 + 2*e*c_theta)/(a*(1-e^2)));

solve(v_circ == v_elliptical, c_theta)