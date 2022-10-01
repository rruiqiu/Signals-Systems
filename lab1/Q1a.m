t = (-10:10);
f = SimpleFunctions();
a = f.unitstep(t);
b = 2 .* f.unitstep(t-1);
c = f.unitstep(t-4);
d = a - b + c;
stem(t, d, 'LineWidth', 1);

axis([min(t)-1 max(t)+1 min(d)-0.1 max(d)+0.1]);
ylabel('y');
xlabel('x');
title('question 1(a)');
text(-10.5,-0.6,'Rui Qiu, ID:400318681, Shabab Rahman, ID:400291441','Fontsize',9);

exportgraphics(gcf, 'Q1a.jpg');
