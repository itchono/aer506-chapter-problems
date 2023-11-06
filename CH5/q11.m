mu = 3.986e14;

rp = 6600e3;
vp_over_vesc = 1.2;

v_esc = sqrt(2 * mu / rp);
vp = v_esc * vp_over_vesc;

h = vp*rp;
energy = vp^2 / 2 - mu / rp;
a = mu / (2*energy);

e = rp / a + 1;

%% a)

theta_1 = -pi/2;
theta_2 = pi/2;

E_1 = 2 * atanh(sqrt((e-1)/(e+1)) * tan(theta_1/2));
E_2 = 2 * atanh(sqrt((e-1)/(e+1)) * tan(theta_2/2));

M_1 = e*sinh(E_1) - E_1;
M_2 = e*sinh(E_2) - E_2;

t_1 = h^3 / mu^2 / (e^2 - 1)^(3/2) * M_1;
t_2 = h^3 / mu^2 / (e^2 - 1)^(3/2) * M_2;

d_time = t_2 - t_1;

%% b)
M_final = mu^2 / h^3 * (e^2 - 1)^(3/2) * 24 * 3600;

E_final = fzero(@(E) e*sinh(E) - E - M_final, 100);
theta_final = 2 * atan(sqrt((e+1)/(e-1))*tanh(E_final/2));

r_final = h^2 / mu /(1+e*cos(theta_final));

disp(d_time / 3600)
disp(r_final)



