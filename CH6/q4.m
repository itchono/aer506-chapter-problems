r = [-6000; -1000; -5000];
e = [-0.4; -0.5; -0.6];

theta = -acosd(dot(r, e) / (norm(r) * norm(e))) + 360