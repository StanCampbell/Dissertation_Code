
%All I must do is change these two variables correctly for each session
%And choose correct participant
Session='Session_8';
TETfileID='2682173';

outputfile = ['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\TET\TET_data\Casablanca_Mockingbird\' Session '\Digitised\Matched.mat\'];

TETinpath = ['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\TET\TET_data\Casablanca_Mockingbird\' Session '\Digitised_dimensionsdata.mat\'];
if exist (TETinpath)~=0
    load (TETinpath);
    zer=find (dimensions(1,:)==0)
else
    dimensions=[];
end

% Load the EEG to find out length of file
EEGinpath=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\Casablanca_Mockingbird\7-removechanrej'];

findfiles=dir([EEGinpath '/*' TETfileID '*.set']);
% if isempty(findfiles)
%     continue
% end
EEGfilename=findfiles.name;
EEG=[];
EEG = pop_loadset('filename',EEGfilename,'filepath',EEGinpath);

n_epochs=length(EEG.urevent); %number of epochs before rejection
rej_epochs=EEG.rejepoch; %vector of rejected epochs

%replace the rejected epochs in the TET file
dimensions(rej_epochs,:)=[];
%
if length(EEG.epoch)~=size(dimensions,1)
    warning (['The TET and EEG epochs are not the same length in file ' TETfileID])
else
    save(outputfile,'dimensions');
end