function matrix = buildMatrix(x,order)
    n0 = 0;
    n = order;
    [r,c] = size(x);
    z = ones(r, 1 + c * order);
    while n > 0;
        n0 = n0 + c;
        z(:,n0-c+2:n0+1) = x.^(n0/c);
        n = n - 1;
    end
    matrix = z;
end