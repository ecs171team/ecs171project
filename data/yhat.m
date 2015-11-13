% Calculate the predicted Y value for polynomial regression
function result = yhat(x, w)
    n = length(x(1, :));
    z = buildMatrix(x, (length(w)-1)/n);
    result = z * w;
end
