mu = 3.986e14;
rc1 = 8000e3;
rc2 = 14000e3;

vc1 = sqrt(mu/rc1);
vc2 = sqrt(mu/rc2);

%% Compute cost of Hohmann transfer portion
vt_p = sqrt(mu) * sqrt(2/rc1 - 2/(rc1 + rc2));
vt_a = sqrt(mu) * sqrt(2/rc2 - 2/(rc1 + rc2));

dv_hohmann = vt_p - vc1 + vc2 - vt_a;
at = (rc1 + rc2)/2;
Tt = 1/2 * 2*pi*sqrt(at^3/mu);

%% Phasing orbit cost
Tc2 = 2*pi*sqrt(rc2^3/mu);
time_delta = Tc2 / 2 - Tt;

% Solve for phasing manueuver
Ttp = Tc2 + time_delta;
atp = (mu * (Ttp/(2*pi))^2)^(1/3);  % transfer sma
ratp = 2 * atp - rc2;

vtp_p = sqrt(mu) * sqrt(2/rc2 - 2/(rc2 + ratp));
dv_phasing = 2 * (vtp_p - vc2);

dv_tot = dv_hohmann + dv_phasing;
fprintf("Total Delta V: %.3f km/s\n", dv_tot/1e3);
