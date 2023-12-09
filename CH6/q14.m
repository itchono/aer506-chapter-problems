omegadot = 6;  % deg per day (advance = +)

i = 45;

Omegadot = omegadot * cosd(i) / (5/2 * sind(i)^2 - 2)

