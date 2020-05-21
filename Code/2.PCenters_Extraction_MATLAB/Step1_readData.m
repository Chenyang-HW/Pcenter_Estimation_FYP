%--------------------------------------------------------------------------
%   Title: readData
%   @brief: read intensities sample from TestGrid text file
%   @parameter: intensitiesSampleFilePath:the path of intensity smaple file
%       intensitiesFileType: the file type
%       intensitiesValue: the value of intensities of sample point
%       intensitiesReponseTime: the value of time of sample point
%--------------------------------------------------------------------------

function [intensitiesFileType,audioTimeSize,intensitiesSampleSize,...
    intensitiesSamplePeriod,intensityReponseTime,intensitiesValue]=...
    Step1_readData(intensitiesSampleFilePath)

%Import data in text file into intensitiesSampleFileData
%a,b,c..were used to as middle symbol
a=importdata(intensitiesSampleFilePath);
intensitiesSampleFileData=a.data;

b=fopen(intensitiesSampleFilePath,'r');

%Read the file type of intesnsities sample file: TextGrid 
intensitiesFileTypeLine=1;
line=0;
while~feof(b)
    intensitiesFileList=fgetl(b);
    line=line+1;
    if line==intensitiesFileTypeLine;
       intensitiesFileType=intensitiesFileList;
    end
end

audioTimeSize=intensitiesSampleFileData(2);
intensitiesSampleSize=intensitiesSampleFileData(3);
intensitiesSamplePeriod=intensitiesSampleFileData(4);
intensitiesSampleStartTime=intensitiesSampleFileData(5);

%Get the size of intensityReponseTime and intensitiesValue
[intensityReponseTimeSize intensitiesValueSize]=size(intensitiesSampleFileData);
set(gca,'XDir','reverse');

%Get the value of intensityReponseTime and intensities
intensitiesValue=intensitiesSampleFileData(11:intensityReponseTimeSize,1);
N=0:1:intensitiesSampleSize-1;
intensityReponseTime=(intensitiesSamplePeriod*N)+intensitiesSampleStartTime;
intensityReponseTime=intensityReponseTime';

end