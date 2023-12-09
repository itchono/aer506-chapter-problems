mu = 3.986e14;
r_p = 6378e3 + 200e3;
e = 1.2;
a = r_p / (1-e);

ke = [a; e; 50; 75; 80; 0];
G_r0v0 = keplerian2cartesian(ke, mu)

G_R_P = Rz_deg(75) * Rx_deg(50) * Rz_deg(80);
P_R_G = G_R_P';

P_r0 = P_R_G * G_r0v0(1:3)
P_v0 = P_R_G * G_r0v0(4:6)