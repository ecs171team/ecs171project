% calculate the mean square error(mse) for single or multivariate polynomial regression
function error = mse(x1,y1,x2,y2,w)
        [n1,m1] = size(x1);
		[n2,~] = size(x2);
        n = (length(w)-1)/m1;
		z1 = buildMatrix(x1,n);
		z2 = buildMatrix(x2,n);
		mse1 = (transpose(y1 - z1 * w)) * (y1 - z1 * w)/(n1 - length(w));
		mse2 = (transpose(y2 - z2 * w)) * (y2 - z2 * w)/(n2 - length(w));
		fprintf('MSE for order %d: train: %f, test: %f \n', n, mse1, mse2);
		error = [mse1, mse2];
end
