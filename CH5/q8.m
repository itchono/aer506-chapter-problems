mu = 3.986e14;

rp = 7500e3;
ra = 16000e3;

a = (rp + ra) / 2;
e = (ra-rp) / (ra + rp);
T = 2 * pi * sqrt(a^3 / mu);

%% Solve for initial t
theta_initial = deg2rad(80);

E_initial = 2 * atan(sqrt((1-e)/(1+e)) * tan(theta_initial/2));
M_initial = E_initial - e * sin(E_initial);

t_initial = T * M_initial / (2*pi);

%% Solve for final theta
t_final = t_initial + 40 * 60;

M_final = 2 * pi * t_final / T;
E_final = fzero(@(E) E - e*sin(E) - M_final, M_final);

theta_final = 2 * atan(sqrt((1+e)/(1-e)) * tan(E_final/2));

disp(rad2deg(theta_final));