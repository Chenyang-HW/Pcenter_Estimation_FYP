clc; clear; close all;
sm1Solo=importdata('sm1.txt');

figure(1);
%sm1: points of original data (speechrate & speech timing)
plot(sm1Solo(:,1),sm1Solo(:,2),'x');
hold on
%sm1: the liner regresion result cpatured by "cftool"
PhraseSolo=-0.05219*sm1Solo(:,1)+0.6671;
plot(sm1Solo(:,1),PhraseSolo,'-','Linewidth',2);
grid on
title('Condition: solo');
legend('speechrate & phrase','linear sm1');
xlabel('Speach rate');
ylabel('Phrase timing');

sm121=importdata('sm121.txt');
sm131=importdata('sm131.txt');
sm141=importdata('sm141.txt');

figure(2);
% plot(sm121(:,1),sm121(:,2),'x');
hold on
% sm121: the liner regresion result cpatured by "cftool"
Phrase121=-0.03324*sm121(:,1)+0.6552 ;
plot(sm121(:,1),Phrase121,'-','Linewidth',2);
hold on

% plot(sm131(:,1),sm131(:,2),'x');
hold on
%sm131 the liner regresion result cpatured by "cftool"
Phrase131=-0.01792*sm131(:,1)+0.6687 ;
hold on
plot(sm131(:,1),Phrase131,'-','Linewidth',2);
hold on

% plot(sm141(:,1),sm141(:,2),'x');
hold on
%sm141 the liner regresion result cpatured by "cftool"
Phrase141=-0.01262*sm141(:,1)+0.6685 ;
plot(sm141(:,1),Phrase141,'-','Linewidth',2);

%sm121: points of original data (speechrate & speech timing)
plot(sm121(:,1),sm121(:,2),'x');
%sm131: points of original data (speechrate & speech timing)
plot(sm131(:,1),sm131(:,2),'x');
%sm141: points of original data (speechrate & speech timing)
plot(sm141(:,1),sm141(:,2),'x');

grid on
title('Condition: synchronous');
legend('linear sm121','linear sm131','linear sm141','sm121','sm131','sm141');
xlabel('Speach rate');
ylabel('Phrase timing');


