#! /usr/bin/octave -qf

clear all;
close all;
format long;

a=0;
b=400;
n=6;
xm=0.5.*( (b-a).*cos( pi*(2.*[0:1:n]+1)/(2*n+2)) +(b+a) );
plot(xm,zeros(1,length(xm)),'r*');
ylim([-0 0.2]);
line([0,400],[0,0]);
set(gca
    ,'xlabel',text('string','pozycja czujnikow wzdluz rury','fontsize',16)
    ,'outerposition',[0.02 0.02 0.96 0.96]
    ,'position',[0.1 0.4 0.8 0.6]
);
pause;
