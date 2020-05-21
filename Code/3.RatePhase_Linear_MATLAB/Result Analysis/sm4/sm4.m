clc; clear; close all;
sm4Solo=importdata('sm4.txt');

figure(1);
%sm4: points of original data (speechrate & speech timing)
plot(sm4Solo(:,1),sm4Solo(:,2),'x');
hold on
%sm4: the liner regresion result cpatured by "cftool"
PhraseSolo=-0.01035*sm4Solo(:,1)+0.6691 ;
plot(sm4Solo(:,1),PhraseSolo,'-','Linewidth',2);
grid on
title('Condition: solo');
legend('speechrate & phrase','linear sm4');
xlabel('Speach rate');
ylabel('Phrase timing');

sm144=importdata('sm144.txt');
sm244=importdata('sm244.txt');
sm344=importdata('sm344.txt');

figure(2);
hold on
%sm144: the liner regresion result cpatured by "cftool"
Phrase144=-0.02182*sm144(:,1)+ 0.6722 ;
plot(sm144(:,1),Phrase144,'-','Linewidth',2);

hold on
%sm244: the liner regresion result cpatured by "cftool"
Phrase244=-0.01424*sm244(:,1)+ 0.6723 ;
hold on
plot(sm244(:,1),Phrase244,'-','Linewidth',2);

hold on
%sm344: the liner regresion result cpatured by "cftool"
Phrase344=-0.03179*sm344(:,1)+0.6823  ;
plot(sm344(:,1),Phrase344,'-','Linewidth',2);

%sm144: points of original data (speechrate & speech timing)
plot(sm144(:,1),sm144(:,2),'x');
%sm244: points of original data (speechrate & speech timing)
plot(sm244(:,1),sm244(:,2),'x');
%sm344: points of original data (speechrate & speech timing)
plot(sm344(:,1),sm344(:,2),'x');

grid on
title('Condition: synchronous');
legend('linear sm144','linear sm244','linear sm344','sm144','sm244','sm344');
xlabel('Speach rate');
ylabel('Phrase timing');


