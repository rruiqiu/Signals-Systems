
%% Plot convolution versus vector index.

clear all;

x = [2 2 1];      % Starting at time n=0.
h = 3*ones(1, 5); % Starting at time n=0.

y = conv(x, h);
conv_length = length(y);

set(groot, 'DefaultStemLineWidth', 3)
set(groot, 'defaultAxesFontSize', 18)

subplot(3,1,1);
stem(x);
axis([0 conv_length+1 0 max(x)+1]);
xlabel('vector index');
ylabel('x');

subplot(3,1,2);
stem(h);
axis([0 conv_length+1 0 max(h)+1]);
xlabel('vector index');
ylabel('h')

subplot(3,1,3);
stem(y);
axis([0 conv_length+1 0 max(y)+2]);
xlabel('vector index');
ylabel('y');




