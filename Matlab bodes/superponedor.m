function [  ] = superponedor( titulo,medicion, simulacion,H,w,guardar)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

c_m=csvread(medicion);
c_s=csvread(simulacion);
[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
phase=squeeze(phase);
wout=squeeze(wout);
wout=wout./(2*pi);
mag=20*log10(mag);
magMedida=20*log10(c_m(:,3)./c_m(:,2));

maginitud=figure('Name','Bode magitud','NumberTitle','off');

semilogx(c_m(:,1).*1000,magMedida,'-o');
hold on;
semilogx(wout,mag,'LineWidth',3);
semilogx(c_s(:,1),c_s(:,2),'LineWidth',2);
formataxes(titulo, 'Frecuencia (Hz)', 'Mangnitud (dB)', ... % titulo y ejes
                    'Medici\''on','Simulaci\''on ','C\''alculo')% legends
%title(titulo);
%xlabel('Frecuencia (Hz)');
%ylabel('Magnitud (dB)');
%legend('Medición','Calculo','Simulación');
if guardar=='save'
saveas(maginitud,strcat(titulo,'_mag','.png'));
end
grid on;
hold off;

fase=figure('Name','Bode fase','NumberTitle','off');

semilogx(c_m(:,1).*1000,c_m(:,4),'-o');
hold on;
semilogx(wout,phase,'LineWidth',3);
semilogx(c_s(:,1),c_s(:,3),'LineWidth',2);
%title(titulo);
grid on;
%ylabel('Fase (°)');
%xlabel('Frecuencia (Hz)');
%legend('Medición','Calculo','Simulación');
formataxes(titulo, 'Frecuencia (Hz)','Fase (°)', ... % titulo y ejes
                    'Medici\''on','Simulaci\''on ','C\''alculo')% legends
if guardar=='save'
saveas(fase,strcat(titulo,'_fase','.png'));
end
hold off;
end

