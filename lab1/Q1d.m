t = (-10:10);
f = SimpleFunctions();
a = exp(0.8 .* t) .* f.unitstep(t+1) + f.unitstep(t);

stem(t, a, 'LineWidth', 1);


stem(t, a, 'LineWidth', 1);
axis([min(t)-1 max(t)+1 min(a)-100 max(a)+100]);
ylabel('y');
xlabel('x');
title('question 1(d)');
text(-9,2000,'Richard Rui Qiu, ID: 400 and Shabab Rahman, ID:400291441','Fontsize',12);

exportgraphics(gcf, 'Q1d.jpg');
