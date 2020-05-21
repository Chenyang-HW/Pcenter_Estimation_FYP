clc; clear; close all;
sm2Solo=importdata('sm2.txt');

figure(1);
%sm2: points of original data (speechrate & speech timing)
plot(sm2Solo(:,1),sm2Solo(:,2),'x');
hold on
%sm2: the liner regresion result cpatured by "cftool"
PhraseSolo=-0.02775*sm2Solo(:,1)+0.6718;
plot(sm2Solo(:,1),PhraseSolo,'-','Linewidth',2);
grid on
title('Condition: solo');
legend('speechrate & phrase','linear sm2');
xlabel('Speach rate');
ylabel('Phrase timing');

sm122=importdata('sm122.txt');
sm322=importdata('sm322.txt');
sm242=importdata('sm242.txt');

figure(2);
hold on
%sm122: the liner regresion result cpatured by "cftool"
Phrase122=-0.0133*sm122(:,1)+0.666 ;
plot(sm122(:,1),Phrase122,'-','Linewidth',2);

hold on
%sm322: the liner regresion result cpatured by "cftool"
Phrase322=-0.01546*sm322(:,1)+0.6448 ;
hold on
plot(sm322(:,1),Phrase322,'-','Linewidth',2);

hold on
%sm242: the liner regresion result cpatured by "cftool"
Phrase242=-0.0113*sm242(:,1)+0.6648 ;
plot(sm242(:,1),Phrase242,'-','Linewidth',2);

%sm122: points of original data (speechrate & speech timing)
plot(sm122(:,1),sm122(:,2),'x');
%sm322: points of original data (speechrate & speech timing)
plot(sm322(:,1),sm322(:,2),'x');
%sm242: points of original data (speechrate & speech timing)
plot(sm242(:,1),sm242(:,2),'x');

grid on
title('Condition: synchronous');
legend('linear sm122','linear sm322','linear sm242','sm122','sm322','sm242');
xlabel('Speach rate');
ylabel('Phrase timing');


