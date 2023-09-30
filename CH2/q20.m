% this method does it differently from the answer; I translate the inertia
% matrix to be about point p first, and then find angular momentum about p
% directly (instead of finding angular momentum about C, then shifting
% that)

% Frames
% {B} plane body, spins wrt inertial; coords {xyz} fixed to body
% {P} propeller; coordinate system is coincident with {B} when theta = 0

% Points
% C - CoM of propeller

syms theta omega Omega d m l real

% calculate inertia matrix of propeller about C, expressed in frame P
Ixx = 1/12 * m * l^2;
Iyy = 0;
Izz = Ixx;

P_C_I = diag([Ixx; Iyy; Izz]);

% rotate inertia matrix to frame B
B_R_P = [1, 0, 0;
        0, cos(theta), -sin(theta);
        0, sin(theta), cos(theta)];

B_C_I = simplify(B_R_P * P_C_I * B_R_P', "Steps", 10);

% translate inertia matrix towards point p (moving by distance [-d; 0; 0])
B_rho_pc = [-d; 0; 0];
B_p_I = B_C_I - m * skew(B_rho_pc) * skew(B_rho_pc);

% the total angular velocity in frame B is known
B_omega_IB = [omega; 0; Omega];

% angular momentum about point p
B_p_h = B_p_I * B_omega_IB




