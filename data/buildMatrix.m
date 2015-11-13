function matrix = buildMatrix(x,order)
	t1 = 0;
	t2 = order;
	[r,n] = size(x);
	z = ones(r, 1 + n * order);
	while t2 > 0;
		t1 = t1 + n;
		z(:,t1-n+2:t1+1) = x.^(t1/n);
		t2 = t2 - 1;
	end
	matrix = z;
end