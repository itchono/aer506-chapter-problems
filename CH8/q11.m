r1 = 6700e3;
mu = 3.986e14;

vc1 = sqrt(mu/r1);
vpt = vc1 + 1500;

% Magic formula from q6
r2 = r1 * vpt^2 / (2*mu - r1 * vpt^2) * r1;

vat = sqrt(mu) * sqrt(2/r2 - 2/(r1+r2));
vc2 = sqrt(mu/r2);

dv2 = vc2 - vat

