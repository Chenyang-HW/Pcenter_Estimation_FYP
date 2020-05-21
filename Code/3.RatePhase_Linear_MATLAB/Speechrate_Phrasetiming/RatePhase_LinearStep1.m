clear; clc; close all;
%--------------------------------------------------------------------------
%                           RatePhase_Linear
%   @brief: the relationship between speechrate and phase
%--------------------------------------------------------------------------
prompt1='Please enter the text file path of beats(Pcenters)\n';
beatsFileInputPath=input(prompt1);
%1
%--------------------------------------------------------------------------
%   Title: RatePhaseExtreaction
%   @brief: read speechrate and its corresponding phase 
%   @parameter: beatsFileInputPath:the path of beats(Pcenters) file
%       speechRate;
%       phase;
%--------------------------------------------------------------------------
[speechRate phrase]=Step1_RatePhaseExtreaction(beatsFileInputPath);
plot(speechRate,phrase,'x'); hold on

% set(gca,'XDir','reverse');
grid on
legend('speechRate&phase');
xlabel('speechRate');
ylabel('phrase timing');

fileID=fopen('speechRate_pharse.txt','w');
speechRate_phrase=[speechRate phrase];
[rowsize,columsize]=size(speechRate_phrase);
for row=1:1:rowsize
    for colum=1:1:columsize
        fprintf(fileID,'%2.15f\t',speechRate_phrase(row,colum));
    end
    fprintf(fileID,'\r\n');
end
fclose(fileID);
