t = (-10:10);
f = SimpleFunctions();
a = f.delta(t+1)-f.delta(t)+f.unitstep(t+1)-f.unitstep(t-2);
% not sure what function should use, delta or unitpulse
stem(t, a, 'LineWidth', 1);
