function [timeStampofRestWordFilePath]=Step3_getTimeStamp_Version3(word_TimeStampIBMFilePath)

timeStampofRestWordFilePath='timeStampofRestWord.txt_Step3_Version3.txt';
%ExtractNumber from the text file
timeStampofRestWordFromLine=3;
timeStampofRestWoedToLine=5;
distance=12;
%extract the whole information in text
timeStampofRestWord=textscan(fopen(word_TimeStampIBMFilePath),'%s');
word_TimeStampIBMFile_From=timeStampofRestWord{1,1}(timeStampofRestWordFromLine:distance:length(timeStampofRestWord{1,1}(:,1)),1);
word_TimeStampIBMFile_To=timeStampofRestWord{1,1}(timeStampofRestWoedToLine:distance:length(timeStampofRestWord{1,1}(:,1)),1);
for line=1:1:(length(timeStampofRestWord{1,1}(:,1))/12)
    timeStampofRestWord(line,1)=word_TimeStampIBMFile_From(line);
    timeStampofRestWord(line,2)=word_TimeStampIBMFile_To(line);
end

fileID_W=fopen(timeStampofRestWordFilePath,'wt');
[rowLength columLength]=size(timeStampofRestWord);
for  row=1:rowLength
    fprintf(fileID_W,'%s\t%s\n',timeStampofRestWord{row,:});
end
fclose(fileID_W);

end

