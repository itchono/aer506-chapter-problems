%% Givens (degrees where possible)
Theta = 40;
phi = 35;
rango = 988e3;
A = 36;
a = 36.6;
rango_dot = 4.86e3;
A_dot = 0.590;
a_dot = -0.263;
h = 0;

%% Use Curtis code (bless)
[G_r, G_v] = rv_from_observe(rango/1e3, rango_dot/1e3, A, A_dot, a, a_dot, Theta, phi, h)
