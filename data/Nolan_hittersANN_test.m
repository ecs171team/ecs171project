
%script to use ANN generated by Nolan to test first 50 salaries

data = readData();
for i = 1:50
    x1 = data.hitter.numData(i,1:end-1);
    y1 = data.hitter.numData(i,end);
    yPred = Nolan_hitter_NNF2(x1);
    
    Hresults(i,:) = [y1, yPred, (y1-yPred)^2];
end

for i = 1:50
    x1 = data.pitcher.numData(i,1:end-1);
    y1 = data.pitcher.numData(i,end);
    yPred = Nolan_pitcher_NNF(x1);
    
    Presults(i,:) = [y1, yPred, (y1-yPred)^2];
end



