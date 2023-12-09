mu = 3.986e14;
J2 = 1.080263e-3;
RE = 6378e3;

r_p = RE + 300e3;
r_a = RE + 600e3;
a = (r_p + r_a) / 2;
e = (r_a-r_p) / (r_a + r_p);

target = deg2rad(360 / 365.26 / 86400);

fac = -3/2 * sqrt(mu) * RE^2 / ((1-e^2)^2 * a^3.5) * J2;

i = acosd(target/fac)
