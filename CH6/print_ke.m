function print_ke(oe)
fprintf("sma: %.2f km\n", oe(1)/1e3)
fprintf("ecc: %.4f\n", oe(2))
fprintf("inc: %.2f deg\n", oe(3))
fprintf("raan: %.2f deg\n", oe(4))
fprintf("aop: %.2f deg\n", oe(5))
fprintf("theta: %.2f deg\n", oe(6))
end