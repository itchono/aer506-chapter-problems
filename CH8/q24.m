mu = 3.986e14;

ra = 12756e3;
va = 6.5992e3;
gamma_a = 20;

%% a)
% Good ol orbit determination
vn_o1 = va * cosd(gamma_a);
vr_o1 = va * sind(gamma_a);
h_o1 = ra * vn_o1;
nrg_o1 = va^2 / 2 - mu/ra;
a_o1 = -mu / (2*nrg_o1);

T_o1 = 2 * pi * sqrt(a_o1^3 / mu);

% estimate theta using fun technology
theta_a = atan2d(vr_o1, vn_o1 - mu / h_o1);

% get eccentricity
e_o1 = h_o1 / mu * vr_o1 / sind(theta_a);

% time of flight stuff
theta_b = 150;

E_a = 2 * atan(sqrt((1-e_o1)/(1+e_o1)) * tand(theta_a/2));
E_b = 2 * atan(sqrt((1-e_o1)/(1+e_o1)) * tand(theta_b/2));

M_a = E_a - e_o1 * sin(E_a);
M_b = E_b - e_o1 * sin(E_b);

ToF_ab = (M_b - M_a) / (2*pi) * T_o1;

fprintf("Time of flight: %.3f h\n", ToF_ab/3600);

%% Part b)
% We can basically work out a new orbit at this point with our vn and vr
% quantities, measure theta at this point, and compare it with 150 deg
% i.e. vr and vn in orbit A at 150 deg: ....
% add 758.2 m/s to vn, and fit orbit B with vr and vn*
% find what theta is at this point in orbit B
% the difference in "measured theta" implies rotation of apse line
vr_bo1 = mu / h_o1 * e_o1 * sind(theta_b);
vn_bo1 = mu / h_o1 * (1 + e_o1 * cosd(theta_b));

% maneuver
vr_bo2 = vr_bo1;
vn_bo2 = vn_bo1 + 758.2;
v_bo2 = sqrt(vr_bo2^2 + vn_bo2^2);

% find radius at B (using old orbit, since we're at the same position)
rb = h_o1^2 / mu * 1/(1 + e_o1 * cosd(theta_b));

% basically, re-fit orbit
h_o2 = rb * vn_bo2;
theta_bo2 = atan2d(vr_bo2, vn_bo2 - mu / h_o2);

% theta "measured by orbit 1" vs "measured by orbit 2"
eta = theta_b - theta_bo2;
fprintf("Apse line rotation: %.2f deg CCW\n", eta);

