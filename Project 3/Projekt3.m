close all; clear all; clc;

%Dane wejœciowe i wyjœciowe
input = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2];
otput = [1.6633e+03 1.6800e+03 1.7329e+03 1.7820e+03 0 1.9484e+03 2.0655e+03 2.1782e+03 2.3262e+03];

test = zeros(1);

%Tworzenie sieci z warstwami ukrytymi
net = feedforwardnet(2);

%U¿ycie algorytmu wstecznej propagacji 
net.trainFcn = 'traingd';

%Dobranie wspó³czynników dla funkcji 
net.trainParam.lr = 0.01; %wsp. uczenia
net.trainParam.mc = 1; %bezwladnosc

%Trenowanie sieci
net = train(net, input, otput);

%Zapisanie wyniku do tablicy 
wynik = zeros(size(net));

%Wywo³anie funkcji Rastrigin dla liczb z przedzia³u [-2,2]
for i = 1:9
    test(i) = Rast3D(input(i)); %G³ówne wywo³anie funkcji
    wynik(i) = sim(net, input(i)); %Testowanie sieci
end    