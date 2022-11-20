clc;
clear;
f = 100; %f1
u=2000;    %miu
fs = 16000; %sampling frequency
Ts = 1/fs;
% Make the time vector for the 2000 samples plot
nplot=0:Ts:Ts*1999;
% Make the time vector for replayed sound spurt
% Play the spurt for 8 seconds
tfinal = 8;
nsound=0:Ts:tfinal;
%sample the chirp signal
cT = cos(pi*u*(nsound.^2)+2*pi*f*nsound);
% Make the plot
plot(nplot, cT(1:length(nplot)));
ylabel("c(t)");
xlabel("t");
title("Rui Qiu, Shaba Rahman, 16KHz");
% Save xnT as a wav sound file, soundfile.wav.
audiowrite('16khzchirpsoundfile.wav', cT, fs);
exportgraphics(gcf, '16khzchirpsoundfile.jpg');
%