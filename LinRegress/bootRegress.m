% Init
NBOOT = 1000;
strings = {'bias:' 'hitAvg:' 'HrAvg:' 'runs:' 'rbi:' 'walkAvg:' 'OBAvg:' 'hitAvgC:' 'HrAvgC:' 'runsC:' 'rbiC:' 'walkAvgC:' 'OBAvgC:' 'po:' 'assist:' 'errors:' 'Hyears:' 'Train:' 'Test:'};
warning('off', 'stats:regress:RankDefDesignMat');

% Read in data
% Read in all data and store it in structure Data
Data = readData();

% Further Feature Engineering/Normalization of All Data
[Xh, Yh, hitterMaxSal, Xp, Yp, pitcherMaxSal] = dataCondensor(Data);


% Calculate weight vectors for each bootstrap sample
linBootStats = bootstrp(NBOOT, @lin, Xh, Yh);
lassBootStats = bootstrp(NBOOT, @lass, Xh, Yh);

disp('Linear Regression:');
for i = 1:(size(Xh, 2) + 3) % Number of features + bias + train and testing errors
    stat = linBootStats(:, i);
    
    lower = mean(stat) - 1.96*(std(stat)/sqrt(NBOOT));
    upper = mean(stat) + 1.96*(std(stat)/sqrt(NBOOT));
    
    disp(sprintf('    %-9s %-7.4f %-7.4f %-7.4f %-7.4f', strings{i}, lower, upper, mean(stat), (std(stat)/sqrt(NBOOT))));
end

disp('LASSO Regression:');
for i = 1:(size(Xh, 2) + 3) % Number of features + bias + train and testing errors
    stat = lassBootStats(:, i);
    
    lower = mean(stat) - 1.96*(std(stat)/sqrt(NBOOT));
    upper = mean(stat) + 1.96*(std(stat)/sqrt(NBOOT));
    
    if (i >= 2 && i <= (size(Xh,2)+1))
        disp(sprintf('    %-9s %-7.4f %-7.4f %-7.4f %-7.4f %d/%d', strings{i}, lower, upper, mean(stat), (std(stat)/sqrt(NBOOT)), nnz(stat), NBOOT));
    else
        disp(sprintf('    %-9s %-7.4f %-7.4f %-7.4f %-7.4f', strings{i}, lower, upper, mean(stat), (std(stat)/sqrt(NBOOT))));
    end
end