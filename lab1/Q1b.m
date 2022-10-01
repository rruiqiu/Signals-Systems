t = (-10:10);
f = SimpleFunctions();
a = (t+2).* f.unitstep(t+2);
b = 2 .* f.unitstep(t);
c = t .* f.unitstep(t-4);
d = a - b - c;
stem(t, d, 'LineWidth', 1);

axis([min(t)-1 max(t)+1 min(d)-0.1 max(d)+0.1]);
ylabel('y');
xlabel('x');
title('question 1(b)');
text(-9.5,2.5,'Rui Qiu, ID:400318681, Shabab Rahman, ID:400291441','Fontsize',9);

exportgraphics(gcf, 'Q1b.jpg');
