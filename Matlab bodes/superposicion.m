clear all;
close all;
A0=10e4; %%dato sacado del grafico
wp=2*pi*11.5; %%frecuencai da corte obtenida del datasheet
a=csvread('x10.csv');
medido=csvread('bode_ca_c1.txt');
freca=a(:,1).*1000;
gaina=20*log10(a(:,3)./a(:,2));


s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=20e3;
H=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
opt = bodeoptions();
w=[1:2:800000];
opt.FreqUnits = 'Hz';
[mag,phase,wout] =bode(H,w,opt);
mag=squeeze(mag);
phase=squeeze(phase);
wout=squeeze(wout);
mag=20*log10(mag);
frec=wout./(2*pi);





semilogx(freca,gaina,'-o');

hold on;
semilogx(frec,mag);
semilogx(medido(:,1),medido(:,2));

hold off;