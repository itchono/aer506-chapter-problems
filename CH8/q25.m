syms e h mu positive real

% VERY similar setup to q22

% consider perifocal frame (could also do with radial)
v_x = mu / h * (-sin(sym(pi/2)));  % invariant across both orbits
v_y = mu / h * (e + cos(sym(pi/2))); % inverts across the orbits
dv = 2 * v_y;

simplify(dv)