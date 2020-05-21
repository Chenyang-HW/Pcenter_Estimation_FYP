function [ReponseTime_IntensitiesValue]=Step3_dataCleanbyTimeStamp_Version3(ReponseTime_IntensitiesValue,timeStampofRestWordFilePath)

timeStampofRestWord=importdata(timeStampofRestWordFilePath);
firstwordStartTime=timeStampofRestWord(1,1);
timeStampofRestWord(1,:)=[];
%Clean the data
for removedDataLine=1:length(timeStampofRestWord(:,1))
    for cleantDataLine=1:length(ReponseTime_IntensitiesValue(:,1))
        if( ReponseTime_IntensitiesValue(cleantDataLine,1)>=timeStampofRestWord(removedDataLine,1)...
                &&ReponseTime_IntensitiesValue(cleantDataLine,1)<=timeStampofRestWord(removedDataLine,2))
            ReponseTime_IntensitiesValue(cleantDataLine,:)=0;
        end
    end
end
for cleantDataLine=1:length(ReponseTime_IntensitiesValue(:,1))
    if( ReponseTime_IntensitiesValue(cleantDataLine,1)<firstwordStartTime)
            ReponseTime_IntensitiesValue(cleantDataLine,:)=0;
        end
end
ReponseTime_IntensitiesValue(ReponseTime_IntensitiesValue(:,1)==0,:)=[];
