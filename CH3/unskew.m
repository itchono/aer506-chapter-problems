function v = unskew(M)
    v = [-M(2, 3); M(1, 3), M(1, 2)];
end