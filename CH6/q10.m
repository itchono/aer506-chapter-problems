inc = 90;
Omega = 60;
omega = 0;

P_v = [-3.208; -0.8288; 0];

G_R_P = Rz_deg(Omega) * Rx_deg(inc) * Rz_deg(omega);

G_v = G_R_P * P_v