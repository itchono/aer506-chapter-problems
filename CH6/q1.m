r_a = [9000; 6000; 3000];
r_b = [-3000; -6000; -9000];
r_c = [-9000; -3000; 6000];
r_d = [6000; -9000; -3000];

[ra, dec, ~] = geo_2_sph_deg(r_a);
fprintf("a) RA: %f, Dec: %f\n", ra, dec)
[ra, dec, ~] = geo_2_sph_deg(r_b);
fprintf("b) RA: %f, Dec: %f\n", ra, dec)
[ra, dec, ~] = geo_2_sph_deg(r_c);
fprintf("c) RA: %f, Dec: %f\n", ra, dec)
[ra, dec, ~] = geo_2_sph_deg(r_d);
fprintf("d) RA: %f, Dec: %f\n", ra, dec)