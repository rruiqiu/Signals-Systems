clear
clc

[signal, Fs] = audioread('my_speech_clip.wav'); %signal is a column vector, Fs is sampling rate
L = length(signal);  % Number of samples in the signal.
T = 1/Fs;            % Sampling period in seconds.
t = (0:L-1)*T;       % Time vector in seconds.


Te = 0.08;           %echo delayed in msec
amp = 0.5;          % amplitude
Ne = 3;

for i = 1:Ne

    delayed_space=round(i * Te*Fs);   % Delayed sample spaces
    disp(delayed_space);
    h = zeros(1,delayed_space+1);    % create the spaces of the extra delayed samples
    h(delayed_space+1) = amp.^i;        % set the Impulse Response of the delayed signal for convolution with the amplitude
    delayed_signal = conv(signal,h);      % Convolution of the origional signal and the delayed impulse response
    
    if i == 1
        signal_newspace = [signal;zeros(delayed_space,1)];
    else
        signal_newspace = zeros(length(delayed_signal),1); % create the same length vector space as the delayed signal
        signal_newspace(1:length(signal_reverberation)) = signal_reverberation; % padding the original signal into the new space
    end
    signal_reverberation = delayed_signal + signal_newspace;
end

audiowrite('Q7.wav', signal_reverberation, Fs);