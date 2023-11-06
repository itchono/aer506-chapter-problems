mu = 3.986e14;

rp = 6600e3;
h = sqrt(2*mu*rp);

%% a)
theta_1 = -pi/2;
theta_2 = pi/2;

M_1 = 1/2 * tan(theta_1/2) + 1/6 * tan(theta_1/2)^3;
M_2 = 1/2 * tan(theta_2/2) + 1/6 * tan(theta_2/2)^3;
d_time = h^3 / mu^2 * (M_2 - M_1);

%% b)
M_final = mu^2 / h^3 * 36*3600;
theta_final = fzero(@(theta) 1/2 * tan(theta/2) + 1/6 * tan(theta/2)^3 - M_final, pi/2);
% yes there's an exact formula but this is easier

r_final = h^2 / mu  / (1+cos(theta_final));


disp(d_time / 3600)
disp(r_final)