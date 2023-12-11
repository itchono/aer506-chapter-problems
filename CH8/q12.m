%% Givens
rp1 = 7000e3;
e1 = 0.3;

rp2 = 32000e3;
e2 = 0.5;

%% Some useful params
ra1 = (1+e1) / (1-e1) * rp1;
ra2 = (1+e2) / (1-e2) * rp2;

vp1 = sqrt(mu) * sqrt(2/rp1 - 2/(rp1 + ra1));
va1 = sqrt(mu) * sqrt(2/ra1 - 2/(rp1 + ra1));

vp2 = sqrt(mu) * sqrt(2/rp2 - 2/(rp2 + ra2));
va2 = sqrt(mu) * sqrt(2/ra2 - 2/(rp2 + ra2));

%% Transfer 1
vpt1 = sqrt(mu) * sqrt(2/rp1 - 2/(rp1+ra2));
vat1 = sqrt(mu) * sqrt(2/ra2 - 2/(rp1+ra2));

dvt1 = (vpt1 - vp1) + (va2 - vat1);
Tt1 = 1/2 * 2*pi*sqrt((rp1/2 + ra2/2)^3/mu);
fprintf("a) DV: %.3f m/s, T: %.1f h\n", dvt1, Tt1/3600)


%% Transfer 2
vpt2 = sqrt(mu) * sqrt(2/ra1 - 2/(ra1+rp2));
vat2 = sqrt(mu) * sqrt(2/rp2 - 2/(ra1+rp2));

dvt2 = (vpt2 - va1) + (vp2 - vat2);
Tt2 = 1/2 * 2*pi*sqrt((ra1/2 + rp2/2)^3/mu);
fprintf("b) DV: %.3f m/s, T: %.2f h\n", dvt2, Tt2/3600)


