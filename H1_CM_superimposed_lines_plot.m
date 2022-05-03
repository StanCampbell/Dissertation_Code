%Casablanca Mockingbird's superimposed plots
%% Define Participant and Excel Spreadsheet

participant='\Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\Results' participant]; %extend path to participant data folder
cd (path)

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

%% H1A Physical Tension + Rumination plot

X = sessionnumber;
Y1 = physicaltensionbodysrcc;
sz = 20;

plot(X, Y1, 'LineWidth',8)
title = ('[Mode] VS Body')

hold on

Y2 = ruminationbodysrcc;
plot(X, Y2, 'LineWidth',8)
hold off

legend('Physical Tension VS Body','Rumination VS Body')
xlabel('Session Number')
ylabel('Spearman’s R')

%% H1A Rumination + Scenario Anxiety plot

X = sessionnumber;
Y1 = ruminationbodysrcc;
sz = 20;


plot(X, Y1, 'LineWidth',8)
title = ('[Mode] VS Body')

hold on

Y2 = scenarioanxietybodysrcc;
plot(X, Y2, 'LineWidth',8)
hold off

legend('Rumination VS Body','Scenario Anxiety VS Body')
xlabel('Session Number')
ylabel('Spearman’s R')
%% H1B Physical Tension + Scenario Anxiety plot

X = sessionnumber;
Y1 = physicaltensionattentionsrcc;
sz = 20;


plot(X, Y1, 'LineWidth',8)
title = ('[Mode] VS Body')

hold on

Y2 = scenarioanxietyattentionsrcc;
plot(X, Y2, 'LineWidth',8)
hold off

legend('Physical Tension VS Attention','Scenario Anxiety VS Attention')
xlabel('Session Number')
ylabel('Spearman’s R')