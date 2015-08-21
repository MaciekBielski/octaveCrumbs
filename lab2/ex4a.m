#! /usr/bin/octave -qf

clear all;
close all;
format long;

p = [1 0; 3 3; 4 1];
xx = 0.5:0.01:4.5;

a = [
    1 1 1 1 1 1;
    243 81 27 9 3 1;
    1024 256 64 16 4 1;
    5 4 3 2 1 0;
    405 108 27 6 1 0;
    1280 256 48 8 1 0
    ];
b = [0 3 1 0 0 0]';
x = a\b
y = polyval(x,xx);

figure(1);
plot(p(:,1),p(:,2),'r*',xx,y,'b-');
set(gca
    ,'title',text('string','interpolacja - zad 4a)','fontsize',16)
    ,'xlabel',text('string','x','fontsize',16)
    ,'ylabel',text('string','f(x)','fontsize',16)
    ,'xgrid','on'
    ,'ygrid','on'
    ,'outerposition',[0.02 0.02 0.96 0.96]
);


pause

