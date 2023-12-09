mu = 3.986e14;
r_p = 6378e3 + 300e3;
e = 1.4;
a = r_p / (1-e);

ke = [a; e; 35; 130; 115; 0];
G_r0v0 = keplerian2cartesian(ke, mu)

G_R_P = Rz_deg(130) * Rx_deg(35) * Rz_deg(115);
P_R_G = G_R_P';

P_r0 = P_R_G * G_r0v0(1:3)
P_v0 = P_R_G * G_r0v0(4:6)