%% Setup
A = [8; 9; 12];
B = [9; 6; 1];
C = [3; 5; 10];

%% Get u_n
u_n = cross(A,B) / norm(cross(A,B));

%% Scalar projection is simple, using Pythagorean theorem
mag_Cn = dot(C, u_n);
mag_C = norm(C);
% (Otherwise, we would need to do C_AB = C - C_n

mag_CAB = sqrt(mag_C^2 - mag_Cn^2);

fprintf("C_AB = %f\n", mag_CAB)


