function cartesian = keplerian2cartesian(keplerian, mu)
% Input in degrees
% Input using sma instead of h, works for hyperbolic too

a = keplerian(1);
e = keplerian(2);
inc = keplerian(3);
Omega = keplerian(4);
omega = keplerian(5);
theta = keplerian(6);

h = sqrt(mu * a * (1-e^2));

% Compute perifocal
P_r = h^2 / mu / (1+e*cosd(theta)) * [cosd(theta); sind(theta); 0];
P_v = mu /h * [-sind(theta); e + cosd(theta); 0];

% Compute rotation matrix
G_R_P = Rz_deg(Omega) * Rx_deg(inc) * Rz_deg(omega);

cartesian = [G_R_P * P_r; G_R_P * P_v];
end

