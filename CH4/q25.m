mu = 3.986e14;
r_vec_0 = 1e3 * [6320; 0; 7550];
v_vec_0 = 1e3 * [0; 11; 0];

% Do something goofy and simulate full 2 body motion

ode = @(t, y) [y(4:6); -mu * y(1:3) / norm(y(1:3))^3];

[t, y] = ode89(ode, [0 600], [r_vec_0; v_vec_0]);

r_vec_1 = y(end, 1:3)


d_theta = acosd(dot(r_vec_0, r_vec_1) / (norm(r_vec_0) * norm(r_vec_1)))

