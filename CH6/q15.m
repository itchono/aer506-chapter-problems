mu = 3.986e14;
J2 = 1.080263e-3;
RE = 6378e3;

% Slightly broken solutions
r_0 = [-2429.1; 4455.1; 4577.0] * 1e3;
v_0 = [-4.7689; -5.6113; 3.0535] * 1e3;

%% Orbit fitting
ke_0 = [7665.8e3; 0.1; 50; 70; 60; 0];  % solutions did it diff somehow
a = ke_0(1);
e = ke_0(2);
inc = ke_0(3);
Omega_0 = ke_0(4);
omega_0 = ke_0(5);
theta_0 = ke_0(6);

E_0 = 2 * atan(sqrt((1-e)/(1+e)) * tand(theta_0/2));
M_0 = E_0 - e*sin(E_0);
dt = 72 * 3600;

T = 2 * pi * sqrt(a^3 / mu);

dM = sqrt(mu/a^3) * dt;  % nice hax
M_f = mod(M_0 + dM, 2*pi);

E_f = fzero(@(E) E - e*sin(E) - M_f, M_f);
theta_f = 2 * atand(sqrt((1+e)/(1-e)) * tan(E_f / 2));

%% J2
fac = -3/2 * sqrt(mu) * RE^2 / ((1-e^2)^2 * a^3.5) * J2;
dOmega = fac * cosd(inc) * dt;
domega = fac * (5/2 * sind(inc)^2 - 2) * dt;

Omega_f = Omega_0 + rad2deg(dOmega);
omega_f = omega_0 + rad2deg(domega);

rfvf = keplerian2cartesian([a; e; inc; Omega_f; omega_f; theta_f], mu)