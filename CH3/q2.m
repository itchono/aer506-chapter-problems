syms x y z real

m = 1000;
V = 3 * 2 * 1;
rho = m/V;

%% a)
% we integrate to find the inertia tensor, see slides for integral formulas
% P is at the origin, and this rectangular prism sticks out from a "corner"
Ixx = rho * int(int(int((y^2 + z^2), x, 0, 3), y, 0, 2), z, 0, 1);
Iyy = rho * int(int(int((x^2 + z^2), x, 0, 3), y, 0, 2), z, 0, 1);
Izz = rho * int(int(int((x^2 + y^2), x, 0, 3), y, 0, 2), z, 0, 1);

Ixy = rho * int(int(int(-(x*y), x, 0, 3), y, 0, 2), z, 0, 1);
Ixz = rho * int(int(int(-(x*z), x, 0, 3), y, 0, 2), z, 0, 1);
Iyz = rho * int(int(int(-(z*y), x, 0, 3), y, 0, 2), z, 0, 1);

I = [Ixx Ixy Ixz; Ixy Iyy Iyz; Ixz Iyz Izz]

%% b)
% V is the rotation matrix, E holds the diagonalized matrix
[V, E] = eig(double(I))

%% c)
dir = sym([3; 2; 1]);
unit_dir = dir/norm(dir);

% Project I * direction onto direction
% it sorta came intuitively, I don't know why this is rigorously true
dot(unit_dir, I * unit_dir)




