%% Define Participant and Excel Spreadsheet

% participant='\Wuhan_Flea\';
participant='\Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\Results' participant]; %extend path to participant data folder
cd (path)

% t = readtable('WF_H1.xlsx');
t = readtable('CM_H1.xlsx');
sessionnumber = t.SessionNumber;
stressvsbodysrcc = t.StressVsBodySRCC;
physicaltensionbodysrcc = t.PhysicalTensionVsBodySRCC;
ruminationbodysrcc = t.RuminationVsBodySRCC;
scenarioanxietybodysrcc = t.ScenarioAnxietyVsBodySRCC;
stressvsattentionsrcc = t.StressVsAttentionSRCC;
physicaltensionattentionsrcc = t.PhysicalTensionVsAttentionSRCC;
ruminationattentionsrcc = t.RuminationVsAttentionSRCC;
scenarioanxietyattentionsrcc = t.ScenarioAnxietyVsAttentionSRCC;

%% H1A superimposed dots plot

X = sessionnumber;
Y1 = stressvsbodysrcc;
sz = 20;

scatter(X, Y1, sz, 'black', 'filled', 'o')
title = ('[Mode] VS Body')

hold on

Y2 = physicaltensionbodysrcc;
scatter(X, Y2, sz, 'red', 'filled', 'o')

Y3 = ruminationbodysrcc;
scatter(X, Y3, sz, 'blue', 'filled', 'o')

Y4 = scenarioanxietybodysrcc;
scatter(X, Y4, sz, 'green', 'filled', 'o')

hold off

legend('Stress VS Body','Physical Tension VS Body','Rumination VS Body','Scenario Anxiety VS Body')
xlabel('Session Number')
ylabel('Spearman’s R')
%% H1B superimposed dots plot

X = sessionnumber;
Y1 = stressvsattentionsrcc;
sz = 20;

scatter(X, Y1, sz, 'black', 'filled', 'o')
title = ('[Mode] VS Body')

hold on

Y2 = physicaltensionattentionsrcc;
scatter(X, Y2, sz, 'red', 'filled', 'o')

Y3 = ruminationbodysrcc;
scatter(X, Y3, sz, 'blue', 'filled', 'o')

Y4 = scenarioanxietyattentionsrcc;
scatter(X, Y4, sz, 'green', 'filled', 'o')

hold off

legend('Stress VS Attention','Physical Tension VS Attention','Rumination VS Attention','Scenario Anxiety VS Attention')
xlabel('Session Number')
ylabel('Spearman’s R')