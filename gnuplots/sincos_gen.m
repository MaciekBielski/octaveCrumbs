#! /usr/bin/octave -qf

clear all;
close all;


x = [0:0.01:7];
s = sin(x);
c = cos(x);
data = [x; s; c];

fh=fopen('sincos.dat','wt');
fprintf(fh,'%8.6f %8.6f %8.6f\n',data);
fclose(fh);
disp('ok');
pause;
