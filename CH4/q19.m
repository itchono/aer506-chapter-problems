mu = 3.986e14;
v_p = 11e3;
r_p = 250e3 + 6378e3;

v_esc = sqrt(2*mu / r_p);

C3 = v_p^2 - v_esc^2;

v_excess = sqrt(C3)

h = v_p * r_p;

e = h^2 / (mu * r_p) - 1

r_100 = h^2 / mu * 1/(1+e*cosd(100))

v_r = mu/h * e * sind(100)
v_n = mu/h * (1 + e * cosd(100))