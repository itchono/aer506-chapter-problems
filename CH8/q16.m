mu = 3.986e14;
RE = 6378e3;

rc = RE + 350e3;
vc = sqrt(mu/rc);
circumference = 2 * pi * rc;

Tc = 2*pi*sqrt(rc^3/mu);
dM = 600e3 / circumference * 2*pi;
dT = dM / (2*pi) * Tc;

Tb = Tc + dT / 1;
Ta = Tc - dT / 1;

%% Hohmann transfer details
aa = ((Ta / (2*pi))^2 * mu) ^ (1/3);
rpa = aa*2 - rc;
vat1 = sqrt(mu) * sqrt(2/rc - 2/(rpa + rc));
dva = 2 * (vc - vat1);

ab = ((Tb / (2*pi))^2 * mu) ^ (1/3);
rab = ab*2 - rc;
vpt2 = sqrt(mu) * sqrt(2/rc - 2/(rab + rc));
dvb = 2 * (vpt2 - vc);


fprintf("a) DV: %.2f m/s, T: %.1f min\n", dva, Ta/60);
fprintf("b) DV: %.2f m/s, T: %.1f min\n", dvb, Tb/60);

