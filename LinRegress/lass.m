function lassStats = lass(xRaw, yRaw)
    dataRaw = [xRaw, yRaw];
    
    % Add ones for bias, then split into training/testing sets
    trainIndices = randsample(length(dataRaw), round(.75*length(dataRaw)));	
    testIndices = setxor(1:length(dataRaw), trainIndices);	                
    dataTrain = dataRaw(trainIndices, :);
    dataTest = dataRaw(testIndices, :);

    % Form input and output matrices (adding intercept ones to inputs)
    yTrain = dataTrain(:, end);
    yTest = dataTest(:, end);
    xTrain = [ones(length(yTrain), 1) dataTrain(:, 1:end-1)];
    xTest = [ones(length(yTest), 1) dataTest(:, 1:end-1)];

    % Perform various regression techniques
    disp('Performing LASSO regression...');
    [lassoWeights fitInfo] = lasso(xTrain, yTrain, 'CV', 10);
    
    % Calculate training and testing errors (RMSE, normalized)
    trainErr = sqrt(fitInfo.MSE(fitInfo.IndexMinMSE));
    lassoPredictions = xTest*lassoWeights(:, fitInfo.IndexMinMSE);
    testErr = sqrt(mean((yTest - lassoPredictions).^2));
    
    lassStats = [lassoWeights(:, fitInfo.IndexMinMSE); trainErr; testErr];
end