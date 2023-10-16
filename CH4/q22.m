r = 10000e3;
v = 10e3;
gamma = 30;  % 30 degrees more than 90

mu = 3.986e14;


energy = v^2 / 2 - mu / r;  % positive, so it's hyperbolic
a = mu / (2*energy);  % positive, so it's an elliptical orbit

v_n = v * cosd(gamma);
h = r * v_n;
e = sqrt(h^2 / mu /a + 1);
theta = acosd((h^2 / (mu * r) - 1) / e)
