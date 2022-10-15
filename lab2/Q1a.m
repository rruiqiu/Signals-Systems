%% (a)
%% x = [1 1 1]
%% v = [1 1 1 1]
%%
clear
f = SimpleFunctions();

% Assume time always starts at 0 for both signals.
n = 0:5;

x = f.unitstep(n) - f.unitstep(n-3);
v = f.unitstep(n) - f.unitstep(n-4);
% x and v have the same length.

% Create a correct discrete time vector.
zs_output = conv(x, v);
disp(zs_output)

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
stem(n, v)
xlabel("n")
ylabel("v")
axis([time_axis 0 max(v)+1])
grid on;

subplot(3, 1, 3)
stem(0:length(zs_output)-1, zs_output)
xlabel("n")
ylabel("zs\_output")
axis([time_axis 0 max(zs_output)+2])
grid on;

exportgraphics(gcf, 'Q1a.jpg');