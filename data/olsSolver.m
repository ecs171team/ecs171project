% Ordinary Least Squares solver
function w = olsSolver(x,y,order)
    X = buildMatrix(x,order);
    w = (transpose(X) * X) \ (transpose(X) * y);
end