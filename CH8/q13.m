mu = 3.986e14;
RE = 6378e3;

%% Givens
rp1 = 296e3 + RE;
ra1 = 302e3 + RE;

rp2 = 259e3 + RE;
ra2 = 291e3 + RE;

rc3 = 259e3 + RE;

rp4 = 194e3 + RE;
ra4 = 255e3 + RE;

%% Some useful params
vp1 = sqrt(mu) * sqrt(2/rp1 - 2/(rp1 + ra1));
va1 = sqrt(mu) * sqrt(2/ra1 - 2/(rp1 + ra1));

vp2 = sqrt(mu) * sqrt(2/rp2 - 2/(rp2 + ra2));
va2 = sqrt(mu) * sqrt(2/ra2 - 2/(rp2 + ra2));

vc3 = sqrt(mu/rc3);

vp4 = sqrt(mu) * sqrt(2/rp4 - 2/(rp4 + ra4));
va4 = sqrt(mu) * sqrt(2/ra4 - 2/(rp4 + ra4));

%% Transfers
% 1->2 AP -> PE
vat1 = sqrt(mu) * sqrt(2/ra1 - 2/(ra1+rp2));
vpt1 = sqrt(mu) * sqrt(2/rp2 - 2/(ra1+rp2));

dvt1 = abs(vat1 - va1) + abs(vp2 - vpt1);

% 2->3 Burn at PE
dvt2 = abs(vc3 - vp2);

% 3->4 AP -> PE
vat3 = sqrt(mu) * sqrt(2/rc3 - 2/(rc3+rp4));
vpt3 = sqrt(mu) * sqrt(2/rp4 - 2/(rc3+rp4));

dvt3 = abs(vat3 - vc3) + abs(vp4 - vpt3);

dv = dvt1 + dvt2 + dvt3  % NICE

