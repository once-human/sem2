close all;

Am= 5;
Ac= 5;
t= 0:0.001:2;
fm= 1;
fc= 10;
fs= 100*fc;

x= Am*sin(2*pi*fm*t);
y= Ac*cos(2*pi*fc*t);
z= x.*y;

subplot(3,2,1);
plot(x);
xlabel("time");
ylabel("Amplitude");
title("Modulating signal");
grid on;

subplot(3,2,2);
plot(y);
xlabel("time");
ylabel("Amplitude");
title("carrier signal");
grid on;

subplot(3,2,3);
plot(z);
xlabel("time");
ylabel("Amplitude");
title("DSB-SC signal");
grid on;

ld= length(z);
f = linspace(-fs/2, fs/2,ld);
DSB_SC= fftshift(fft(z,ld)/ld);

subplot(3,2,4);
plot(f, abs(DSB_SC));
xlim([-15,15]);
xlabel("frequency");
ylabel("Amplitude");
title("frequency spectrum of DSB-SC signal");
grid on;

bm= 2*z.*y;
bm1= bm/Ac;

nf= fm/fs;
[num,den]= butter(5,3*nf);
reconstructed= filter(num,den,bm1);

subplot(3,2,5);
plot(reconstructed);
xlabel("time");
ylabel("amplitude");
title("Reconstruction of original signal");
grid on;