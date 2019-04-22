close all; clear all; clc;

%wej�cia do sieci z min i max warto�ciami 
minmax=[0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 
    0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1];

%ilo�� wyj�� z sieci 
ilosc_wyj = 64;

%u�ycie funkcji tworz�cej sie�
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

%zmienna zawieraj�ca 1 gdy trafimy w emotikon i 0 gdy chybimy 
output = [ 1 0 0 0   %smile
           0 1 0 0   %shock
           0 0 1 0   %confuse
           0 0 0 1]; %sad  

%parametry regu�y Hebba
lp.dr = 0.5; %wsp. zapominania
lp.lr = 0.5; %wsp. uczenia

%u�ycie regu�y Hebba
hebb = learnh( [], input, [], [], output, [], [], [], [], [], lp, []);
heb=hebb';

net.trainParam.epochs = 1000;
net.trainParam.goal = 0.01;

%trenowanie sieci z u�yciem regu�y Hebba 
net = train(net, input, heb);
       
       
%DANE TESTUJACE
smile = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 0 0 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
shock = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
confuse = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 1 1 1 1 0 1; 1 0 0 1 1 0 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];
sad = [ 0 0 1 1 1 1 0 0; 0 1 0 0 0 0 1 0; 1 0 1 0 0 1 0 1; 1 0 0 0 0 0 0 1; 1 0 0 1 1 0 0 1; 1 0 1 0 0 1 0 1; 0 1 0 0 0 0 1 0; 0 0 1 1 1 1 0 0];

%sprawdzenie poprawno�ci wytrenowanej sieci 
test = sim(net, smile);
test1 = sim(net, shock);
test2 = sim(net, confuse);
test3 = sim(net, sad);

%wypisanie warto�ci 
disp('SMILE ='), disp(test(1));
disp('SHOCK ='), disp(test1(1));
disp('CONFUSE ='), disp(test2(1));
disp('SAD ='), disp(test3(1));


 