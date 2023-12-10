function [r,v] = rv_from_observe(rho, rhodot, A, Adot, a, ...
adot, theta, phi, H)

wE = deg2rad(360/86400);  % may need the tweak
f = 0.0033528;
Re = 6378;

deg = pi/180;
omega = [0 0 wE];
%...Convert angular quantities from degrees to radians:
A = A *deg;
Adot = Adot *deg;
a = a *deg;
adot = adot *deg;
theta = theta*deg;
phi = phi *deg;
%...Equation 5.56:
R = [(Re/sqrt(1-(2*f - f*f)*sin(phi)^2) + H)*cos(phi)*cos(theta), ...
(Re/sqrt(1-(2*f - f*f)*sin(phi)^2) + H)*cos(phi)*sin(theta), ...
(Re*(1 - f)^2/sqrt(1-(2*f - f*f)*sin(phi)^2) + H)*sin(phi)];
%...Equation 5.66:
Rdot = cross(omega, R);
%...Equation 5.83a:
dec = asin(cos(phi)*cos(A)*cos(a) + sin(phi)*sin(a));
%...Equation 5.83b:
h = acos((cos(phi)*sin(a) - sin(phi)*cos(A)*cos(a))/cos(dec));
if (A > 0) && (A < pi)
h = 2*pi - h;
end
%...Equation 5.83c:
RA = theta - h;
%...Equations 5.57:
Rho = [cos(RA)*cos(dec) sin(RA)*cos(dec) sin(dec)];
%...Equation 5.63:
r = R + rho*Rho;
%...Equation 5.84:
decdot = (-Adot*cos(phi)*sin(A)*cos(a) + adot*(sin(phi)*cos(a) ...
- cos(phi)*cos(A)*sin(a)))/cos(dec);
%...Equation 5.85:
RAdot = wE ...
+ (Adot*cos(A)*cos(a) - adot*sin(A)*sin(a) ...
+ decdot*sin(A)*cos(a)*tan(dec)) ...
/(cos(phi)*sin(a) - sin(phi)*cos(A)*cos(a));
%...Equations 5.69 and 5.72:
Rhodot = [-RAdot*sin(RA)*cos(dec) - decdot*cos(RA)*sin(dec),...
RAdot*cos(RA)*cos(dec) - decdot*sin(RA)*sin(dec),...
decdot*cos(dec)];
%...Equation 5.64:
v = Rdot + rhodot*Rho + rho*Rhodot;
end %rv_from_observe