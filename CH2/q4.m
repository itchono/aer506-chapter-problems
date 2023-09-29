%% Setup
syms t

x(t) = sin(3*t);
y(t) = cos(t);
z(t) = sin(2*t);

r(t) = [x; y; z];

%% a)
v(t) = diff(r, t);
velocity_5 = v(5);

fprintf("a) Velocity at t = 5s:\n")
disp(double(velocity_5))

%% b)
speed_5 = norm(velocity_5);
fprintf("b) Speed at t = 5s:\n")
disp(double(speed_5))

%% c)
u_t = velocity_5 / norm(velocity_5);
fprintf("c) Tangent vector:\n")
disp(double(u_t))

%% d)
% scalar projections and cosine
d_x = dot(u_t, sym([1; 0; 0]));
theta_x = rad2deg(acos(d_x));
d_y = dot(u_t, sym([0; 1; 0]));
theta_y = rad2deg(acos(d_y));
d_z = dot(u_t, sym([0; 0; 1]));
theta_z = rad2deg(acos(d_z));

fprintf("d) theta_x: %f, theta_y: %f, theta_z: %f (degrees)\n", theta_x, theta_y, theta_z);

%% e)
a(t) = diff(v, t);
accel_5 = a(5);

fprintf("e) Acceleration at t = 5s:\n")
disp(double(accel_5))

%% f)
% binormal is r' x r''
u_b = cross(velocity_5, accel_5) / norm(cross(velocity_5, accel_5));

fprintf("f) Binormal vector:\n")
disp(double(u_b))

%% g)
% B = T x N, so N = B x T
u_n = cross(u_b, u_t);

fprintf("g) Normal vector:\n")
disp(double(u_n));

%% h)
% scalar projections and cosine
a_norm = accel_5 / norm(accel_5);
d_x = dot(a_norm, sym([1; 0; 0]));
theta_x = rad2deg(acos(d_x));
d_y = dot(a_norm, sym([0; 1; 0]));
theta_y = rad2deg(acos(d_y));
d_z = dot(a_norm, sym([0; 0; 1]));
theta_z = rad2deg(acos(d_z));

fprintf("h) theta_x: %f, theta_y: %f, theta_z: %f (degrees)\n", theta_x, theta_y, theta_z);

%% i)
a_t = dot(accel_5, u_t);
fprintf("i) a_t = %f\n", double(a_t))


%% j)
a_n = dot(accel_5, u_n);
fprintf("j) a_n = %f\n", double(a_n))