
%%
%% Do the graphical convolution lecture example using Matlab.
%%

%%
%% x = [2 2 1]
%% h = [3 3 3 3 3]
%%
clear
f = SimpleFunctions();

% Assume time always starts at 0 for both signals.
n = 0:5;

x = 2*f.delta(n) + 2*f.delta(n-1) + f.delta(n-2);
h = 3*(f.unitstep(n) - f.unitstep(n-5));
% x and h have the same length.

zs_output = conv(x, h);
disp(zs_output)
%% Create a correct discrete time vector.
time_axis = [0 length(zs_output)-1];

set(groot, 'DefaultStemLineWidth', 3)
set(groot, 'defaultAxesFontSize', 18)

subplot(3, 1, 1)
stem(n, x)
xlabel("n")
ylabel("x")
axis([time_axis 0 max(x)+1])
grid on;

subplot(3, 1, 2)
stem(n, h)
xlabel("n")
ylabel("h")
axis([time_axis 0 max(h)+1])
grid on;

subplot(3, 1, 3)
stem(0:length(zs_output)-1, zs_output)
xlabel("n")
ylabel("zs\_output")
axis([time_axis 0 max(zs_output)+5])
grid on;

