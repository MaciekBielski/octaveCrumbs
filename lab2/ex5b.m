#! /usr/bin/octave

clear all;
close all;
format long;

xx=0+[0:1:100]/100*(pi/2);
x=[0:1:16]*pi/32;

x1=x(find(x<pi/4));
xx1=xx(find(xx<pi/4));
x2=x(find(x>=pi/4));
xx2=xx(find(xx>=pi/4));
y1=sin(x1);
y2=sin(x2);

cfs1=polyfit(x1,y1,2);
fx1=polyval(cfs1,xx1);
cfs2=polyfit(x2,y2,2);
fx2=polyval(cfs2,xx2);

disp(cfs1)
disp(cfs2)

figure(2);
p=plot(x1,y1,'r*',x2,y2,'r*',xx1,fx1,'g-',xx2,fx2,'b-');
l=legend([p(1) p(3) p(4)],{'zadane punkty','fx1','fx2'});
set(l
    ,'location','southeast'
    ,'textposition','left'
);
set(gca
    ,'xlim', [0,(pi/2+0.1)]
    ,'ylim', [0,1.1]
    ,'title',text('string','aproksymacja dwoma wielomianami','fontsize',18)
    ,'xlabel',text('string','x','fontsize',18)
    ,'ylabel',text('string','f(x)','fontsize',18)
    ,'outerposition',[0.02 0.02 0.96 0.96]
);
pause;
