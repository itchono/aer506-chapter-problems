syms e h mu positive real


% consider perifocal frame (could also do with radial)
v_x = mu / h * (-sin(sym(pi/2)));  % invariant across both orbits
v_y = mu / h * (e + cos(sym(pi/2))); % inverts across the orbits

v = sqrt(v_x^2 + v_y^2);

dv = 2 * v_y;

ratio = subs(simplify(dv/v), "e", 0.4);
fprintf("Delta v = %.4f v\n", double(ratio))