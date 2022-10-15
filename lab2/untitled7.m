clear
clc

[signal, Fs] = audioread('my_speech_clip.wav'); %signal is a column vector, Fs is sampling rate
L = length(signal);  % Number of samples in the signal.
T = 1/Fs;            % Sampling period in seconds.
t = (0:L-1)*T;       % Time vector in seconds.


Te = 0.8;          %echo delayed in msec
amp = 0.4;
Ne = 5;
signalplusecho = echo_gen(signal,Fs,Te,amp,Ne);
audiowrite('speechwithecho.wav', signalplusecho, Fs);

function signalplusecho = echo_gen(signal,Fs,delay,amp,Ne)
    for i =1:Ne
        T = 1/Fs;       % Sampling period in seconds.
        % Calculate the increased sample spaces for the given delay
        N = round(i * delay/T); 
        %create the original signal with alloacted spaces of the new dealyed signal equal to zero
        signal_newspace = [signal;zeros(N,1)]; 
        %create the delayed signal with the delays equal to zero at the front and pad the original signal multiply with the amplitude       
        signal_echodelay = [zeros(N,1);(amp.^i).*signal];
        %added two signals
        temp = temp +signal_echodelay;
        signalplusecho = signal_newspace+signal_echodelay;
        %ensure the magnitude of any sample spaces does not exceed 1
        if max(abs(signalplusecho))>1
            signalplusecho = signalplusecho/max(abs(signalplusecho));
        end

    end
end


% ref = https://www.mathworks.com/matlabcentral/answers/471598-generate-echo-to-an-audio
