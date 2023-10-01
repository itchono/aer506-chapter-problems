% Gotta calculate the principal inertia matrix of the cylinder

m_cyl = 500;
r_cyl = 0.5;
h_cyl = 2;

% https://scienceworld.wolfram.com/physics/MomentofInertiaCylinder.html
P_C_I = m_cyl * diag([1/12 * h_cyl^2 + 1/4 * r_cyl^2; 1/12 * h_cyl^2 + 1/4 * r_cyl^2; 1/2 * r_cyl^2]);

% question is referring to NUTATION ANGLE theta (angle of body)
% c.f. max. angle of omega --> abs(gamma) + abs(theta)
gamma = 5;
theta = rad2deg(atan2(P_C_I(1, 1) * tand(gamma), P_C_I(3, 3)))