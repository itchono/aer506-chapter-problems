%% Givens
phi = 51;

Theta = 117;

% Note: the question uses 27.5156 and 67.556, but the solutions used
% rounded values!
A = 28;
a = 68;

%% Convert observations to ENZ {H} first
H_rho = [cosd(a) * sind(A); cosd(a) * cosd(A); sind(a)];

%% Rotate to TEN {E} frame
E_R_H = Rz_deg(Theta + 90) * Rx_deg(90-phi);  % this is a tricky matrix but nice
E_rho = E_R_H * H_rho;
[ra, dec, ~] = geo_2_sph_deg(E_rho)


