clc;
clear;

Fs=16000;
L = Fs * 10;
T = 1/Fs;
t = (0:L-1)*T;

freqs = [1000, 4000, 6000];
amps = [0.4, 0.2, 0.2];

%combine signals
y = sum(amps .* sin(2 * pi * freqs .* t'), 2)';

t_plot = 5;
msec_per_sec = 1000;
numSamples = t_plot*Fs/msec_per_sec;
plot(msec_per_sec*t(1:numSamples), y(1:numSamples))
title('Plot of Generated Signal')
xlabel('time (milliseconds)')
grid('minor');
