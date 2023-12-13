function v_vec_1 = lambert_elliptical(r_vec_1, r_vec_2, ToF, mu, string)
% more limited elliptical version of lambert's problem

r1 = norm(r_vec_1);
r2 = norm(r_vec_2);
c12 = cross(r_vec_1, r_vec_2);
d_theta = acos(dot(r_vec_1,r_vec_2)/r1/r2);
%...Determine whether the orbit is prograde or retrograde:
if nargin < 4 || (~strcmp(string,'retro')&&(~strcmp(string,'pro')))
string = 'pro';
fprintf('\n ** Prograde trajectory assumed.\n')
end
if strcmp(string,'pro')
if c12(3) <= 0
d_theta = 2*pi - theta;
end
elseif strcmp(string,'retro')
if c12(3) >= 0
d_theta = 2*pi - theta;
end
end

k = (r1 + r2) / (4*sqrt(r1*r2) * cos(d_theta/2)) - 1/2;
d = mu * ToF^2 / (2 * sqrt(r1*r2) * cos(d_theta/2))^3;

eta_curr = 12/22 + 10/22 * sqrt(1+44/9 * d/(k + 5/6));
eta_prev = eta_curr + 0.1;

while abs(eta_curr - eta_prev) > 1e-12

k = (r1 + r2) / (4*sqrt(r1*r2) * cos(d_theta/2)) - 1/2;
d = mu * ToF^2 / (2 * sqrt(r1*r2) * cos(d_theta/2))^3;

H = @(y) (4 * asin(sqrt(y)) - sin(4*asin(sqrt(y)))) / sin(2*asin(sqrt(y)))^3;
F = @(x) 1 - x + d/x^2 * H(d/x^2 - k);

eta_next = eta_curr - F(eta_curr) * (eta_curr - eta_prev) / (F(eta_curr) - F(eta_prev));

eta_prev = eta_curr;
eta_curr = eta_next;
end

h = eta_curr * r1 * r2 * sin(d_theta) / ToF;
v_vec_1 = h/(r1*r2*sin(d_theta)) * (r_vec_2 - (1-mu*r2/h^2 * (1-cos(d_theta))) * r_vec_1);