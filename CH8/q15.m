mu = 3.986e14;
RE = 6378e3;

r1 = RE + 300e3;
vc1 = sqrt(mu / r1);
r2 = RE + 3000e3;
vc2 = sqrt(mu / r2);

% First leg
et1 = 0.3;
rpt1 = r1;
rat1 = (1+et1)/(1-et1) * rpt1;
Tt1 = 1/2 * 2 * pi * sqrt((rpt1/2 + rat1/2)^3 / mu);

vpt1 = sqrt(mu) * sqrt(2/rpt1 - 2/(rpt1 + rat1));
vat1 = sqrt(mu) * sqrt(2/rat1 - 2/(rpt1 + rat1));

dvt1 = vpt1 - vc1;

% Second leg
rat2 = rat1;
rpt2 = r2;
Tt2 = 1/2 * 2 * pi * sqrt((rpt2/2 + rat2/2)^3 / mu);

vpt2 = sqrt(mu) * sqrt(2/rpt2 - 2/(rpt2 + rat2));
vat2 = sqrt(mu) * sqrt(2/rat2 - 2/(rpt2 + rat2));

dvt2 = vat2 - vat1;
dvt3 = vpt2 - vc2;
dv = dvt1 + dvt2 + dvt3;

fprintf("DV: %.3f m/s, T: %.2f h\n", dv, (Tt1 + Tt2)/3600)



