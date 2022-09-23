t = (-10:0.1:10);
f = SimpleFunctions();
a = (t+2).* f.unitstep(t+2);
b = 2 .* f.unitstep(t);
c = t .* f.unitstep(t-4);
d = a - b - c;
stem(t, d, 'LineWidth', 1);
