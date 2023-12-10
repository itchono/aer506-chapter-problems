%% Givens (degrees where possible)
Theta = 300;
phi = 60;
rango = 2551e3;
A = 90;
a = 30;
rango_dot = 0;
A_dot = 0.1130;
a_dot = 0.05651;
h = 0;

%% Use Curtis code (bless)
[G_r, G_v] = rv_from_observe(rango/1e3, rango_dot/1e3, A, A_dot, a, a_dot, Theta, phi, h);
ke = cartesian2keplerian([G_r(:); G_v(:)]*1e3, 3.986e14);
print_ke(ke);