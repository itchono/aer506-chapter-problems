mu = 3.986e14;

gamma = 10;
v = 7.5e3;
r = 8000e3;

v_n = cosd(gamma) * v;
h = v_n * r;

energy = v^2/2 - mu/r;
a = -mu / (2*energy);

e = sqrt(1-h^2 / (mu*a))
theta = rad2deg(fzero(@(theta) atand(e*sin(theta) / (1+e*cos(theta)))- gamma, 0))
