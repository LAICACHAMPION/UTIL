clear all;
close all;
D1=csvread('dcsweep_ca_c1.csv');
D2=csvread('dcsweep_ca_c2.csv');
D3=csvread('dcsweep_ca_c3.csv');
D1=D1(:,2:3);
D2=D2(:,2:3);
D3=D3(:,2:3);
hold on
plot(D1(:,1),D1(:,2),'-o')
plot(D2(:,1),D2(:,2),'-o')
plot(D3(:,1),D3(:,2),'-o')
formataxes('', 'Tensi\''on de entrada (V)','Tensi\''on de salida (V)', ... % titulo y ejes
                    'Caso-1','Caso-2','Caso-3')% legends
hold off