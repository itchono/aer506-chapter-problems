r_p = 500e3 + 6378e3;
v_p = 10e3;
mu = 3.986e14;

energy = v_p^2/2 - mu/r_p;
h = r_p * v_p;
e = v_p * h / mu - 1;

r_120 = h^2/mu * 1/(1+e*cosd(120))
z_120 = r_120 - 6378e3
gamma = atand(e*sind(120) / (1 + e*cosd(120)))
