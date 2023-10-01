syms m l omega_0 real positive

% Inertia matrix
P_C_I = 1/12 * m * diag([5*l^2; 10*l^2; 13*l^2])
P_omega_IP = omega_0 * sym([1.5; 0.8; 0.6]);


T_r = simplify(1/2 * P_omega_IP.' * P_C_I * P_omega_IP)
P_C_h = P_C_I * P_omega_IP;

omega_zT = simplify(sqrt(2 * T_r / (m/12 * 13*l^2)))
omega_zh = simplify(norm(P_C_h) / (m/12 * 13*l^2))

disp(double(subs(omega_zT, omega_0, 1)))  % this many times omega_0
disp(double(subs(omega_zh, omega_0, 1)))  % this many times omega_0
