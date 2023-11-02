e = 0.5;

% 2/(1+e) = 1/(1+e*cos(theta))
theta = acos(((1+e)/2 - 1) / e);
E = 2*atan(sqrt((1-e)/(1+e)) * tan(theta/2));
M = E - e*sin(E);

frac = M / (2*pi)