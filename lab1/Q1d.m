t = (-10:10);
f = SimpleFunctions();
a = exp(0.8 .* t) .* f.unitstep(t+1) + f.unitstep(t);

stem(t, a, 'LineWidth', 1);
