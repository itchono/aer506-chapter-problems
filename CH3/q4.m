% Frames
% {B} body frame of airplane; banked wrt inertial
% {I} inertial frame

% a)
% highschool physics
% L cos(theta) = mg
% L sin(theta) = mv^2/R
% theta = arctan(v^2/(g*R))

syms v R A B C theta real

% b)
% angular velocity is v/R about z axis of inertial frame
I_omega_IB = [0; 0; v/R];

% rotation from inertial axes
I_R_B = [cos(theta), 0, sin(theta);
          0, 1, 0;
          -sin(theta), 0, cos(theta)];
B_R_I = I_R_B';

B_omega_IB = B_R_I * I_omega_IB;

B_dI_omega_IB = [0; 0; 0]; % assume steady level turn

B_G_I = diag([A; B; C]);

B_B_t_ext = simplify(B_G_I * B_dI_omega_IB + cross(B_omega_IB, B_G_I * B_omega_IB), "Steps", 10);

disp(B_B_t_ext(2))