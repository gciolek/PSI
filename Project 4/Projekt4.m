close all; clear all; clc;

%wejœcia do sieci z min i max wartoœciami 
minmax=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1];

%iloœæ wyjœæ z sieci 
ilosc_wyj = 64;

%u¿ycie funkcji tworz¹cej sieæ
net = newff(minmax, ilosc_wyj,{'tansig'}, 'trainlm', 'learnh');

%kolumnowe wprowadzenie emotikon w formie 0-1
%        smile/shock/confuse/sad
input  = [ 0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           1 1 1 1;
           1 1 1 1;
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0; 
           0 0 0 0; 
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           1 1 1 1; 
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           1 1 1 1; 
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           1 1 1 1; 
           0 0 0 0; 
           1 0 1 0;
           0 1 1 1;
           0 1 1 1;
           1 0 1 0;
           0 0 0 0;
           1 1 1 1;
           1 1 1 1;
           0 0 0 0;
           0 0 0 1;
           1 1 0 0; 
           1 1 0 0;
           0 0 0 1;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           0 0 0 0;
           1 1 1 1;
           1 1 1 1;
           1 1 1 1;
           1 1 1 1;
           0 0 0 0;
           0 0 0 0;
           ];

%zmienna zawieraj¹ca 1 gdy trafimy w emotikon i 0 gdy chybimy 
output = [ 1 0 0 0   %smile
           0 1 0 0   %shock
           0 0 1 0   %confuse
           0 0 0 1]; %sad  

%parametry regu³y Hebba
lp.dr = 0.5; %wsp. zapominania
lp.lr = 0.5; %wsp. uczenia

%u¿ycie regu³y Hebba
hebb = learnh( [], input, [], [], output, [], [], [], [], [], lp, []);
heb=hebb';

net.trainParam.epochs = 1000;
net.trainParam.goal = 0.01;

%trenowanie sieci z u¿yciem regu³y Hebba 
net = train(net, input, heb);
       
       
%DANE TESTUJACE
smile = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 0 0 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
shock = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
confuse = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 1 1 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
sad = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 1 0 0 1 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];

%sprawdzenie poprawnoœci wytrenowanej sieci 
test = sim(net, smile);
test1 = sim(net, shock);
test2 = sim(net, confuse);
test3 = sim(net, sad);

%wypisanie wartoœci 
disp('SMILE ='), disp(test(1));
disp('SHOCK ='), disp(test1(1));
disp('CONFUSE ='), disp(test2(1));
disp('SAD ='), disp(test3(1));


 