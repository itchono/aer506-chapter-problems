% Determine original orbit
mu = 3.986e14;
rsep = 7000e3;
vpS = 1.3 * sqrt(2*mu/rsep);

% Determine B orbit
vaB = 7.1e3;
raB = rsep;

eB = fzero(@(e) mu*(1-e)/sqrt(mu*raB*(1-e)) - vaB, 0.1);
hB = sqrt(mu*raB*(1-eB));
aB = hB^2 / mu / (1-eB^2);

% Determine impact time
thetaB_impact = acos((hB^2 / (mu * 6378e3) - 1)/eB);
E_impact = 2 * atan(sqrt((1-eB)/(1+eB)) * tan(thetaB_impact/2));
M_impact = E_impact - eB * sin(E_impact);
M_ap = pi;

% NOTE: REFLECTED IMAGE OF ORBIT!
% i.e. PE is on the left side, so we need to reflect the position vector
rB_impact = [-cos(thetaB_impact); sin(thetaB_impact)] * 6378e3;

dM = M_ap - M_impact;
T = 2 * pi * sqrt(aB^3 / mu);
dt = dM / (2*pi) * T;


% Determine effect on hyperbolic trajectory
rpS = rsep;
hS = vpS * rpS;
eS = hS * vpS / mu - 1;

Mh_impact = mu^2 / hS^3 * (eS^2 - 1)^(3/2) * dt;
Eh_impact = fzero(@(E) eS * sinh(E) - E - Mh_impact, Mh_impact);
thetaS_impact = 2 * atan(sqrt((eS+1)/(eS-1)) * tanh(Eh_impact/2));

rS_val_impact = hS^2 / mu * 1 / (1 + eS * cos(thetaS_impact));
rS_impact = [cos(thetaS_impact); sin(thetaS_impact)] * rS_val_impact;

dr = norm(rS_impact - rB_impact);

fprintf("Distance: %.2f km\n", dr/1e3)



