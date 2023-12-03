%% Find the actual orbit to get apoapsis velocity
mu = 3.986e14;
ra = 500e3 + 6378e3;
rp = 200e3 + 6378e3;

e = (ra - rp) / (ra + rp);
h = sqrt(mu * ra * (1-e));
va = mu / h * (1-e);

%% Find delta to current orbit
% We're gonna be in a new orbit which is 500 x 200, where 500 was our OLD
% PE, no need to determine old orbit
v_sc = 8000;

dv = va - v_sc;
fprintf("Delta-v: %.2f m/s\n", dv);