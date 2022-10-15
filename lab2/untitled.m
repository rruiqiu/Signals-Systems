clear
clc


[signal, Fs] = audioread('my_speech_clip.wav'); %signal is a column vector, Fs is sampling rate

delay = 0.09; 
dt = 1/Fs;
 % Calculate the number of points for the given delay
N = round(delay/dt);
 % Pad the original signal with zeros to make room for the echo
s1 = [signal; zeros(N, 1)];