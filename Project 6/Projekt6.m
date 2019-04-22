close all; clear all; clc;

%WYGENEROWANE LITERY W KOLUMNOWEJ REPREZENTACJI

       % A B C D E F G H I J K L M N O P R S T U
input = [0 1 0 1 1 1 0 1 1 1 1 1 1 1 0 1 1 0 1 1;
         1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
         1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
         0 0 0 0 1 1 0 1 0 1 1 0 1 1 0 0 0 0 0 1;         
         1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1;
         0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0;
         0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0;
         1 1 1 1 0 0 0 1 0 1 0 0 1 1 1 1 1 0 0 1;
         1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 0 0 1;
         1 1 0 0 1 1 0 1 1 0 1 0 0 1 0 1 1 1 1 0;
         1 1 0 0 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0;
         1 0 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 0 0 1;       
         1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 0 1;
         0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0;
         1 1 1 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1 0 1;
         1 1 0 1 1 1 0 1 1 0 1 1 1 1 0 1 1 0 0 0;
         0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1;
         0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1;
         1 0 0 0 1 0 0 1 0 1 1 1 1 1 0 0 1 0 0 0];
     
dimensions = [10 10]; % wymiary wektora  
coverstep = 50; %etapy szkolenia 
initNeighbor = 3; % wej�ciowy rozmiar s�siedztwa
topologyFcn = 'hextop'; %dane przyjmuja ksztalt szescianow
distanceFcn = 'dist'; %funkcja dystansu neuron�w 

% TWORZENIE SIECI KOHONENA 
net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn);

% USTALENIE WSPӣCZYNNIK�W
net.trainParam.epochs = 500;   % maksymalna liczba epok treningowych 
net.trainParam.lr = 0.5; %wsp�czynnik uczenia

%TRENING SIECI
[net, tr] = train(net, input); %trening sieci
y = net(input); %testowanie i zapis wynik�w osi�gni�tych przez sie�