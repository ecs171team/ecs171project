% Ordinary Least Squares solver
function w = olsSolver(x,y,order)
	z = buildMatrix(x,order);
	w = (transpose(z) * z) \ (transpose(z) * y);
end