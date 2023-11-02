mu = 3.986e14;
rp = 7000e3;
ra = 10000e3;

e = (ra-rp)/(ra+rp);
a = (ra+rp)/2;
h = sqrt(mu * a * (1-e^2));

T = 2*pi * sqrt(a^3/mu);

M_1 = 3600 *0.5 / T * 2*pi;
M_2 = 3600 * 1.5 / T * 2*pi;

E_1 = fzero(@(E) E - e*sin(E) - M_1, M_1);
E_2 = fzero(@(E) E - e*sin(E) - M_2, M_2);

theta_1 = 2*atan(sqrt((1+e)/(1-e)) * tan(E_1/2));
theta_2 = 2*pi + 2*atan(sqrt((1+e)/(1-e)) * tan(E_2/2)); % make it positive

d_theta = rad2deg(theta_2 - theta_1)

area = h * 3600 / 2 % dA/dt = h/2