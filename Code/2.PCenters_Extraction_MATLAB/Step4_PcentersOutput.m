%--------------------------------------------------------------------------
%   Title: PcentersOutput
%   @brief: output the Pcenters in Step3 and store them into text file, the
%       format of the file is as TextFile
%   @parameter: Pcenters_IntensitiesValue: the matrix store Pcenter of each 
%       beat and its reponse intensity value
%       PcentersFileOutputPath: the file path for Pcenters output
%--------------------------------------------------------------------------
function Step4_PcentersOutput(intensitiesFileType,audioTimeSize,Pcenters_IntensitiesValue,PcentersFileOutputPath);

[PcentersSize,IntensitiesValueSize]=size(Pcenters_IntensitiesValue);

%FileSize equals 12 parameter setting line and 1 total line stroing the
%   Pcenters and its  marked "B"
PcentersFileSize=12+1;
fileID=fopen(PcentersFileOutputPath,'wt');

%Print the Pcenters into PcentersFileOutput file, its format in TestGrid
for i=1:PcentersFileSize
    if i==1
        fprintf(fileID,intensitiesFileType);
    elseif i==2
        fprintf(fileID,'\nObject class = "TextGrid"\n');
    elseif i==3
        fprintf(fileID,'\n');
    elseif i==4
        fprintf(fileID,'0\n');
    elseif i==5
        fprintf(fileID,'%0.14g\n',audioTimeSize);
    elseif i==6
        fprintf(fileID,'<exists>\n');
    elseif i==7
        fprintf(fileID,'1\n');
    elseif i==8
        fprintf(fileID,'"TextTier"\n');
    elseif i==9
        fprintf(fileID,'"Beats"\n');
    elseif i==10
        fprintf(fileID,'0\n');
    elseif i==11
        fprintf(fileID,'%0.14g\n',audioTimeSize);
    elseif i==12
        fprintf(fileID,'%d\n',PcentersSize);
    elseif i>=13 
    fprintf(fileID,'%0.14g\n"B"\n',Pcenters_IntensitiesValue(:,1));
    end
end
fclose(fileID);
end