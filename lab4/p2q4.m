clc; 
clear;

[signal, Fs] = audioread('SecretMessage2022.wav');
L = length(signal);
T = 1/Fs;
freqs = zeros(76, 4);

% Find frequencies for each char
for i = 0:75
    Y = fft(signal(1 + i * Fs:(i + 1) * Fs)) / Fs;
    [B, I] = maxk(abs(Y(1:Fs / 2 + 1)), 4);
    freqs(i + 1, :) = I - 1;
end

% Sort frequencies for each char
freqs = sort(freqs, 2);

msg = "";

% Convert char frequencies to char using codebook
for i = 1:76
    if freqs(i, :) == [1000, 2000, 3000, 4000]
        msg = strcat(msg, "A");
    elseif freqs(i, :) == [1000, 2000, 3000, 5000]
        msg = strcat(msg, "B");
    elseif freqs(i, :) == [1000, 2000, 3000, 6000]
        msg = strcat(msg, "C");
    elseif freqs(i, :) == [1000, 2000, 3000, 7000]
        msg = strcat(msg, "D");
    elseif freqs(i, :) == [1000, 2000, 4000, 5000]
        msg = strcat(msg, "E");
    elseif freqs(i, :) == [1000, 2000, 4000, 6000]
        msg = strcat(msg, "F");
    elseif freqs(i, :) == [1000, 2000, 4000, 7000]
        msg = strcat(msg, "G");
    elseif freqs(i, :) == [1000, 2000, 5000, 6000]
        msg = strcat(msg, "H");
    elseif freqs(i, :) == [1000, 2000, 5000, 7000]
        msg = strcat(msg, "I");
    elseif freqs(i, :) == [1000, 2000, 6000, 7000]
        msg = strcat(msg, "J");
    elseif freqs(i, :) == [1000, 3000, 4000, 5000]
        msg = strcat(msg, "K");
    elseif freqs(i, :) == [1000, 3000, 4000, 6000]
        msg = strcat(msg, "L");
    elseif freqs(i, :) == [1000, 3000, 4000, 7000]
        msg = strcat(msg, "M");
    elseif freqs(i, :) == [1000, 3000, 5000, 6000]
        msg = strcat(msg, "N");
    elseif freqs(i, :) == [1000, 3000, 5000, 7000]
        msg = strcat(msg, "O");
    elseif freqs(i, :) == [1000, 3000, 6000, 7000]
        msg = strcat(msg, "P");
    elseif freqs(i, :) == [1000, 4000, 5000, 6000]
        msg = strcat(msg, "Q");
    elseif freqs(i, :) == [1000, 4000, 5000, 7000]
        msg = strcat(msg, "R");
    elseif freqs(i, :) == [1000, 4000, 6000, 7000]
        msg = strcat(msg, "S");
    elseif freqs(i, :) == [1000, 5000, 6000, 7000]
        msg = strcat(msg, "T");
    elseif freqs(i, :) == [2000, 3000, 4000, 5000]
        msg = strcat(msg, "U");
    elseif freqs(i, :) == [2000, 3000, 4000, 6000]
        msg = strcat(msg, "V");
    elseif freqs(i, :) == [2000, 3000, 4000, 7000]
        msg = strcat(msg, "W");
    elseif freqs(i, :) == [2000, 3000, 5000, 6000]
        msg = strcat(msg, "X");
    elseif freqs(i, :) == [2000, 3000, 5000, 7000]
        msg = strcat(msg, "Y");
    elseif freqs(i, :) == [2000, 3000, 6000, 7000]
        msg = strcat(msg, "Z");
    elseif freqs(i, :) == [2000, 4000, 5000, 6000]
        msg = strcat(msg, " ");
    elseif freqs(i, :) == [2000, 4000, 5000, 7000]
        msg = strcat(msg, ".");
    end
end

% Display message
msg