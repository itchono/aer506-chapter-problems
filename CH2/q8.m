F = [15; 10; 0];

w = [0; 0; 2];
wd = [0; 0; -5];
wdd = [0; 0; 3];


t1 = cross(wdd, F);
t2 = 2 * cross(wd, cross(w, F));
t3 = cross(w, cross(wd, F));
t4 = cross(w, cross(w, cross(w, F)));

Fddd = t1 + t2 + t3 + t4;

disp(Fddd);