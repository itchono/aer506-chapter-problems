a.UT = 5.5;
a.m = 8;
a.d = 14;
a.y = 1914;

b.UT = 14;
b.m = 4;
b.d = 18;
b.y = 1946;

c.UT = 0;
c.m = 9;
c.d = 1;
c.y = 2010;

d.UT = 12;
d.m = 10;
d.d = 16;
d.y = 2007;

e.UT = 12;
e.m = 12;
e.d = 9;
e.y = 2023;


for date = [a, b, c, d, e]
    fprintf("jd: %.3f\n", jd_num(date.UT, date.d, date.m, date.y))
end

function jd = jd_num(UT, d, m, y)

j0 = 367 * y - floor(7*(y + floor((m+9)/12))/4) + floor(275*m/9) + d + 1721013.5;
jd = j0 + UT/24;

end