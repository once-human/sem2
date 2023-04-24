clc;
Am=2; %Baseband Signal amplitude
Ac=2; %amplitude of carrier
fm=2; %Baseband signal frequency
fc=15; %Carrier Frequency
t=0:0.01:1; %Time axis
m= Am*sin(2*pi*fm*t); %Baseband Signal
subplot(321); %first diagram out of 3 rows 2 coloumn
plot(t,m,'r');
title('Baseband Signal');
xlabel('Time');
ylabel('Amplitude');
c=Ac*sin(2*pi*fc*t);
subplot(322); %second diagram out of 3 rows 2 coloumn
plot(t,c,'b');
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
kf=5; %frequency sensitivity
beta= (kf*Am)/fm; %Set the frequency modulation index value
s= Ac*cos(2*pi*fc*t - beta*cos(2*pi*fm*t));
%s= Ac*sin(2*pi*fc*t + kf*Am*sin(2*pi*fm*t));
subplot(323); %Second diagram out of 3 rows 2 coloumn
plot(t,s,'b');
title('Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
%Frequency Demodulation
k=diff(s);
d1=abs(k);
[b,a]= butter(3,0.136);
d=filter(b,a,d1);
c= Ac*cos(2*pi*fc*t);
subplot(322); %Second diagram out of 3 rows 2 coloumn
plot(t,c,'b');
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
kf= 5; %frequency sensitivity
beta = (kf*Am)/fm; %set the frequency modulation index value
s= Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));
%s= Ac*sin(2*pi*fc*t + kf*Am*sin(2*pi*fm*t));
subplot(323); %second diagram out of 3 rows and 2 coloumn
plot(t,s,'b');
title('Modulated signal');
xlabel('Time');
ylabel('Amplitude');
%frequency Demodulation
k= diff(s);
d1= abs(k);
[b,a]= butter(3,0.136);
d= filter(b,a,d1);
subplot(324); %second diagram out of 3 rows 2 coloumns
plot(d); 
title('Demodulated Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;