close all; clear all; clc;

net = newp([0 1; 0 1], 1);           %macierz 1x1, sie� o jednym neuronie, 
p_q = [0 0 1 1; 0 1 0 1];            %warto�ci pocz�tkowe p i q                    
p_or_q = [0 1 1 1];                  %warto�ci ko�cowe bramki logicznej OR
net = configure(net,p_q,p_or_q);     %dobiera jak najlepsze dane wej�ciowe i docelowe 
plotpv(p_q, p_or_q);                 %tworzenie wykresu z wynikami 

%wsp�czynniki uczenia
net.trainParam.epochs = 20;          %max ilo�� epok do wytrenowania 
net.trainParam.goal = 0.01;          %osiagniecie celu
net.trainParam.mu = 0.001;           %blad sredniokwadratowy 

przed = sim(net, p_q);               %symulacja danych przed nauczeniem 
net = train(net,p_q,p_or_q);         %procedura uczenia perceptronu 
plotpc(net.iw{1,1}, net.b{1})        %rysuje granice decyzyjn�
%iw - warto�ci wag synaptycznych
%b - warto�� progu perceptronu

test = randi([0 1],2,randi(5));      %wylosowanie macierzy 2xN wypelnionej 0 i 1
efekt=sim(net, test);                %testowanie perceptronu

test
efekt

