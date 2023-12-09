mu = 3.986e14;
r_0 = [-5000; -8000; -2100] * 1e3;
v_0 = [-4; 3.5; -3] * 1e3;

%% Fit initial orbit
ke_0 = cartesian2keplerian([r_0; v_0], mu);

a = ke_0(1);
e = ke_0(2);
i = ke_0(3);
Omega = ke_0(4);
omega = ke_0(5);
theta_0 = ke_0(6);

%% CH5: propagate forwards in time
E_0 = 2 * atan(sqrt((1-e)/(1+e)) * tand(theta_0/2));  % radians
T = 2*pi * sqrt(a^3 / mu);
M_0 = E_0 - e * sin(E_0); % radians
dM = 50*60/T * 2*pi;

M_f = M_0 + dM;
E_f = fzero(@(E) E - e*sin(E) - M_f, M_f);
theta_f = 2*atand(sqrt((1+e)/(1-e)) * tan(E_f/2));

%% Reverse Solve
cartesian_f = keplerian2cartesian([ke_0(1:5); theta_f], mu)


%% Brute Force
orbit_ode = @(t, y) [y(4:6); -mu * y(1:3) / norm(y(1:3))^3];
[~, y] = ode89(orbit_ode, [0, 50*60], [r_0; v_0]);