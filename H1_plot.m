%% Define Participant and Excel Spreadsheet

participant='\Wuhan_Flea\';
% participant='\Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\Results' participant]; %extend path to participant data folder
cd (path)

t = readtable('WF_H1.xlsx');
% t = readtable('CM_H1.xlsx');
sessionnumber = t.SessionNumber;
stressvsbodysrcc = t.StressVsBodySRCC;
physicaltensionbodysrcc = t.PhysicalTensionVsBodySRCC;
ruminationbodysrcc = t.RuminationVsBodySRCC;
scenarioanxietybodysrcc = t.ScenarioAnxietyVsBodySRCC;
stressvsattentionsrcc = t.StressVsAttentionSRCC;
physicaltensionattentionsrcc = t.PhysicalTensionVsAttentionSRCC;
ruminationattentionsrcc = t.RuminationVsAttentionSRCC;
scenarioanxietyattentionsrcc = t.ScenarioAnxietyVsAttentionSRCC;


%% Use ctrl+f to replace significance levels for each participant

% significance thresholds for Y (Wuhan_Flea, n = 11)
% p<0.05 (0.527)
% p<0.01 (0.700)

% significance thresholds for Y (Casablanca_Mockingbird, n = 5)
% p<0.05 (0.900)
% p<0.01 (1.000)

%% Boxplots
boxplot([stressvsbodysrcc, physicaltensionbodysrcc, ruminationbodysrcc, scenarioanxietybodysrcc], 'Labels',{'[Stress]','[Physical Tension]', '[Rumination]', '[Scenario Anxiety]'})
title('[Experience Mode] VS Body')

boxplot([stressvsattentionsrcc, physicaltensionattentionsrcc, ruminationattentionsrcc, scenarioanxietyattentionsrcc], 'Labels',{'[Stress]','[Physical Tension]', '[Rumination]', '[Scenario Anxiety]'})
title('[Experience Mode] VS Attention')


%% H1A Plot a tiledlayout for the four scatterplots

tiledlayout(2,2, 'TileSpacing', 'Compact');
nexttile

% define Y and title
tit = 'Stress VS Body';
Y = stressvsbodysrcc;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;


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
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');


nexttile

tit = 'Physical Tension VS Body';
Y = physicaltensionbodysrcc;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');

nexttile

tit = 'Rumination VS Body';
Y = ruminationbodysrcc;
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');

nexttile

tit = 'Scenario Anxiety VS Body'
Y = scenarioanxietybodysrcc
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');



%% H1B Plot a tiledlayout for the four scatterplots

tiledlayout(2,2, 'TileSpacing', 'Compact');
nexttile

% define Y and title
tit = 'Stress VS Attention'
Y = stressvsattentionsrcc
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;


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
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');


nexttile

tit = 'Physical Tension VS Attention'
Y = physicaltensionattentionsrcc
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');

nexttile

tit = 'Rumination VS Attention'
Y = ruminationattentionsrcc
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');

nexttile

tit = 'Scenario Anxiety VS Attention'
Y = scenarioanxietyattentionsrcc
X = sessionnumber;
sz = 20;

pnotsig = abs(Y)<0.527;
p005 = abs(Y)>0.527 & abs(Y)<0.700;
p001 = abs(Y)>0.700;

scatter(X(p001), Y(p001), sz, 'red', 'filled', 'o');
hold on;
scatter(X(p005), Y(p005), sz, 'blue', 'filled', 'o');
hold on;
scatter(X(pnotsig), Y(pnotsig), sz, 'green', 'filled', 'o')
title(tit);
xlabel('Session Number');
ylabel('Spearman’s R');
yline(0, '-');
yline(0.527, '--');
yline(0.700, '--');
yline(-0.527, '--');
yline(-0.700, '--');