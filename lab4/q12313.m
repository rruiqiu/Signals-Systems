clc; 
clear;

[signal, Fs] = audioread('SecretMessage2022.wav');
L = length(signal);
T = 1/Fs;
freqs = zeros(76, 4);
set(gcf,'position',[10,10,2500,1200]);
loops_time = L/Fs;
time = 0;
% y = signal(1:Fs);
% q = signal(Fs+1:2*Fs);
% d = signal(2*Fs+1:3*Fs);
for i = 0:loops_time-1
    Y = fft(signal((1+i*Fs):(i+1)*Fs))/Fs;
    [B, I] = maxk(abs(Y(1:Fs / 2 + 1)), 4); %use maxk function to find the largest four amplitudes
    freqs(i + 1, :) = I - 1; %record the horizontal of largest amp index
    f = Fs/2*linspace(0,1,Fs/2+1);
    time = time+1;
    subplot(10,8,time);
    plot(f,2*abs(Y(1:Fs/2+1)));
    title(time+"s");
    xlabel('Frequency (Hz)')
    ylabel('|Y(f)|')
    axis([0 Fs/2 0 .1]);
    grid('minor');

end

freqs = sort(freqs, 2); %sort the matrix from low to high
dec_msg = "";

for i = 1:loops_time
    if isequal(freqs(i, :),[1000, 2000, 3000, 4000])
        dec_msg = strcat(dec_msg, "A");
    elseif isequal(freqs(i, :),[1000, 2000, 3000, 5000])
        dec_msg = strcat(dec_msg, "B");
    elseif isequal(freqs(i, :) , [1000, 2000, 3000, 6000])
        dec_msg = strcat(dec_msg, "C");
    elseif isequal(freqs(i, :) , [1000, 2000, 3000, 7000])
        dec_msg = strcat(dec_msg, "D");
    elseif isequal(freqs(i, :) , [1000, 2000, 4000, 5000])
        dec_msg = strcat(dec_msg, "E");
    elseif isequal(freqs(i, :) , [1000, 2000, 4000, 6000])
        dec_msg = strcat(dec_msg, "F");
    elseif isequal(freqs(i, :) , [1000, 2000, 4000, 7000])
        dec_msg = strcat(dec_msg, "G");
    elseif isequal(freqs(i, :) , [1000, 2000, 5000, 6000])
        dec_msg = strcat(dec_msg, "H");
    elseif isequal(freqs(i, :) , [1000, 2000, 5000, 7000])
        dec_msg = strcat(dec_msg, "I");
    elseif isequal(freqs(i, :) , [1000, 2000, 6000, 7000])
        dec_msg = strcat(dec_msg, "J");
    elseif isequal(freqs(i, :) , [1000, 3000, 4000, 5000])
        dec_msg = strcat(dec_msg, "K");
    elseif isequal(freqs(i, :) , [1000, 3000, 4000, 6000])
        dec_msg = strcat(dec_msg, "L");
    elseif isequal(freqs(i, :) , [1000, 3000, 4000, 7000])
        dec_msg = strcat(dec_msg, "M");
    elseif isequal(freqs(i, :) , [1000, 3000, 5000, 6000])
        dec_msg = strcat(dec_msg, "N");
    elseif isequal(freqs(i, :) , [1000, 3000, 5000, 7000])
        dec_msg = strcat(dec_msg, "O");
    elseif isequal(freqs(i, :) , [1000, 3000, 6000, 7000])
        dec_msg = strcat(dec_msg, "P");
    elseif isequal(freqs(i, :) , [1000, 4000, 5000, 6000])
        dec_msg = strcat(dec_msg, "Q");
    elseif isequal(freqs(i, :) , [1000, 4000, 5000, 7000])
        dec_msg = strcat(dec_msg, "R");
    elseif isequal(freqs(i, :) , [1000, 4000, 6000, 7000])
        dec_msg = strcat(dec_msg, "S");
    elseif isequal(freqs(i, :) , [1000, 5000, 6000, 7000])
        dec_msg = strcat(dec_msg, "T");
    elseif isequal(freqs(i, :) , [2000, 3000, 4000, 5000])
        dec_msg = strcat(dec_msg, "U");
    elseif isequal(freqs(i, :) , [2000, 3000, 4000, 6000])
        dec_msg = strcat(dec_msg, "V");
    elseif isequal(freqs(i, :) , [2000, 3000, 4000, 7000])
        dec_msg = strcat(dec_msg, "W");
    elseif isequal(freqs(i, :) , [2000, 3000, 5000, 6000])
        dec_msg = strcat(dec_msg, "X");
    elseif isequal(freqs(i, :) , [2000, 3000, 5000, 7000])
        dec_msg = strcat(dec_msg, "Y");
    elseif isequal(freqs(i, :) , [2000, 3000, 6000, 7000])
        dec_msg = strcat(dec_msg, "Z");
    elseif isequal(freqs(i, :) , [2000, 4000, 5000, 6000])
        dec_msg = strcat(dec_msg, " ");
    elseif isequal(freqs(i, :) , [2000, 4000, 5000, 7000])
        dec_msg = strcat(dec_msg, ".");
    end
end
dec_msg