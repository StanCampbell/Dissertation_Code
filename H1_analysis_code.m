%Be sure to un/comment the correct modes below, for each participant

participant='Casablanca_Mockingbird\';
session='Session_8';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\TET\TET_data\' participant session]; %extend path to participant data folder
cd (path)

load Digitised_dimensionsdata;

% %Wuhan_Flea
% Attention = dimensions(:,1);
% Body = dimensions(:,2);
% Boredom = dimensions(:,3);
% Effort = dimensions(:,4);
% Metaawareness = dimensions(:,5);
% Personaliseddimension = dimensions(:,6);
% Physicaltension = dimensions(:,7);
% Rumination = dimensions(:,8);
% Scenarioanxiety = dimensions(:,9);
% Sensoryavoidance = dimensions(:,10);
% Sensoryseeking = dimensions(:,11);
% Socialavoidance = dimensions(:,12);
% Socialseeking = dimensions(:,13);
% Source = dimensions(:,14);
% Stress = dimensions(:,15);
% Wakefulness = dimensions(:,16);


% Casablanca_Mockingbird
Attention = dimensions(:,1);
Body = dimensions(:,2);
Boredom = dimensions(:,3);
Effort = dimensions(:,4);
Metaawareness = dimensions(:,5);
Personaliseddimension = dimensions(:,6);
Physicaltension = dimensions(:,7);
Rumination = dimensions(:,8);
Scenarioanxiety = dimensions(:,9);
Sensoryseeking = dimensions(:,10);
Source = dimensions(:,11);
Stress = dimensions(:,12);
Wakefulness = dimensions(:,13);



%Anderson-Darling test for normality
%h = adtest(Attention)

%H1(A)
rho_h1a_stress = corr(Body, Stress, 'type', 'Spearman')
rho_h1a_physicaltension = corr(Body, Physicaltension, 'type', 'Spearman')
rho_h1a_rumination = corr(Body, Rumination, 'type', 'Spearman')
rho_h1a_scenarioanxiety = corr(Body, Scenarioanxiety, 'type', 'Spearman')

%H1(B)
rho_h1b_stress = corr(Attention, Stress, 'type', 'Spearman')
rho_h1b_physicaltension = corr(Attention, Physicaltension, 'type', 'Spearman')
rho_h1b_rumination = corr(Attention, Rumination, 'type', 'Spearman')
rho_h1b_scenarioanxiety = corr(Attention, Scenarioanxiety, 'type', 'Spearman')

%Not sure about H1(C) yet