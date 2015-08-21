clear all;
close all;

x = linspace(0,3/2*pi,100);
c = ['r' 'g' 'b'];
a = [-0.5 -0.7 -1.1];
i = [1:1:columns(c)];

hold on;
for j = i
    alpha=a(1,j)
    fx = exp(alpha.*x).*cos(2*pi*x);
    fxx = exp(alpha.*x);
    plot(x,fx, c(1,j), x, fxx, x, -fxx)
end;
