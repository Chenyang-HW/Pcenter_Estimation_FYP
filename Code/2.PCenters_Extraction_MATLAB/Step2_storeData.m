%--------------------------------------------------------------------------
%   Title: storeData
%   @brief: store intensities sample point into 2-dimention matrix
%   @parameter: matrixFileOutputPath:intensity smaple point matrix path
%       ReponseTime_IntensitiesValue: the matrix store the value of
%           intensities and the value of their response time
%--------------------------------------------------------------------------
function Step2_storeData(matrixFileOutputPath,intensitiesReponseTime,intensitiesValue)

%Import data in text file into ReponseTime_IntensitiesValue
fileID=fopen(matrixFileOutputPath,'w');
ReponseTime_IntensitiesValue=[intensitiesReponseTime intensitiesValue];
[rowsize,columsize]=size(ReponseTime_IntensitiesValue);
for row=1:1:rowsize
    for colum=1:1:columsize
        fprintf(fileID,'%2.15f\t',ReponseTime_IntensitiesValue(row,colum));
    end
    fprintf(fileID,'\r\n');
end
fclose(fileID);
end