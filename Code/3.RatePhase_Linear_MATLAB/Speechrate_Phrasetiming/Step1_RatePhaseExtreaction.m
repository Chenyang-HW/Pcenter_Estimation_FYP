%--------------------------------------------------------------------------
%   Title: RatePhaseExtreaction
%   @brief: read speechrate and its corresponding phase 
%   @parameter: beatsFileInputPath:the path of beats(Pcenters) file
%       speechRate;
%       phase;
%--------------------------------------------------------------------------
function [speechRate phrase]=Step1_RatePhaseExtreaction(beatsFileInputPath)

%--------------------------------------------------------------------------
%   @brief: Open the file stored beats and store them into martix called
%       beatTimePoints
%--------------------------------------------------------------------------

fileInID=fopen(beatsFileInputPath); %open beats file
data=textscan(fileInID,'%s');
fclose(fileInID);

dataSizeLine=17;
dataSize=str2double(data{1}{dataSizeLine});%find first line storing time point of beat

for i=1:2:dataSize*2
    beats(i)=str2double(data{1}{i+dataSizeLine});%store all beat with the mark
end
    
beats=beats';

beatTimePoints=beats(1:2:dataSize*2);%store timePoint of each beat

%the time point of first beats, fourth beats and sixth beats per pharse
distance=6;
firstbeatTimePointStartLine=1;
thirdbeatTimePointStartLine=3;
fourthbeatTimePointStartLine=4;
sixthbeatTimePointStartLine=6;
firstbeatTimePoints=beatTimePoints(firstbeatTimePointStartLine:distance:length(beatTimePoints));
thirdbeatTimePoints=beatTimePoints(thirdbeatTimePointStartLine:distance:length(beatTimePoints));
fourthbeatTimePoints=beatTimePoints(fourthbeatTimePointStartLine:distance:length(beatTimePoints));
sixthbeatTimePoints=beatTimePoints(sixthbeatTimePointStartLine:distance:length(beatTimePoints));

%the rate of the sound occurence interval of the first four rhythms to the 
%   occurence intervale of the entire pharse
phrasesNumerator=(fourthbeatTimePoints-firstbeatTimePoints);
phrasesDenominator=(sixthbeatTimePoints-firstbeatTimePoints);
for i=1:length(phrasesNumerator)
    phrase(i)=phrasesNumerator(i)/phrasesDenominator(i);
end
for i=1:length(phrasesNumerator)
%     speechRate(i)=1/(sixthbeatTimePoints(i)-firstbeatTimePoints(i));
    speechRate(i)=1/(sixthbeatTimePoints(i)-firstbeatTimePoints(i));
end
speechRate=speechRate';
phrase=phrase';