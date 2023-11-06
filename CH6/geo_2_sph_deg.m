function [ra, dec, radius] = geo_2_sph_deg(geo_vec)
% GEO_2_RA_DEC converts a cartesian vector to spherical RA and declination
% coordinates. Returns are in degrees between 0 and 360

radius = norm(geo_vec);

lmn = geo_vec ./ radius;

ra = mod(atan2d(lmn(2), lmn(1)), 360);
dec = atan2d(lmn(3), sqrt(1-lmn(3)^2));

end