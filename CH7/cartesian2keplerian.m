function keplerian = cartesian2keplerian(cartesian, mu)
% Output in degrees

% Basic elements
r_vec = cartesian(1:3); r = norm(r_vec);
v_vec = cartesian(4:6); v = norm(v_vec);
h_vec = cross(r_vec, v_vec); h = norm(h_vec);
energy = v.^2 / 2 - mu / r;
a = -mu / (2*energy);

% Eccentricity
e_vec = cross(v_vec, h_vec) ./ mu - r_vec ./ r;
e = norm(e_vec);

% Inclination: between [0, 180], but atand outputs between [-90, 90]
i = atand(sqrt(h_vec(1).^2 + h_vec(2).^2) / h_vec(3));
if i < 0
    i = i + 180;
end

% Make orthogonal coordinate system
N = cross([0; 0; 1], h_vec); N = N / norm(N);  % Ascending Node
P = cross(h_vec, N); P = P / norm(P);          % 90 deg ahead of AN

% Calculate RAAN directly using coordinate system
Omega = mod(atan2d(N(2), N(1)), 360);          % i.e. wrt ECI XY plane

% Calculate AOP and TA using projection onto N ("x") and P ("y")
omega = mod(atan2d(dot(e_vec, P), dot(e_vec, N)), 360);
theta = mod(atan2d(dot(r_vec, P), dot(r_vec, N)) - omega, 360);

keplerian = [a; e; i; Omega; omega; theta];

end