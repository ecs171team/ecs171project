% load data
input = readData();

% separate data into separate vectors
atBat86 = input.hitter.numData(:, 1);
hits86 = input.hitter.numData(:, 2);
homeRuns86 = input.hitter.numData(:, 3);
runs86 = input.hitter.numData(:, 4);
rbi86 = input.hitter.numData(:, 5);
walks86 = input.hitter.numData(:, 6);
putOuts86 = input.hitter.numData(:, 14);
assists86 = input.hitter.numData(:, 15);
errors86 = input.hitter.numData(:, 16);
avg86 = input.hitter.numData(:, 17);
obp86 = input.hitter.numData(:, 18);
slg86 = input.hitter.numData(:, 19);
ops86 = input.hitter.numData(:, 20);
bbpa86 = input.hitter.numData(:, 21);
salary87 = input.hitter.numData(:, 27);

data(:,1) = atBat86;
data(:,2) = hits86;
data(:,3) = homeRuns86;
data(:,4) = runs86;
data(:,5) = rbi86;
data(:,6) = walks86;
data(:,7) = putOuts86;
data(:,8) = assists86;
data(:,9) = errors86;
data(:,10) = avg86;
data(:,11) = obp86;
data(:,12) = slg86;
data(:,13) = ops86;
data(:,14) = bbpa86;
data(:,15) = salary87;

% variable names
varNames(:,1) = input.hitter.numTitles(:,1);
varNames(:,2) = input.hitter.numTitles(:,2);
varNames(:,3) = input.hitter.numTitles(:,3);
varNames(:,4) = input.hitter.numTitles(:,4);
varNames(:,5) = input.hitter.numTitles(:,5);
varNames(:,6) = input.hitter.numTitles(:,6);
varNames(:,7) = input.hitter.numTitles(:,14);
varNames(:,8) = input.hitter.numTitles(:,15);
varNames(:,9) = input.hitter.numTitles(:,16);
varNames(:,10) = input.hitter.numTitles(:,17);
varNames(:,11) = input.hitter.numTitles(:,18);
varNames(:,12) = input.hitter.numTitles(:,19);
varNames(:,13) = input.hitter.numTitles(:,20);
varNames(:,14) = input.hitter.numTitles(:,21);
varNames(:,15) = input.hitter.numTitles(:,27);

%%
%% Problem 1
%%

% find three "equal" subdivisions of salary
q = quantile(salary87,[0.33,0.66,1.00]);

j = 1;
k = 1;
l = 1;
group = cell(263,1); % initialize array for salary category

% put data in appropriate bin
for i = 1:size(salary87, 1)
  if salary87(i) <= q(1)
    group{i} = 'low'; % store salary category
    low(j) = salary87(i);
    j = j + 1;
  elseif salary87(i) <= q(2)
    group{i} = 'med'; % store salary category
    med(k) = salary87(i);
    k = k + 1;
  else
    group{i} = 'high'; % store salary category
    high(l) = salary87(i);
    l = l + 1;
  end
end

%%
%% Problem 2
%%

% scatterplot matrix
gplotmatrix(data(:,1:14), [], group, 'bgr',[],[5,5,5],'on','hist',varNames(1:14));
print('scatterplotMatrix','-dpng');

%%
%% Problem 3
%%

% see olsSolver.m

%%
%% Problem 4
%%

[~,n] = size(data);
for i = 1:(n-1)
    x1 = data(1:163,i);
    y1 = data(1:163,15);
    x2 = data(164:263,i);
    y2 = data(164:263,15);
    fprintf('Variable: %s \n',varNames{i});
    plotVars(x1,y1,x2,y2,varNames{i});
    fprintf('\n');
end
    
