function geo_vec = sph_2_geo_rad(ra, dec, radius)

    geo_vec = radius .* [cos(dec) * cos(ra); cos(dec) * sin(ra); sin(dec)];

end