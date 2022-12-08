[signal, Fs] = audioread("SecretMessage2022.wav");
L = length(signal);
T = 1/Fs;
t = (0:L-1)*T;

% Plot the signal for t_plot msec
t_plot = 20;
msec_per_sec = 1000;
numSamples = t_plot*Fs/msec_per_sec;
plot(msec_per_sec*t(1:numSamples), signal(1:numSamples))
title('Plot of Input Signal')
xlabel('time (milliseconds)')
grid('minor');