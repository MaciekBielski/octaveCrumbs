clear all;
close all;

c = [-1 10 -16];
x = linspace(1,9,901);
fx = polyval(c,x);

x0 = 5;
df_a = polyval(polyder(c), x0);
df_b = polyval(c,x0) - df_a.*x0;
t = [df_a df_b]; 
df = polyval(t,x);

hold all;
plot(x,fx,x,df);
