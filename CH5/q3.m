e = 0.3;
theta = deg2rad(90);

E = 2*atan(sqrt((1-e)/(1+e)) * tan(theta/2));

M = E - e*sin(E);

frac = M / (2*pi)