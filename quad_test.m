#! /usr/bin/octave -qf

clear all;
close all;

x = linspace(0,6,601);
cfs = [1 -6 9];
fa = inline("polyval([1 -6 9], a)");
figure(1);
plot(x,feval(fa,x),'-b;fx;');
hold on;
fa_int = inline('polyval(polyder([1 -6 9]),a)');
plot(x,feval(fa_int,x),'-r;\int{~fx};');
disp(sprintf('integral from 0 to 6 of fx= %10.6f',quad(fa,0,6)));
disp(sprintf('integral from 0 to 6 of integral of fx= %10.6f',quad(fa_int,0,6)));
pause;
