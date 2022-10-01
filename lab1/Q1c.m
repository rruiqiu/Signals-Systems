t = (-10:10);
f = SimpleFunctions();
a = f.delta(t+1)-f.delta(t)+f.unitstep(t+1)-f.unitstep(t-2);
stem(t, a, 'LineWidth', 1);


axis([min(t)-1 max(t)+1 min(a)-0.1 max(a)+0.1]);
ylabel('y');
xlabel('x');
title('question 1(c)');
text(-10.5,1.2,'Rui Qiu, ID:400318681, Shabab Rahman, ID:400291441','Fontsize',7.5);

exportgraphics(gcf, 'Q1c.jpg');
