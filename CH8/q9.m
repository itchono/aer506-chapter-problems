%% Constants
mu = 1.327e20;

%% Params for Hohmann Transfer
r1 = 1.496e11;
r2 = 2.279e11;

%% Calculate Speeds
% initial and final orbit
vc1 = sqrt(mu/r1);
vc2 = sqrt(mu/r2);

%% Calculate Transfer period
a_t = (r1 + r2)/2;
Tt = 2*pi * sqrt(a_t^3 / mu) / 2;  % 1/2 period for hohmann transfer!!!

fprintf("T: %.3f d\n", Tt/86400)

%% Calculate Phase Angle
T1 = 2*pi*sqrt(r1^3/mu);
T2 = 2*pi*sqrt(r2^3/mu);

M_covered_by_spacecraft = pi;
M_covered_by_Mars = Tt / T2 * 2 * pi;

% mars has to be ahead by a certain amount in true anomaly = mean anomaly
alpha = rad2deg(M_covered_by_spacecraft-M_covered_by_Mars);
fprintf("Phase Angle: %.2f deg Ahead\n", alpha)
