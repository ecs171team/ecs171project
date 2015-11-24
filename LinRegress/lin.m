  
function linStats = lin(xRaw, yRaw)
    dataRaw = [xRaw yRaw];
    
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
    disp('Performing basic linear regression...');
    [linearWeights cInt residuals] = regress(yTrain, xTrain);
    
    % Calculate training and testing errors (RMSE, normalized)
    trainErr = sqrt(mean((residuals).^2));
    linearPredictions = xTest*linearWeights;
    testErr = sqrt(mean((yTest - linearPredictions).^2));
    
    linStats = [linearWeights; trainErr; testErr];
end