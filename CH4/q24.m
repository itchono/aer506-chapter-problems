mu = 3.986e14;
r_vec_0 = 1e3 * [7000; 0; 0];
v_vec_0 = 1e3 * [7; 7; 0];

h_vec = cross(r_vec_0, v_vec_0);
r_0 = norm(r_vec_0);
v_0 = norm(v_vec_0);
h = norm(h_vec);

energy = v_0^2 / 2 - mu/r_0;  % negative, elliptical orbit

a = -mu/(2*energy);
e = sqrt(1 - h^2 / mu / a);

% initial TA
theta_0 = acosd((h^2 / mu / r_0 - 1)/e)
theta_1 = theta_0 + 90;

r_1 = h^2 / mu * 1/(1 + e * cosd(theta_1));
r_vec_1 = [0; r_1; 0]