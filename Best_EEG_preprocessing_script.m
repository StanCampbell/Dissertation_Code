%Dreem EEG analysis script
% This script loads the eeg data from h5 files into variable 'data'
%insert these folders into the path
%Files are sorted by participants:
% pathdirectory\participantname\file.h5, then directed to subfolders
% pathdirectory\participantname\subfolder\EEGfile

eeglab

% adapt this
participant='Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\' participant]; %extend path to participant data folder
cd (path)

% make directories
mkdir ('1-matfiles')
mkdir ('2-setfiles')
mkdir ('3-cutfiles')
mkdir ('4-epoch4secs')

%create mat file from .h5
[data,start_time]=h5tomat(path)

%create set file
mattoeeg(path)

%highpass filter to minimise drift = 1
hp=1;
dreem_highpass(path,hp)

%length of each recording
%rec_length=dreemlength(path,part) %n datapoints
%rec_length(2,:)=rec_length(1,:)\250 % length in seconds
%rec_length(3,:)=rec_length(2,:)\60 % length in minutes


%epoch
inpath=[path '\3-cutfiles\']
outpath=[path '\4-epoch4secs\']

epoch_length=4;

dreem_8secs(inpath,outpath,epoch_length)

%% cut the files to correct start\end location
% to cut manually, open eeglab > edit > selectdata by epoch or time
% then save the file into a folder called 5-cut

%participant='4567_KhulnaWhale';
%path=['\Users\jachs\Desktop\Jamyang_Project\DreemEEG\'4567_KhulnaWhale'\];
cd (path);

mkdir ('5-cut')
mkdir ('6-rej_epoch')
mkdir ('6-removechan')
% 
% close all
i=44;

newlength=301; %BASED ON 20 MINUTES FOR PILOT (300 epochs)
inpath=[path '\4-epoch4secs\'];
outpath=[path '\5-cut\'];

%open eeglab again if i need it

%EEG=cut20minutes(inpath,outpath,i,newlength); THIS FUNCTION USUALLY DOES
%NOT WORK AND CAUSES ISSUES
% INSTEAD, MANUALLY CUT EACH MEDITATION SESSION FILE IN EEGLAB (20 MINUTES FOR PILOT
% STUDY). LABEL THE FILES with '_labelled.set'


%% remove channels

%preprocess_detectBadTrials can be edited to change the rejection
%threshold/sensitivity

path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\']
cd(path)

participant='Casablanca_Mockingbird\';
folder='\5-cut\';

inpath= ['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\' participant folder];

% change this for each EEG file I am editing
name=['CM_280222_2679679_labelled_EEG'];
filename=[name '.set'];

EEG = pop_loadset('filename',filename,'filepath',inpath);
eeglab redraw

% Once you have checked your data again in eeglab,
% select channels to be removed 
chan=[1, 2, 5, 6]; %EDIT THESE BASED ON WHICH ARE FAULTY
EEG.data(chan,:,:)=0;
eeglab redraw

%save dataset
%mkdir ('6-removechan')
outfolder=['\6-removechan\']
outpath=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\' participant outfolder];
EEG = pop_saveset( EEG, 'filename',[name '_rmchan.set'],'filepath', outpath);


%% CLEAN TRIALS

%preprocess_detectBadTrials can be edited to change the rejection threshold/sensitivity can be found in > bad_epochs > preprocess_manageBadTrials


%FOR WHEN I HAVE NOT REMOVED CHANNELS
%path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\Casablanca_Mockingbird\'];
%i=1% must manually change the value of i for each file that I am pre-processing
%input_path=[path '\5-cut\'];
%output_path=[path '\6-rej_epoch\'];

%FOR WHEN I HAVE REMOVED CHANNELS
participant='Casablanca_Mockingbird\';
path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\' participant];
cd(path)

%seems like I should define name for each trial I am processing

%name=['WF_030222_2659320_EEG_labelled_rmchan.set'];
%^^commented out (Barbara)

%BEAR IN MIND THAT, IF CHANNELS HAVENT BEEN REMOVED, FILES WILL NOT BE
%INDEXED WITH THESE SUFFIXES, AND I MUST CHANGE THE 'input/output_path's

i=7 % must manually change the value of i for each file that I am pre-processing
input_path=[path '\6-removechan\'];

mkdir ('7-removechanrej')
outfolder=['\7-removechanrej\']
output_path=['C:\Users\Stan Campbell\Desktop\Cambridge University Third Year\PBS5\MATLAB_files\EEG\EEG_data\' participant outfolder];

i=7 % must manually change the value of i for each .set file that I am pre-processing (it wont consider .fdt files)
EEG=bad_epochs(input_path,output_path,i);
ep=(EEG.rejepoch)';
eeglab redraw
EEG.setname

%Save dataset
%EEG = pop_saveset( EEG, 'filename',[name '_rmchanrej.set'],'filepath', output_path);

%% Hilbert analysis (Nate's nicer version)

%Nate will send it to me soon!
%This will give me my measure of alpha/theta power


%% Get the epoch count
participant='5644_YaroslaveFalcon\';
folder='\5-rej_epoch\';
inpath=['\Users\jachs\Desktop\Jamyang_Project\DreemEEG\' participant folder];

epoch_count=countepochs(inpath);


%% Calculate the offset and slope
% % this requires the fooof toolbox 
ParticipantList={'1425','1733_BandjarmasinKomodoDragon', '1871','1991_MendozaCow','2222_JiutaiChicken',...
   '2743_HuaianKoi','2965','3604','3614','3938_UlsanAlligator','8683_CotonouFox','8725'};


for p=1:length(ParticipantList)
    
    
    participant=ParticipantList{p};
    %Jamyang
    path=['\Users\jachs\Desktop\Jamyang_Project\DreemEEG\' participant '\']
    
    cd (path)
    
    mkdir ('11-fooofdata')
    inpath=[path '7-med\']; %J
    %inpath=[path '5-rej_epoch\']; %R
    outpath=[path '11-fooofdata\']
    cd (inpath)
    files=dir('*.set')
    
    for i=1:length(files)
        filename=files(i).name;
        [pathstr,name,ext] = fileparts([inpath filename]);
        EEG=[];
        EEG = pop_loadset('filename',filename,'filepath',inpath);
        
        %Valencia
        %editname=erase(name,'_cut_4sec_rej_epoch');
        %newname=erase(editname,'_rmchan_rej_epoch');
        
        %Jamyang
        newname=erase(name,'_med');
        
        %try
        channelselection=[1,3,4,5,7];
        [offset,exponent]=dreem_fooof(EEG,channelselection);
            
        save([outpath newname '_fooofdata'],'offset','exponent')
            
        %catch
        
        %disp(['could not compute fooof for ' newname])
        
        %end
        
    end
end