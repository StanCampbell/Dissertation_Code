Directory='/Volumes/rp1/EEG_MATLAB/Analysis_grids/';
Participant='Participant_1/';
Date='Date/';
Session='Morning';
inputpath=[Directory Participant Date Session '/'];
outputpath=[Directory Participant 'Digitised/'];
%Dependent section: comment out this line once directory is made
mkdir(outputpath)
%End of dependent section
cd (inputpath)
files=dir ('*.jpeg');
%load the outputfile if it exists already
outputfile=[outputpath Session '_dimensionsdata.mat'];
if exist (outputfile)~=0
    load (outputfile);
    zer=find (dimensions(1,:)==0);
else
    dimensions=[];
end
%% Digitising the actual graphs
n_epochs=315    
for f= 1:length(files)%[3507,2478]
    
    try
         y=digitize_graph(files(f).name,[0:1/(n_epochs-1):1]);
        close all
        dimensions(:,f)=y;
        disp(files(f).name)
    catch
        disp (['couldnt digitise ' files(f).name ', attempting with automatically cropped image'])
        
        try
            close all
            y=digitize_graph_autocrop(files(f).name,[0:1/(n_epochs-1):1]);
            dimensions(:,f)=y;
            disp(files(f).name)
            
        catch
            
            disp (['couldnt digitise ' files(f).name ', attempting again with cropped image'])
            
            try
                
                close all
                y=digitize_graph_crop(files(f).name,[0:1/(n_epochs-1):1]);
                dimensions(:,f)=y;
                disp(files(f).name)
            catch
                disp (['couldnt digitise ' files(f).name])
                
            end
        end
        
    end    
   
    save(outputfile,'dimensions');
 
end
figure; plot(dimensions(:,f))
%% Check if the files were digitized correctly
% plot the image next to the vector
close all
for f=1:length(files) %this next
    
    I = imread(files(f).name);
    fig_position = [400 400 1200 300];
    figure('Position', fig_position)
    
    subplot(1,2,1)
    imshow(I);
    subplot(1,2,2)
    plot(dimensions(:,f));
    ylim([0 1])
    xlim([0 n_epochs]);
    sgtitle(files(f).name);
    
end
%% Now load all the dimensionfiles and concatenate into one 
Directory='/Volumes/rp1/EEG_MATLAB/Grids_for_analysis/Directory_for_adapt_grids/';
Participant='Participant_1_by_date/';
inputpath=[Directory Participant 'Digitised/'];
outputfile=[Directory Participant 'AllData.mat'];
cd(inputpath)
AllData=[];
files=dir ('*.mat');
for i=1:length(files)
    load(files(i).name)
    %check it's all in correct order
    disp(files(i).name)
    AllData=[AllData; dimensions];
end
save(outputfile,'dimensions');