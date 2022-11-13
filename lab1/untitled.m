t = -5:5;
% Create an instance of the SimpleFunctions object.
f = SimpleFunctions();
% Evaluate the unit-step function, then plot it.
y = f.unitstep(t-1);
stem(t, y, 'LineWidth', 3);
