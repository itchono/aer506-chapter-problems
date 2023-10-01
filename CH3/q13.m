% Solve for variables inside euler's equation of motion
P_I = diag([385.4; 416.7; 52.08]);  % principal inertia matrix
omega = [0.01; 0.03; 0.02];

% 0 = I w_dot + w cross I w ==> Solve linear system
dI_omega = P_I \ (-cross(omega, P_I * omega))
norm(dI_omega)