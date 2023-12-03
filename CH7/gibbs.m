function [v1, v2, v3] = gibbs(r1, r2, r3)
% Orbit determination using Gibbs' method
mu = 3.986e14;

%% Step 1: compute norms
rm1 = norm(r1);
rm2 = norm(r2);
rm3 = norm(r3);

%% Step 2: cross products
rx12 = cross(r1, r2);
rx23 = cross(r2, r3);
rx31 = cross(r3, r1);

%% Step 3: verify
assert(dot(r1 / rm1, rx23 / norm(rx23)) < 1e-4)

%% Step 4: NDS
N = rm1 * rx23 + rm2 * rx31 + rm3 * rx12;
D = rx12 + rx23 + rx31;
S = (rm2 - rm3) * r1 + (rm3 - rm1) * r2 + (rm1 - rm2) * r3;

%% Step 5: Norms
Nm = norm(N);
Dm = norm(D);

%% Step 6: Velocities
v1 = sqrt(mu / (Nm * Dm)) * (cross(D, r1) / rm1 + S);
v2 = sqrt(mu / (Nm * Dm)) * (cross(D, r2) / rm2 + S);
v3 = sqrt(mu / (Nm * Dm)) * (cross(D, r3) / rm3 + S);


end