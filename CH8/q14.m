syms mu r real positive

vc1 = sqrt(mu/r);
vc2 = sqrt(mu/(12*r));

vpt = sqrt(mu) * sqrt(2/r - 2/(13*r));
vat = sqrt(mu) * sqrt(2/(12*r) - 2/(13*r));

dv1 = vpt - vc1;
dv2 = vc2 - vat;

dv = dv1 + dv2;
fprintf("DV = %.3f vc1\n", double(dv/vc1));