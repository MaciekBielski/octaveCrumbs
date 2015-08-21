#! /usr/bin/octave -qf

clear all;
close all;
format long;
setenv("GNUTERM","wxt");

%function out=f1(x)
%    aa = 8;
%    bb = -36;
%    cc = 546;
%    dd = -4536;
%    ee = 22449;
%    ff = -67284;
%    gg = 118124;
%    hh = -109584;
%    ii = 40320;
%    
%    cfs = [aa bb cc dd ee ff gg hh ii];
%    out = polyval(cfs,x);
%end;

fx = inline("8.*(x.^8)-36.*(x.^7)+546.*(x.^6)-4536.*(x.^5)+22449.*(x.^4)-67284.*(x.^3)+118124.*(x.^2)-109584.*x+40320");

xx = [1.6:0.000001:1.8];
y = feval(fx,xx);
% plot(xx,y)
% line([0.9,1.8],[0,0]);
% xlim([0.9 1.8]);
% xlabel("x")
% ylabel("f(x)")
iter=100;
acc=6.95e-13;

[b,ib]=bisec(fx,xx(1),xx(end),eps,iter);
[s,is]=secant(fx,xx(1),xx(end),acc,iter);
[n,in]=newt_tang(fx,xx(1),xx(end),eps,iter);

ib
eb = abs( (b(end)-b(end-1))/b(end) ) *100
x0=b(end)
is
es = abs( (s(end)-s(end-1))/s(end) ) *100
x0=s(end)
in
en = abs( (n(end)-n(end-1))/n(end) ) *100
x0=n(end)

[x0,y0,ii,out]=fzero(fx,[xx(1), xx(end)]);
out.iterations
x0
ez= abs( (out.bracketx(2) - out.bracketx(1))/x0 )*100
pause;
