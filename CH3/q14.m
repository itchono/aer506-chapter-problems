P_C_I = diag([0.36; 0.36; 0.72]);
r_ring = sqrt(0.72 / 8);

theta = 15;
omega_s = 30;  % MAKE SURE TO READ PROPERLY; THIS IS THE SPIN RATE, NOT THE MAGNITUDE OF TOTAL ANGULAR VELOCITY

% calculate rotation components from nutation angle and spin rate
omega_p = P_C_I(3,3) / (P_C_I(1,1) - P_C_I(3,3)) * omega_s / cosd(theta);
omega_xy = omega_p * sind(theta);
omega_0 = omega_s + omega_xy/tand(theta);

omega_vec = [omega_xy; 0; omega_s];

T_r = 1/2 * omega_vec' * P_C_I * omega_vec
