%--------------------------------------------------------------------------
%   Title: PCentersEstimation
%   @brief: store the Pcenter and its intensity value in audio into matrix
%       Pcenters_IntensitiesValue 
%   @parameter: ReponseTime_IntensitiesValue: the matrix store the value of
%           intensities and the value of their response time
%       Pcenters_IntensitiesValue: the matrix store Pcenter of each beat
%           and its reponse intensity value
%   @method: Use Timestamp of the word 'in','the'and 'of' to clean the
%           matrix ReponseTime_IntensitiesValue (intensity contour)
%       use findpeaks() function to find bottoms and peaks in intensity
%           contour
%       Then using bottoms and peaks to get middle points, the time value
%           of each middle point is Pcenters
%--------------------------------------------------------------------------
function [Pcenters_IntensitiesValue]=Step3_PCentersEstimation_Version3(...
    ReponseTime_IntensitiesValue,word_TimeStampIBMFilePath)

%3.1
%clean the intensities sample
%--------------------------------------------------------------------------
%Use Timestamp of the word 'in','the'and 'of' to clean the data int matrix 
%   ReponseTime_IntensitiesValue (intensity contour)
%--------------------------------------------------------------------------
%   Title: getTimeStamp
%   @brief: extract the timestamp of word 'in','the'and 'of' from file ,
%   output is a textfile called timeStampofRestWordFilePath
%--------------------------------------------------------------------------
[timeStampofRestWordFilePath]=Step3_getTimeStamp_Version3(...
    word_TimeStampIBMFilePath);
%--------------------------------------------------------------------------
%   Title: dataCleanbyTimeStamp
%   @brief: remove the point in ReponseTime_IntensitiesValue matrix whose 
%       time in the the timestamp of word 'in','the'and 'of' ,output is 
%       a new ReponseTime_IntensitiesValue matrix
%--------------------------------------------------------------------------
[ReponseTime_IntensitiesValue]=Step3_dataCleanbyTimeStamp_Version3(...
    ReponseTime_IntensitiesValue,timeStampofRestWordFilePath);

intensitiesReponseTime=ReponseTime_IntensitiesValue(:,1);
intensitiesValue=ReponseTime_IntensitiesValue(:,2);

%3.2
% Find all the intensitiesSampleBottom and intensitiesSamplePeaks in the
%   intensity contour 
[intensitiesSamplePeaks intensitiesSamplePeak_locations]=findpeaks(intensitiesValue);
[intensitiesSampleBottoms intensitiesSampleBottoms_locations]=findpeaks(-intensitiesValue);
intensitiesSampleBottoms=abs(intensitiesSampleBottoms);

%slove the tail,balance the length of bottoms and peaks
    if intensitiesValue(1)<intensitiesValue(2)
        intensitiesSampleBottoms_locations(length(intensitiesSampleBottoms_locations)+1)=1;
        intensitiesSampleBottoms(intensitiesSampleBottoms_locations)=intensitiesValue(1);
    end
    if intensitiesValue(length(intensitiesValue))>intensitiesValue(length(intensitiesValue)-1)
        intensitiesSamplePeak_locations(length(intensitiesSamplePeak_locations)+1)=length(intensitiesValue);
        intensitiesSamplePeaks(length(intensitiesSamplePeak_locations))=intensitiesValue(length(intensitiesValue));
    end 
intensitiesSampleBottoms_locations=sort(intensitiesSampleBottoms_locations);
intensitiesSamplePeak_locations=sort(intensitiesSamplePeak_locations);

%All the intensitiesSampleBottom and intensitiesSamplePeaks in the intensity contour 
intensitiesSampleBottom_Peak=[intensitiesSampleBottoms_locations';intensitiesSamplePeak_locations'];
[intensitiesSampleBottoms_size,intensitiesSamplePeaks_size]=size(intensitiesSampleBottom_Peak);

%3.3
%Get midddle point which is with middle intensity value in incresing part of 
%   a hill according to intensitiesSampleBottom and intensitiesSamplePeaks
%Then find all the Midpoints and their response time MidpointTime
for i=1:intensitiesSamplePeaks_size
    MidIntensity(i)=(intensitiesValue(intensitiesSampleBottom_Peak(1,i))+intensitiesValue(intensitiesSampleBottom_Peak(2,i)))/2;
end
for i=1:intensitiesSamplePeaks_size
    distance_count=[];%conut the distance between the mid point from bottom to top
    for j=intensitiesSampleBottom_Peak(1,i):intensitiesSampleBottom_Peak(2,i)
        distance_count(j-intensitiesSampleBottom_Peak(1,i)+1)=abs(intensitiesValue(j)-MidIntensity(i));
    end
    [distance,mid_num]=min(distance_count);
    Mid_points(i)=intensitiesSampleBottom_Peak(1,i)+mid_num;
end

for i=1:length(Mid_points)
    MidpointTime(i)=intensitiesReponseTime(Mid_points(i));
    Midpoints(i)=intensitiesValue(Mid_points(i));
end

%3.4
%Midpoints stores the values of Pcentes resposing intensity value
%   MidpointTime stores the values of Pcenters
Pcenters=MidpointTime';
IntensitiesValue=Midpoints';
Pcenters_IntensitiesValue=[Pcenters IntensitiesValue];

% save('result.txt','Pcenters','-ascii');
end