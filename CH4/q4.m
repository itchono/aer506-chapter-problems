syms r(t)

r(t) = [t*sin(t); t^2 * cos(t); t^3 * sin(t)^2];

r_mag = norm(r);
r_mag_dot = diff(r_mag);
r_mag_dot_2 = double(r_mag_dot(2))

r_dot_mag = norm(diff(r));
r_dot_mag_2 = double(r_dot_mag(2))
