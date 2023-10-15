r_p = 10000e3;
r_a = 100000e3;
mu = 3.968e14;

a = (r_p + r_a) / 2;
e = (r_a - r_p) / (r_a + r_p);
h = sqrt(mu * (1+e) * r_p);

T = 2*pi * sqrt(a^3 / mu);

% Calculate specific energy at periapsis
v_p = h / r_p;
energy = v_p^2 / 2 - mu/r_p;

% radius
r_10000 = 10000e3 + 6378e3;
theta = rad2deg(acos((h^2/mu/r_10000 - 1) / e));
v_n = mu / r_10000 * (1 + e*cos(theta));
v_r = mu / r_10000 * e*sin(theta);

% speeds at ap and pe
v_a = h / r_a;


% Answers
fprintf("a) %g\nb) %g\nc) %g\nd) %g km^2/s^2\ne) %g\nf) %g %g\ng) %g %g\n",...
    e, a, T/3600, energy / 1e6, theta, v_r, v_n, v_p, v_a)