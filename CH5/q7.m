mu = 3.986e14;
T = 14 * 3600;
rp = 10000e3;
a = ((T/(2*pi))^2 * mu)^(1/3);
e = 1-rp/a;
h = sqrt(mu * a * (1-e^2));

M_10h = 10*3600 / T * 2*pi;
E_10h = fzero(@(E) E - e*sin(E) - M_10h, M_10h);
theta_10h = 2*atan(sqrt((1+e)/(1-e)) * tan(E_10h/2));

r_10h = h^2/ mu * 1/(1+e*cos(theta_10h))
vr = mu /h * e*sin(theta_10h)
v = sqrt(vr^2 + (mu/h * (1+e*cos(theta_10h)))^2)