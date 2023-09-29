% Fixed axes
%% (1) -> (2)
% +90 degree rotation about z
C1 = [0 -1 0;
      1 0 0;
      0 0 1];

%% (2) -> (3)
% +90 degree rotation about x'
C2 = [1 0 0;
       0 0 -1;
       0 1 0];

%% (3) -> (4)
% +90 degree rotation about z''
C3 = [0 -1 0;
      1 0 0;
      0 0 1];

%% Z -> X' -> Z''
C = C1 * C2 * C3;

%% Check
% (2, 1, 0) --> (0, -1, 2)
disp(C * [2; 1; 0])