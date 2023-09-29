% using DCMs does not work btw

% Final rotation: Cx 30 deg

C2 = [1 0 0;
     0 cosd(30) -sind(30);
     0 sind(30) cosd(30)];

% First rotation: Cy 60 deg
C1 = [cosd(60) 0 sind(60) ;
      0  1 0;
     -sind(60) 0 cosd(60)];

C = C1 * C2;

disp(C)
