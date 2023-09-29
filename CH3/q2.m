syms x y z real

m = 1000;
V = 3 * 2 * 1;
rho = m/V;

%% a)
Ixx = rho * int(int(int((y^2 + z^2), x, 0, 3), y, 0, 2), z, 0, 1);
Iyy = rho * int(int(int((x^2 + z^2), x, 0, 3), y, 0, 2), z, 0, 1);
Izz = rho * int(int(int((x^2 + y^2), x, 0, 3), y, 0, 2), z, 0, 1);

Ixy = rho * int(int(int(-(x*y), x, 0, 3), y, 0, 2), z, 0, 1);
Ixz = rho * int(int(int(-(x*z), x, 0, 3), y, 0, 2), z, 0, 1);
Iyz = rho * int(int(int(-(z*y), x, 0, 3), y, 0, 2), z, 0, 1);


I = [Ixx Ixy Ixz; Ixy Iyy Iyz; Ixz Iyz Izz]

%% b)
[V, E] = eig(double(I))

%% c)
dir = sym([3; 2; 1]);
dot(dir/norm(dir), I * dir/norm(dir))

% Project I * direction onto direction


