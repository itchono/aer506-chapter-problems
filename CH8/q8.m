%% Constants
RE = 6378e3;
mu = 3.986e14;

%% Params for Hohmann Transfer
r1 = 500e3 + RE;
r2 = 1000e3 + RE;

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

fprintf("DV: %.3f m/s\n", dv)