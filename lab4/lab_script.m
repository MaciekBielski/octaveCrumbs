#! /usr/bin/octave -qf

clc;
clear all;
format long;

fx=inline('x.*exp(x)');
xx = [ -1:0.1:1 ];
a=-1;
b=1;

for i=1:4
    switch(i)
        case{1}
            fx=inline('x.*exp(x)');
        case{2}
            fx=inline('sqrt(1-x^2)');
        case{3}
            fx=inline('abs(exp(-abs(x)))');
        case{4}
            fx=inline('1/(1+25.*x^2)');
    end
    %   
    fb = feval(fx,b);
    fa = feval(fx,a);
    I1 = (fb+fa)/2*(b-a);
    %
    an = (b-a)/2;
    fa1 = feval(fx,a+an);
    I2 = ( (fa+fa1)+(fa1+fb) )/2*an;
    %
    an = (b-a)/3;
    fa1=feval(fx,a+an);
    fa2 = feval(fx,a+2*an);
    I3 = ((fa+fa1)+(fa1+fa2)+(fa2+fb))/2*an;
    %
    an = (b-a)/4;
    fa1=feval(fx,a+an);
    fa2 = feval(fx,a+2*an);
    fa3 = feval(fx,a+3*an);
    I4 = ((fa+fa1)+(fa1+fa2)+(fa2+fa3)+(fa3+fb))/2*an;
    disp(i);
    disp([I1 I2 I3 I4]');
end;

e=exp(1);
i1=2/e
i2=pi/2
i3=2-2/e
i4=0.4*atan(5)


