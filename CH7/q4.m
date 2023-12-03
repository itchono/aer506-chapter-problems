% These are in an inertial frame
r1 = [5887; -3520; -1204] * 1e3;
r2 = [5572; -3457; -2376] * 1e3;
r3 = [5088; -3289; -3480] * 1e3;

[v1, v2, v3] = gibbs(r1, r2, r3);

disp(norm(v2))

