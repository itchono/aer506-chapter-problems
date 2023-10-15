% assume closest approach is directly over the pole
r_p = 200e3 + 6378e3;
mu = 3.986e14;
a = ((100*60 / (2*pi))^2 * mu)^(1/3);

r_a = 2*a - r_p;

e = (r_a - r_p) / (2*a)