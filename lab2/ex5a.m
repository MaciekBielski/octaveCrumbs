#! /usr/bin/octave -qf

clear all;
close all;
format long;

x = [0 pi/6 pi/4 pi/3 pi/2];
xx = 0+[0:1:100]/100*(pi/2);
y = [0 0.5 0.5*sqrt(2) 0.5*sqrt(3) 1];
n = [4 2];
colors=['g','b'];
labels={' 4st',' 2st'};
app_err=[0 0];

fh=figure(1);
plots=[];
plot(x,y,'r*')
hold on;

for i=1:length(n)
    [cfs str]=polyfit(x,y,n(i));
    fxx = polyval(cfs,xx);
    ph=plot(xx,fxx);
    set(ph,'color',colors(i));
    plots=[plots ph];
    %cfs'
    %printf("---");
    y_app=polyval(cfs,x);
    app_err(i)=sum(abs(y_app-y));
end

disp(app_err);

l=legend(plots, labels);
set(l
    ,'textposition','left'
    ,'location','southeast'
);

set(get(fh,'currentaxes')
    ,'ylim',[-0.1 1.1]
    ,'xlim',[-0 1.6]
    ,'title',text('string','aproksymacja wielomianami 2 i 4 stopnia',
            'fontsize',18)
    ,'xlabel',text('string','x','fontsize',18)
    ,'ylabel',text('string','f(x)','fontsize',18)
    ,'outerposition',[0.02 0.02 0.96 0.96]
);

pause
