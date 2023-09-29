% Compute eigenvalues; this is an eigenvalue problem
% Mv = 1000v
Mh = [1000 0 -300;
      0 1000 500;
      -300 500 1000];

[V, D] = eig(Mh);
% Find eigenvalue of 1000
[~, col] = ind2sub([3 3], find(D==1000));

% Get its corresponding eigenvector
ev = V(:, col);

w = ev * 20;
disp(w)