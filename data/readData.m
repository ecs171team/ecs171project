function [ Data ] = readData( )
% Read it baseball data

%% Hitter data
[hitter.num, hitter.names, hitter.raw] = ...
    xlsread('Baseball_hitters_data.xlsx');

    % remove all NaN rows from data.
   [row, ~] = find(isnan(hitter.num(:,21)));
   hitter.num([row],:) = [];
   hitter.names([row+1 ],:) = [];
   hitter.raw([row+1],:) = [];
    
   % Format Hitter Data
   hitter.stringData = [hitter.names(2:end,15:18) hitter.names(2:end,23:24)];
   hitter.stringTitles = [hitter.names(1,15:18) hitter.names(1,23:24)]; 
   hitter.playerNames = [hitter.names(2:end,1)];
   % Remove all string data - Leaves numeric data and respective column
   % titles
   hitter.numData = [hitter.num(:,1:13) hitter.num(:,18:21)];
   hitter.numTitles = [hitter.names(1,2:14) hitter.names(1,19:22)];
   
   % Appended Data ( feature Engineered)
   hitter.numTitles = [hitter.numTitles,'86_AVG', '86_OBP', '86_Slg', ...
       '86_OPS', '86_BB/PA', 'Car_AVG', 'Car_OBP', 'Car_Slg',...
       'Car_OPS', 'Car_BB/PA'];
   
   % Batting Average '86 (86_AVG) = Hits/At bats
   hitter.numData(:,18) = hitter.numData(:,2)./hitter.numData(:,1); 
   %On base percentage '86 (86_OBP) = Hits+Walks /At bats
   hitter.numData(:,19) = (hitter.numData(:,2) + hitter.numData(:,6))./ ...
       hitter.numData(:,1); 
   % Slugging '86 (86_Slg) = Homeruns/At bats
   hitter.numData(:,20) =  hitter.numData(:,3)./(hitter.numData(:,1)); 
   % On Base plus Slugging '86(86_OPS) = Slugging Percent + On base percent
   hitter.numData(:,21) = hitter.numData(:,19) + hitter.numData(:,20);
   % Walking Average '86 (86_BB/PA) = Walks/At bats
   hitter.numData(:,22) = hitter.numData(:,6)./hitter.numData(:,1); 
   
   % Batting Average Career (Car_AVG) = Hits/At bats
   hitter.numData(:,23) = hitter.numData(:,9)./hitter.numData(:,8); 
   %On base percentage Career (Car_OBP) = Hits+Walks /At bats
   hitter.numData(:,24) = (hitter.numData(:,9) + hitter.numData(:,13))./ ...
       hitter.numData(:,8);
   % Slugging Career (Car_Slg) = Homeruns/At bats
   hitter.numData(:,25) =  hitter.numData(:,10)./(hitter.numData(:,8)); 
   % On Base plus Slugging Career (Car_OPS) = Slugging Percent + On base percent
   hitter.numData(:,26) = hitter.numData(:,24) + hitter.numData(:,25); 
   % Walking Average Career (Car_BB/PA) = Walks/At bats
   hitter.numData(:,27) = hitter.numData(:,13)./hitter.numData(:,8); 
   
   % Place Salary at end
   hitter.numData(:,28) = hitter.numData(:,17);
   hitter.numData(:,17) = []; % Deletes col 17 and shifts Columns left
   hitter.numTitles(1,28) = hitter.numTitles(1,17);
   hitter.numTitles(:,17) = [];
   
   hitter = rmfield(hitter,'num');
   hitter = rmfield(hitter,'names');
   

%% Pitcher data
[pitcher.num, pitcher.names, pitcher.raw] = ...
    xlsread('Baseball_pitchers_data.xlsx');

% Format Pitcher Data
   % remove all NaN rows from data.
   [row, ~] = find(isnan(pitcher.num(:,14)));
   pitcher.num([row],:) = [];
   pitcher.names([row+1],:) = [];
   pitcher.raw([row+1],:) = [];
   
   %Format Pitcher data
   pitcher.stringData = [pitcher.names(2:end,2:3) pitcher.names(2:end,18:19)];
   pitcher.stringTitles = [pitcher.names(1,2:3) pitcher.names(1,18:19)];
   pitcher.playerNames = [pitcher.names(2:end,1)];
   
   pitcher.numData = pitcher.num;
   pitcher.numTitles = pitcher.names(1,4:17);
   
   % Appended Data (Feature Engineered)
   pitcher.numTitles = [pitcher.numTitles, 'W%'];
   %Wins Percent (W%) = wins/(wins + losses)
   pitcher.numData(:,15) = pitcher.numData(:,1) ./ (pitcher.numData(:,1) + pitcher.numData(:,2)); 
   
   pitcher = rmfield(pitcher,'num');
   pitcher = rmfield(pitcher,'names');
   
   %Place Salary at end
   pitcher.numData(:,16) = pitcher.numData(:,14);
   pitcher.numData(:,14) = [];
   pitcher.numTitles(1,16) = pitcher.numTitles(1,14);
   pitcher.numTitles(:,14) = [];
   
   

%% Postion data
[~, posNames, ~] = ...
    xlsread('Baseball_pos_codes.xlsx');

%% Team Data
[team.num, team.names, team.raw] = ...
    xlsread('Baseball_hitters_data.xlsx');

%% Export in Data struct
Data.hitter = hitter;
Data.pitcher = pitcher;
Data.team = team;
Data.positions = posNames;

end

