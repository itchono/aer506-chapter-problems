q7
ke = cartesian2keplerian([G_r(:); G_v(:)]*1e3, 3.986e14);
print_ke(ke);