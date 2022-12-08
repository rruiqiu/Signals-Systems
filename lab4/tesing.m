clc;
clear;
% Read in the signal from the audio file
[signal, Fs] = audioread("tones2022.wav");
L = length(signal);
T = 1/Fs;
t = (0:L-1)*T;

% Plot the signal for t_plot msec
t_plot = 5;
msec_per_sec = 1000;
numSamples = t_plot*Fs/msec_per_sec;
plot(msec_per_sec*t(1:numSamples), signal(1:numSamples))
title('Plot of Input Signal')
xlabel('time (milliseconds)')
grid('minor');

f = Fs*(0:(L/2))/L;
Y = fft(signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

plot(f,P1) 
title("Single-Sided Amplitude Spectrum of S(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")