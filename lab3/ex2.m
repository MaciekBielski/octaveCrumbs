#! /usr/bin/octave -qf

clear all;
close all;
format long;

xx = 2:0.01:2.8;
fx=inline('x.^3-4.5.*x.^2+6.3.*x-3');

[x0,y0,ii,out_str] = fzero(fx,[xx(1) xx(end)]);

x1=out_str.bracketx(1);
x2=out_str.bracketx(2);
y1=out_str.brackety(1);
y2=out_str.brackety(2);

% dfdx = (y2-y1)/(x2-x1);
% ytan = y0+dfdx*(xx-x0);
% dfdx
% y0
% b = dfdx*(-x0)+y0

ud0=x0
jg = 0.001;
r1 = 10000;

fid = inline("0.001.*u.*( (u.^2)./3 -1.5*u + 2)");
id0 = feval(fid,ud0)
i1 = jg - id0
u1 = i1*r1


# it was unnecessary

% plot(xx,feval(fx,xx),xx,ytan);
% outdata=[xx; ytan];
% outdata(:)
% fh=fopen('ex2.dat','wt');
% fprintf(fh,'%14.16f %14.16f\n', outdata(:)');
% fclose(fh);
% disp('ok');

pause;
