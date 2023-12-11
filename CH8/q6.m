syms r alpha real positive

% Arrived through derivation on paper
ra = (1+alpha)^2 / (2-(1+alpha)^2) * r; 
e = (ra - r) / (ra + r);

simplify(e)