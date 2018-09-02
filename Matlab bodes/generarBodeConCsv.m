close all;
clear all;
datos=csvread('bode.csv');
ganancia=datos(:,3)./datos(:,2);
ganancia=20*log10(ganancia);
fase=datos(:,4);
frecuencia=datos(:,1);

figure;

subplot(2,1,1);
semilogx(frecuencia,ganancia)
hold on;
grid on;
xlabel('Frecuencia (KHz)');
ylabel('Ganancia (dB)');





subplot(2,1,2);
semilogx(frecuencia,fase)
grid on;
xlabel('Frecuencia (KHz)');
ylabel('Fase');

set(gca,'ytick',-90:45:0);
