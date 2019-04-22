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
initNeighbor = 3; % wejœciowy rozmiar s¹siedztwa
topologyFcn = 'hextop'; %dane przyjmuja ksztalt szescianow
distanceFcn = 'dist'; %funkcja dystansu neuronów 

% TWORZENIE SIECI KOHONENA 
net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn);

% USTALENIE WSPÓ£CZYNNIKÓW
net.trainParam.epochs = 500;   % maksymalna liczba epok treningowych 
net.trainParam.lr = 0.5; %wspó³czynnik uczenia

%TRENING SIECI
[net, tr] = train(net, input); %trening sieci
y = net(input); %testowanie i zapis wyników osi¹gniêtych przez sieæ