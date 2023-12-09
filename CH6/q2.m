mu = 3.986e14;

r_0 = sph_2_geo_deg(60, -20, 500e3 + 6378e3);   % theta in -90 to +90
v_0 = [0; 0; 10e3];     % moving towards perigee therefore in -90 to 0

h_vec = cross(r_0, v_0);
h = norm(h_vec);
r = norm(r_0);

e_vec = cross(v_0, h_vec) / mu - r_0 / r;
e = norm(e_vec);

energy = norm(v_0)^2 / 2 - mu / norm(r_0);
a = -mu/(2*energy);
T = 2*pi * sqrt(a^3 / mu);

theta0 = -acos((h^2 / mu / r - 1) / e);
E0 = 2*atan(sqrt((1-e)/(1+e)) * tan(theta0/2));
M0 = E0 - e*sin(E0);

t0 = M0 /(2 * pi) * T;
tf = t0 + 1800;
Mf = 2*pi*tf/T;

Ef = fzero(@(E) E - e*sin(E) - Mf, Mf);
thetaf = 2*atan(sqrt((1+e)/(1-e)) * tan(Ef/2));

dtheta = thetaf-theta0;
rf = h^2 / mu /(1+e*cos(thetaf));

f = 1 - mu*rf / h^2 *(1-cos(dtheta));
g = rf * r / h * sin(dtheta);

r_vec_f = f * r_0  + g * v_0;


[ra, dec, ~] = geo_2_sph_deg(r_vec_f)

%% Sanity checking myself
orbit_ode = @(t, y) [y(4:6); -mu * y(1:3) / norm(y(1:3))^3];
[~, y] = ode89(orbit_ode, [0, 1800], [r_0; v_0]);
[~, ya] = ode89(orbit_ode, [0, T], [r_0; v_0]);

plot3(y(:, 1), y(:, 2), y(:, 3), "LineWidth", 5)
hold on
plot3(ya(:, 1), ya(:, 2), ya(:, 3), "--")
plot3(0, 0, 0, "-o", "markersize", 20)
grid
axis equal

r_vec_f = y(end, 1:3)';