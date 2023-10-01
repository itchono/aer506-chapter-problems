% Frames
% {I} inertial
% {B} body frame of airplane, rotated by angle alpha about x, and spinning
% at angular velocity [0; 0; omega_z] WRT inertial z

syms alpha omega_z A B C real

% inertia matrix about G in B frame (principal axes)
B_G_I = diag([A; B; C]);

% rotation from B to I
I_R_B = [1, 0, 0;
         0, cos(alpha), -sin(alpha);
         0 sin(alpha), cos(alpha)];

% We're given angular velocity of B wrt I inertial frame
I_omega_IB = [0; 0; omega_z];

B_omega_IB = I_R_B.' * I_omega_IB;

% RoC of angular velocity is zero, so it's all just cross terms

% Apply Euler's equation of rotational motion to get net ext. torque
B_G_t_ext = simplify(cross(B_omega_IB, B_G_I * B_omega_IB), "Steps", 10)