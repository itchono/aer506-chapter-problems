% Determine original orbit
mu = 3.986e14;
rp = 250e3 + 6378e3;
v = sqrt(mu/rp);
dv = 200;
vp = v + dv;

e = fzero(@(e) mu*(1+e) / sqrt(mu * rp * (1+e)) - vp, 0.1); 
ra = (1+e)/(1-e) * rp;

fprintf("New Apogee: %.2f km\n", (ra - 6378e3)/1000)
