clear
s= [1;2;3;4;5];
createZeroColumn(s,20);

function y = createZeroColumn(s,n)
y = [s;zeros(n, 1)];
end