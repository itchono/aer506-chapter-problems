% Moving Axes
% 90 deg about X
C1 = [cosd(45) -sind(45) 0;
      sind(45), cosd(45) 0;
      0 0 1];
% -30 deg about Y'
C2 = [cosd(-30) 0 sind(-30);
     0 1 0;
     -sind(-30) 0 cosd(-30)];

% 90 deg about X''
C3 = [1 0 0;
     0 0 -1;
     0 1 0];

% X -> Y' -> X''
C = C1 * C2 * C3;
disp(C)

% Check
r1 = [2; 0; 0];
s1 = [0; 0; 2];

r0 = C * r1;
s0 = C * s1;

disp(r0)
disp(s0)