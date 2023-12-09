mu = 3.986e14;
r_p = 6378e3 + 300e3;
e = 1.5;
a = r_p / (1-e);

h = sqrt(mu * a * (1-e^2));

M = mu^2 / h^3 * (e^2-1)^1.5 * 7200;
E = fzero(@(E) e*sinh(E) - E - M, M);
theta = 2 * atand(sqrt((e+1)/(e-1))*tanh(E/2));

ke = [a; e; 35; 130; 115; theta];

G_rv = keplerian2cartesian(ke, mu)

G_R_P = Rz_deg(130) * Rx_deg(35) * Rz_deg(115);
P_R_G = G_R_P';

P_r = P_R_G * G_rv(1:3)
P_v = P_R_G * G_rv(4:6)