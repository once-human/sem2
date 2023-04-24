clc;
close all;
Am= 1; %amplitude of Modulating Signal
Ac= 2; %amplitude of Carrier Signal
fm= 1; %fm<fc Modulating frequency
fc=10; %Carrier Frequency
fs=100*fc;
m=1; %Modulation Index(M=1)
t= 0:0.001:2; %time axis
x= Am*sin(2*pi*fm*t); %message signal
subplot(3,2,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;
y= Ac*cos(2*pi*fc*t); %carrier signal
subplot(3,2,2)
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;
am_modulated= (1+m*x).*y;
subplot(3,2,3);
plot(t,am_modulated);
plot(t,am_modulated,'r');
xlabel('Time');
ylabel('Amplitude');
title('Modulated signal');
grid on;
demodulated= abs(am_modulated);
subplot(3,2,4);
plot(t,demodulated);
plot(t, demodulated,'k');
xlabel('Time');
ylabel('Amplitude');
title('Demodulated Signal');
grid on;
nf= fm/fs;
[a,b]= butter(3,3*nf);
z= filter(a,b,demodulated);
subplot(3,2,5);
plot(t,z);
plot(t,z,'k');
xlabel('Time');
ylabel('Amplitude');
title('Recovered signal');
grid on;