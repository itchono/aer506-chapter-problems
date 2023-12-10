%% Givens
phi = -20;
h = 500;
f = 0.0033528;
RE = 6378e3;

Theta_i = [60, 60.5014, 61.0027];
A_i = [165.931, 145.967, 2.40962];
a_i = [9.53549, 45.7711, 21.8825];
range_i = [1214.89, 421.441, 732.079] * 1e3;

r_i = zeros(3);

for i = 1:3
Theta = Theta_i(i);
A = A_i(i);
a = a_i(i);
rangee = range_i(i);

%% Convert observations to ENZ {H} first
H_rho = rangee * [cosd(a) * sind(A); cosd(a) * cosd(A); sind(a)];

%% Rotate to TEN {E} frame
E_R_H = Rz_deg(Theta + 90) * Rx_deg(90-phi);  % this is a tricky matrix but nice
E_rho = E_R_H * H_rho;
[ra, dec, ~] = geo_2_sph_deg(E_rho);

%% Compensate for position on Earth
Rc = RE / sqrt(1-(2*f - f^2 * sind(phi)^2)) + h;
Rs = RE * (1-f)^2 / sqrt(1-(2*f - f^2 * sind(phi)^2)) + h;
R = [Rc * cosd(phi) * cosd(Theta);
     Rc * cosd(phi) * sind(Theta);
     Rs * sind(phi)];
E_R = E_rho + R;
r_i(:, i) = E_R;
end

[~, v2, ~] = gibbs(r_i(:, 1), r_i(:, 2), r_i(:, 3));
fprintf("r2: %.2f, v2: %.2f\n", norm(r_i(:, 2))/1e3, norm(v2))

% a little bit off




