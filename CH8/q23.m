mu = 3.986e14;

rc1 = 400e3 + 6378e3;

%% Part a)
% magic formula from before
vc1 = sqrt(mu/rc1);
vp = vc1 + 240;
r2 = rc1 * (rc1 * vp^2 / (2*mu - rc1 * vp^2));
fprintf("New orbit: %.2f km x %.2f km\n", r2/1e3 - 6378, rc1/1e3 - 6378);


%% Part b)
% tangential transfer - re-solve vn/vr equations with new content
% h is still the same since vn * r is still the same
h = rc1 * vc1;
vn = vc1;
vr = 240;

% doing some workings on math, we get that theta = 90 deg
% this is because we're adding radial velocity without changing tangential
% velocity; the only way to decouple v_n is at theta = +/- 90 deg
% you can check it yourself; you get tan(theta) = infinity
theta = 90;
e = vr * h / mu / sind(theta);
a = h^2 / mu / (1-e^2);
fprintf("New orbit: %.2f km x %.2f km\n", a*(1+e)/1e3 - 6378, a*(1-e)/1e3 - 6378);
