clear
clc

[signal, Fs] = audioread('my_speech_clip.wav'); %signal is a column vector, Fs is sampling rate
% L = length(signal);  % Number of samples in the signal.
% T = 1/Fs;            % Sampling period in seconds.
% t = (0:L-1)*T;       % Time vector in seconds.


Te = 0.8;              % echo delayed in sec
delayed_space=Te*Fs;   % Delayed sample spaces


amp = 0.4;               % amplitude
% delayes_space + 1 is to match the correct timing convolution
h = zeros(1,delayed_space+1);    % create the spaces of the extra delayed samples
h(delayed_space+1) = amp;        % set the Impulse Response of the delayed signal for convolution with the amplitude
dealyed_signal = conv(signal,h);      % Convolution of the origional signal and the delayed impulse response


signal_newspace = zeros(length(dealyed_signal),1); % create the same length vector space as the delayed signal
signal_newspace(1:length(signal)) = signal; % padding the original signal into the new space

signalplusecho = signal_newspace + dealyed_signal; % adding both signals

audiowrite('Q5.wav', signalplusecho, Fs);