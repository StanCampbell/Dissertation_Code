%If I'm correlating EEG data with TET data, how do I define the path and
%directories?

participant='Wuhan_Flea\';
session='Session_1\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\TET\TET_data\' participant session 'Digitised\'];
cd (path)

load Matched.mat;
load CM_030322_2682173_labelled_EEG_rmchan_rej_epoch_hilbdata_alpha.mat;


Channel_3 = hilbdata(3,:)';
Channel_4 = hilbdata(4,:)';
Channel_7 = hilbdata(7,:)';

%Wuhan_Flea
Attention = dimensions(:,1);
Body = dimensions(:,2);
Boredom = dimensions(:,3);
Effort = dimensions(:,4);
Metaawareness = dimensions(:,5);
Personaliseddimension = dimensions(:,6);
Physicaltension = dimensions(:,7);
Rumination = dimensions(:,8);
Scenarioanxiety = dimensions(:,9);
Sensoryavoidance = dimensions(:,10);
Sensoryseeking = dimensions(:,11);
Socialavoidance = dimensions(:,12);
Socialseeking = dimensions(:,13);
Source = dimensions(:,14);
Stress = dimensions(:,15);
Wakefulness = dimensions(:,16);


% % Casablanca_Mockingbird
% Attention = dimensions(:,1);
% Body = dimensions(:,2);
% Boredom = dimensions(:,3);
% Effort = dimensions(:,4);
% Metaawareness = dimensions(:,5);
% Personaliseddimension = dimensions(:,6);
% Physicaltension = dimensions(:,7);
% Rumination = dimensions(:,8);
% Scenarioanxiety = dimensions(:,9);
% Sensoryseeking = dimensions(:,10);
% Source = dimensions(:,11);
% Stress = dimensions(:,12);
% Wakefulness = dimensions(:,13);


% %H2
% rho_h2_attention = corr(Channel_4, Attention, 'type', 'Spearman')
% rho_h2_metaawareness = corr(Channel_4, Metaawareness, 'type', 'Spearman')

%H3
rho_h3_boredom = corr(Channel_4, Boredom, 'type', 'Spearman')
rho_h3_effort = corr(Channel_4, Effort, 'type', 'Spearman')
rho_h3_wakefulness = corr(Channel_4, Wakefulness, 'type', 'Spearman')
