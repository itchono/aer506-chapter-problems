function [ra, dec, radius] = geo_2_sph_rad(geo_vec)
% GEO_2_RA_DEC converts a cartesian vector to spherical RA and declination
% coordinates. Returns are in radians between 0 and 2*pi

radius = norm(geo_vec);

lmn = geo_vec ./ radius;

ra = mod(atan2(lmn(2), lmn(1)), 2*pi);
dec = atan2(lmn(3), sqrt(1-lmn(3)^2));

end