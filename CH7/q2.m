%% Givens
Lambda = 238;
phi = 38;

Theta = 215.1;
A = 214.3;
a = 43;

%% Convert observations to ENZ {H} first
H_rho = [cosd(a) * sind(A); cosd(a) * cosd(A); sind(a)];

%% Rotate to TEN {E} frame
E_R_H = Rz_deg(Theta + 90) * Rx_deg(90-phi);  % this is a tricky matrix but nice
E_rho = E_R_H * H_rho;
[ra, dec, ~] = geo_2_sph_deg(E_rho)


