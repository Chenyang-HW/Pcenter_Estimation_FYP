clear; clc; close all;
prompt1='Please enter the text file path of intensities sample\n';
intensitiesSampleFilePath=input(prompt1);

%1
%--------------------------------------------------------------------------
%   Title: readData
%   @brief: read intensities sample from TestGrid text file
%   @parameter: intensitiesSampleFilePath:the path of intensity smaple file
%       intensitiesFileType: the file type
%       intensitiesValue: the value of intensities of sample point
%       intensitiesReponseTime: the value of time of sample point
%--------------------------------------------------------------------------
[intensitiesFileType,audioTimeSize,intensitiesSampleSize,...
    intensitiesSamplePeriod,intensitiesReponseTime,intensitiesValue]=...
    Step1_readData(intensitiesSampleFilePath);
%Intensity contour Plotting
figure(1)
plot(intensitiesReponseTime,intensitiesValue,'-');
grid on

xlabel('intensities reponse time (sec)');
ylabel('intensity contour (dB)');
title(' Step1 read intensities sample');

% 2
%--------------------------------------------------------------------------
%   Title: storeData
%   @brief: store intensities sample point into 2-dimention matrix
%   @parameter: matrixFileOutputPath:intensity smaple point matrix path
%       ReponseTime_IntensitiesValue: the matrix store the value of
%           intensities and the value of their response time
%--------------------------------------------------------------------------
% Write [intensitiesReponseTime,intensitiesValue] into Time_Intensities
matrixFileOutputPath='Time_Intensities_Step2.txt';
Step2_storeData(matrixFileOutputPath,intensitiesReponseTime,intensitiesValue);
ReponseTime_IntensitiesValue=importdata(matrixFileOutputPath);

%3
%--------------------------------------------------------------------------
%   Title: PCentersEstimation
%   @brief: store the Pcenter and its intensity value in audio into matrix
%       Pcenters_IntensitiesValue 
%   @parameter: ReponseTime_IntensitiesValue: the matrix store the value of
%           intensities and the value of their response time
%       Pcenters_IntensitiesValue: the matrix store Pcenter of each beat
%           and its reponse intensity value
%--------------------------------------------------------------------------
%Find P-center of beat 
%**************************************************************************
%   Title:  PCentersEstimation_Version1
%   @method: repeating to compare each sample points with it adjancent
%           points to find all the bottom points and peak points in intensity
%           contour
%       Then using bottoms and peaks to get middle points, the time value
%           of each middle point is Pcenters
%**************************************************************************
% [Pcenters_IntensitiesValue]=Step3_PCentersEstimation_Version1(...
%     ReponseTime_IntensitiesValue);
%**************************************************************************
%   Title:  PCentersEstimation_Version2
%   @method: use findpeaks() function to find bottoms and peaks in intensity
%           contour
%       Then using bottoms and peaks to get middle points, the time value
%           of each middle point is Pcenters
%**************************************************************************
[Pcenters_IntensitiesValue]=Step3_PCentersEstimation_Version2(...
    ReponseTime_IntensitiesValue);
%**************************************************************************
%   Title:  PCentersEstimation_Version3
%   @method: Use Timestamp of the word 'in','the'and 'of' to clean the
%           matrix ReponseTime_IntensitiesValue (intensity contour)
%       use findpeaks() function to find bottoms and peaks in intensity
%           contour
%       Then using bottoms and peaks to get middle points, the time value
%           of each middle point is Pcenters
%**************************************************************************
% prompt2='Please enter the text file path of timesample from IBM Cloud\n';
% word_TimeStampIBMFilePath=input(prompt2);
% [Pcenters_IntensitiesValue]=Step3_PCentersEstimation_Version3(...
%     ReponseTime_IntensitiesValue,word_TimeStampIBMFilePath);
% %Data clean: output the sample point which intnsity value bigger than 20
% Pcenters_IntensitiesValue(all(Pcenters_IntensitiesValue<20,2),:)=[];

% 4
%--------------------------------------------------------------------------
%   Title: PcentersOutput
%   @brief: output the Pcenters in Step3 and store them into text file, the
%       format of the file is as TextFile
%   @parameter: Pcenters_IntensitiesValue: the matrix store Pcenter of each 
%       beat and its reponse intensity value
%       PcentersFileOutputPath: the file path for Pcenters output
%--------------------------------------------------------------------------
% Print result as TexGrid Format
PcentersFileOutputPath='Pcenters_Step4.txt';
Step4_PcentersOutput(intensitiesFileType,audioTimeSize,Pcenters_IntensitiesValue,...
    PcentersFileOutputPath);