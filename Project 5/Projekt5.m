close all; clear all; clc;

%Tablica input[] zawiera wartoœci identyfikuj¹ce rodzaj kwiatu.
%Kolumna I-d³ugosc dzia³ki kielicha; Kolumna II-szerokosc dzia³ki kielicha
%Kolumna III-d³ugosc p³atka kwiatu; Kolumna IV-szerokosc p³atka kwiatu
input=iris_dataset;

plot(input(1, :) ,input(2, :), 'k.', input(3, :), input(4, :), 'b.');
legend('dzia³ki kielicha', 'p³atki kwiatu');

hold on; 
grid on; 

dimensions = [10 10]; % wymiary wektora  
coverstep = 50; %etapy szkolenia 
initNeighbor = 0; % wejœciowy rozmiar s¹siedztwa
topologyFcn = 'hextop'; %dane przyjmuja ksztalt szescianow
distanceFcn = 'dist'; %funkcja dystansu neuronów 

%STWORZENIE SIECI SAMOORGANIZUJACEJ
net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); 

net.trainParam.epochs = 500;
net.trainParam.lr = 0.7; %wspó³czynnik uczenia

%TRENING SIECI
[net, tr] = train(net, input); %trening sieci
y = net(input); %testowanie i zapis wyników osi¹gniêtych przez sieæ