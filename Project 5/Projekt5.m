close all; clear all; clc;

%Tablica input[] zawiera warto�ci identyfikuj�ce rodzaj kwiatu.
%Kolumna I-d�ugosc dzia�ki kielicha; Kolumna II-szerokosc dzia�ki kielicha
%Kolumna III-d�ugosc p�atka kwiatu; Kolumna IV-szerokosc p�atka kwiatu
input=iris_dataset;

plot(input(1, :) ,input(2, :), 'k.', input(3, :), input(4, :), 'b.');
legend('dzia�ki kielicha', 'p�atki kwiatu');

hold on; 
grid on; 

dimensions = [10 10]; % wymiary wektora  
coverstep = 50; %etapy szkolenia 
initNeighbor = 0; % wej�ciowy rozmiar s�siedztwa
topologyFcn = 'hextop'; %dane przyjmuja ksztalt szescianow
distanceFcn = 'dist'; %funkcja dystansu neuron�w 

%STWORZENIE SIECI SAMOORGANIZUJACEJ
net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); 

net.trainParam.epochs = 500;
net.trainParam.lr = 0.7; %wsp�czynnik uczenia

%TRENING SIECI
[net, tr] = train(net, input); %trening sieci
y = net(input); %testowanie i zapis wynik�w osi�gni�tych przez sie�