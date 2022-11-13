A=2;
n=0:2:8;
f = SimpleFunctions();
a = A * n .* f.unitstep(n-3);
stem(n, a, 'LineWidth', 1);


axis([min(n)-1 max(n)+1 min(a)-0.1 max(a)+0.1]);
ylabel('y');
xlabel('x');
title('question 1(c)');
text(-10.5,1.2,'Rui Qiu, ID:400318681, Shabab Rahman, ID:400291441','Fontsize',7.5);

exportgraphics(gcf, 'Q1c.jpg');
