%% Constants
RE = 6378e3;
mu = 3.986e14;

%% Params for Hohmann Transfer
r1 = 300e3 + RE;
r2 = 3000e3 + RE;

%% Calculate Speeds
% initial and final orbit
vc1 = sqrt(mu/r1);
vc2 = sqrt(mu/r2);

% transfer orbits
vpt = sqrt(mu) * sqrt(2/r1 - 2/(r1+r2));
vat = sqrt(mu) * sqrt(2/r2 - 2/(r1+r2));

%% Calculate Delta Vs
dv1 = vpt - vc1;
dv2 = vc2 - vat;
dv = dv1 + dv2;

%% Calculate Transfer period
a_t = (r1 + r2)/2;
T = 2*pi * sqrt(a_t^3 / mu) / 2;  % 1/2 period for hohmann transfer!!!

fprintf("DV: %.3f m/s, T: %.0f s\n", dv, T)