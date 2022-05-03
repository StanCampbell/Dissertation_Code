% un/comment below for each participant


%% Define Participant and Excel Spreadsheet

% participant='\Wuhan_Flea\';
participant='\Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\Results' participant]; %extend path to participant data folder
cd (path)

% t = readtable('WF_H3.xlsx');
t = readtable('CM_H3.xlsx');
sessionnumber = t.Session_Number;
boredomtheta = t.Boredom_Theta;
efforttheta = t.Effort_Theta;
wakefulnesstheta = t.Wakefulness_Theta;

%% Use ctrl+f to replace significance levels for each participant

% significance thresholds for Y (Wuhan_Flea, n = 10)
% p<0.05 (0.564)
% p<0.01 (0.733)

% significance thresholds for Y (Casablanca_Mockingbird, n = 5)
% p<0.05 (0.900)
% p<0.01 (1.000)

%% Boxplots
boxplot([boredomtheta, efforttheta, wakefulnesstheta], 'Labels',{'[Boredom]', '[Effort]', '[Wakefulness]'})
title('[Experience Mode] VS Frontal Theta Power')

%% H3 Plot a tiledlayout for the three scatterplots

tiledlayout(3,1, 'TileSpacing', 'Compact');
nexttile

% define Y and title
tit = 'Boredom VS Frontal Theta Power';
Y = boredomtheta;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.900;
p005 = abs(Y)>0.900 & abs(Y)<1.000;
p001 = abs(Y)>1.000;


% Where p < 0.01 , make red circles.
scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
% Where p < 0.05, make blue circles.
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
% Where p > 0.05 , make green circles.
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.900, '--');
yline(1.000, '--');
yline(-0.900, '--');
yline(-1.000, '--');


nexttile

tit = 'Effort VS Frontal Theta Power';
Y = efforttheta;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.900;
p005 = abs(Y)>0.900 & abs(Y)<1.000;
p001 = abs(Y)>1.000;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.900, '--');
yline(1.000, '--');
yline(-0.900, '--');
yline(-1.000, '--');

nexttile

tit = 'Wakefulness VS Frontal Theta Power';
Y = wakefulnesstheta;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.900;
p005 = abs(Y)>0.900 & abs(Y)<1.000;
p001 = abs(Y)>1.000;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.900, '--');
yline(1.000, '--');
yline(-0.900, '--');
yline(-1.000, '--');