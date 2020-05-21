%--------------------------------------------------------------------------
%   Title: PCentersEstimation
%   @brief: store the Pcenter and its intensity value in audio into matrix
%       Pcenters_IntensitiesValue 
%   @parameter: ReponseTime_IntensitiesValue: the matrix store the value of
%           intensities and the value of their response time
%       Pcenters_IntensitiesValue: the matrix store Pcenter of each beat
%           and its reponse intensity value
%   @method: repeating to compare each sample points with it adjancent
%           points to find all the bottom points and peak points in intensity
%           contour
%       Then using bottoms and peaks to get middle points, the time value
%           of each middle point is Pcenters
%--------------------------------------------------------------------------
function [Pcenters_IntensitiesValue]=Step3_PCentersEstimation_Version1(ReponseTime_IntensitiesValue)

intensitiesReponseTime=ReponseTime_IntensitiesValue(:,1);
intensitiesValue=ReponseTime_IntensitiesValue(:,2);

%3.1
%Get bottom point which is with mimimum intensity value in a hill and 
%   peak point which is with maiximum intensity value in this hill 
%Then find all the intensitiesSampleBottom and intensitiesSamplePeaks in the
%   intensity contour 
intensitiesSampleBottom_count=0;
intensitiesSamplePeak_count=0;
for i=2:length(intensitiesValue)-1
    if intensitiesValue(i)<intensitiesValue(i-1) && intensitiesValue(i)<intensitiesValue(i+1) 
        intensitiesSampleBottom_count=intensitiesSampleBottom_count+1;
        intensitiesSamplebottoms(intensitiesSampleBottom_count)=i;
    end
    if intensitiesValue(i)>intensitiesValue(i-1) && intensitiesValue(i)>intensitiesValue(i+1) 
        intensitiesSamplePeak_count=intensitiesSamplePeak_count+1;
        intensitiesSamplepeaks(intensitiesSamplePeak_count)=i;
    end    
end
%Slove the tail,balance the length of bottoms and peaks
    if intensitiesValue(1)<intensitiesValue(2)
        intensitiesSamplebottoms(intensitiesSampleBottom_count+1)=1;
    end
    if intensitiesValue(length(intensitiesValue))>intensitiesValue(length(intensitiesValue)-1)
        intensitiesSamplepeaks(intensitiesSamplePeak_count+1)=length(intensitiesValue);
    end 
intensitiesSampleBottoms=sort(intensitiesSamplebottoms);
intensitiesSamplePeaks=sort(intensitiesSamplepeaks);

%All the intensitiesSampleBottom and intensitiesSamplePeaks in the intensity contour 
intensitiesSampleBottom_Peak=[intensitiesSamplebottoms;intensitiesSamplepeaks];
[intensitiesSampleBottoms_size,intensitiesSamplePeaks_size]=size(intensitiesSampleBottom_Peak);

%3.2
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

%3.3
%Midpoints stores the values of Pcentes resposing intensity value
%   MidpointTime stores the values of Pcenters
Pcenters=MidpointTime';
IntensitiesValue=Midpoints';
Pcenters_IntensitiesValue=[Pcenters IntensitiesValue];

% save('Pcenters_IntensitiesValue.txt','Pcenters_IntensitiesValue','-ascii');
end



