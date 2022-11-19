clc;
clear;

% Use sinusoid frequency f = 300 Hz
f = [7200,7600,7800,7900];
%
% Sampling frequency and interval
fs = 8000;
Ts = 1/fs;
%
% Set time duration of plot, i.e., 10 msec.
tfinalplot = 10e-3;
%
% Make the time vector for the plot
nplot=0:Ts:tfinalplot;
%
% Make the time vector for replayed sound spurt
% Play the spurt for 2 seconds
tfinal = 2;
nsound=0:Ts:tfinal;
%


set(gcf, 'Position',  [400, 140, 1200, 800]);
%
C = [];
% Make the plot
for i = 1:4
    % Sample the sinusoid.
    xnT = sin(2*pi*f(1,i)*nsound);
    subplot(2,2,i);
    plot(nplot, xnT(1:length(nplot)));
    title("Subplot"+i+ ":"+" "+f(1,i)+"Hz");
    C = cat(2,C,xnT);
    audiowrite(string(f(1,i))+' Hz.wav', xnT, fs);
end

audiowrite('Q3concatenate Hz.wav', C, fs);




%
% Save xnT as a wav sound file, soundfile.wav.
% 
%
% Uncomment/edit this next line to save the graph.
% exportgraphics(gcf, ’filename_you_want.jpg’);
%