mu = 3.986e14;

r_0 = sph_2_geo_deg(60, -20, 500e3 + 6378e3);
v_0 = [0; 0; 10e3];

h_vec = cross(r_0, v_0);
h = norm(h_vec);
r = norm(r_0);

e_vec = cross(v_0, h_vec) / mu - v_0 / r;
e = norm(e_vec);

orbit_ode = @(t, y) [y(4:6); -mu * y(1:3) / norm(y(1:3))^3];

[t, y] = ode89(orbit_ode, [0, 1800], [r_0; v_0]);

r_final = y(end, 1:3);

[ra, dec, ~] = geo_2_sph_deg(r_final(:))