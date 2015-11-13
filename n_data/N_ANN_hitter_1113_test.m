
%script to use ANN generated by Nolan to test first 50 salaries


for i = 1:50
    xi = X(i,1:end);
    xi2 = X_norm(i,1:end);
    yi = Y(i);
    yPred = N_ANN_hitter_1113(xi);
    yP2 = N_ANN_hitter_1113(xi2);
    Hresults(i,:) = [yi, yPred, yP2];
end



