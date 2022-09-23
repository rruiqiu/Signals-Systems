t = (-10:0.1:10);
% 0.1 is used to increase the sampling frequency
f = SimpleFunctions();
a = f.unitstep(t);
b = 2 .* f.unitstep(t-1);
c = f.unitstep(t-4);
d = a - b + c;
stem(t, d, 'LineWidth', 1);
