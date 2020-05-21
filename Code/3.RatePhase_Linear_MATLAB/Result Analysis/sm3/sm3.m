clc; clear; close all;
sm3Solo=importdata('sm3.txt');

figure(1);
%sm3: points of original data (speechrate & speech timing)
plot(sm3Solo(:,1),sm3Solo(:,2),'x');
hold on
%sm3: the liner regresion result cpatured by "cftool"
PhraseSolo=-0.03081*sm3Solo(:,1)+0.6907 ;
plot(sm3Solo(:,1),PhraseSolo,'-','Linewidth',2);
grid on
title('Condition: solo');
legend('speechrate & phrase','linear sm3');
xlabel('Speach rate');
ylabel('Phrase timing');

sm133=importdata('sm133.txt');
sm323=importdata('sm323.txt');
sm343=importdata('sm343.txt');

figure(2);
hold on
%sm133: the liner regresion result cpatured by "cftool"
Phrase133=-0.01744*sm133(:,1)+ 0.6818 ;
plot(sm133(:,1),Phrase133,'-','Linewidth',2);

hold on
%sm323: the liner regresion result cpatured by "cftool"
Phrase323=-0.01508*sm323(:,1)+ 0.6745 ;
hold on
plot(sm323(:,1),Phrase323,'-','Linewidth',2);

hold on
%sm343: the liner regresion result cpatured by "cftool"
Phrase343=-0.01025*sm343(:,1)+0.6733 ;
plot(sm343(:,1),Phrase343,'-','Linewidth',2);

%sm133: points of original data (speechrate & speech timing)
plot(sm133(:,1),sm133(:,2),'x');
%sm323: points of original data (speechrate & speech timing)
plot(sm323(:,1),sm323(:,2),'x');
%sm343: points of original data (speechrate & speech timing)
plot(sm343(:,1),sm343(:,2),'x');

grid on
title('Condition: synchronous');
legend('linear sm133','linear sm323','linear sm343','sm133','sm323','sm343');
xlabel('Speach rate');
ylabel('Phrase timing');


