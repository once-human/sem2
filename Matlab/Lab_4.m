clc;
Am=1; % Baseband Signal Amplitude
fm=200; % Baseband Signal Frequency
fc=600; % Carrier Frequency
N=1024;
fs=2048; % Sample Frequency
ts=1/fs; % Sample Time
t=(0:N-1)/fs; % Time Axis
m = Am*cos(2*pi*fm*t); % Baseband signal
mh = Am*cos((2*pi*fm*t)-pi/2); % Hilbert Transform
subplot(321); % First Diagram
plot(t,m,'r');
title('Baseband Signal');
xlabel('Time');
ylabel('Amplitude');
c=cos(2*pi*fc*t);
subplot(322); % Second Diagram of 3 rows 2 columns
plot(t,c,'b');
title("Cosine signal");
xlabel('Time');
ylabel('Amplitude');
% Upper Sideband and Lower Sideband
sbu = m.*cos(2*pi*fc*t) - mh.*sin(2*pi*fc*t);
sbl = m.*cos(2*pi*fc*t) + mh.*sin(2*pi*fc*t);
SBU=2/N*abs(fft(sbu));
SBL=2/N*abs(fft(sbl));
freq = fs*(0:N/2)/N;
subplot(323); % Third Diagram of 3 rows 2 columns
plot(t,sbu,'r');
title('USB');
xlabel('Time');
ylabel('Amplitude');
subplot(324); % Fourth Diagram of 3 rows 2 columns
plot(t,sbl,'b');
title('LSB');
xlabel('Time');
ylabel("Amplitude");
subplot(325); % Fifth Diagram of 3 rows 2 columns
plot(freq,SBU(1:N/2+1), freq, SBL (1:N/2+1));
title('Frequency Domain Represntation');
xlabel('Frequency (Hz)');
ylabel('Spectral Magnitude');
legend('USB','LSB');
grid on;
md = sbu.*cos(2*pi*fc*t);
[b,a]=butter(2,0.5);
mf=filter (b,a,md);
subplot(326); % Sixth Diagram of 3 rows 2 columns
plot(t,mf);
title('Demodulated signal');
xlabel('Time');
ylabel("Demodulated Signal")