e = [-0.4; -0.5; -0.6];
e_xy = [e(1); e(2); 0];

inc = acosd(dot(e, e_xy) / (norm(e_xy) * norm(e)))