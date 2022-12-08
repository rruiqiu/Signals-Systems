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


X = fft(signal);
Y = fftshift(X);
fshift = (-L/2:L/2-1)*(Fs/L); % zero-centered frequency range
P2 = 2.*abs(Y/L);

plot(fshift,P2);
xlabel("Frequency(Hz)");
ylabel("|Y(f)|");