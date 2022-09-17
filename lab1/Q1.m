t = -5:5;
% Create an instance of the SimpleFunctions object.
f = SimpleFunctions(t);
% Evaluate the unit-step function, then plot it.
y = f.unitstep(t);
stem(t, y, 'LineWidth', 3);