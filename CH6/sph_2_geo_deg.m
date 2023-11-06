function geo_vec = sph_2_geo_deg(ra, dec, radius)

    geo_vec = radius .* [cosd(dec) * cosd(ra); cosd(dec) * sind(ra); sind(dec)];

end