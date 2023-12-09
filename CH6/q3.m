mu = 3.986e14;

r = [6500; -7500; -2500] * 1e3;
v = [4; 3; -3] * 1e3;

keplerian = cartesian2keplerian([r; v], mu);

print_ke(keplerian)
h = sqrt(keplerian(1) * (1-keplerian(2)^2) * mu)


cartesian = keplerian2cartesian(keplerian, mu)