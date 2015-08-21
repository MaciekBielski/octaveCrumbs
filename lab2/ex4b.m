#! /usr/bin/octave -qf

clear all;
close all;
format long;

p = [1 0; 3 3; 4 1];
xx = 0.5:0.01:4.5;

a = [
    1 1 1 1 1 1 1 1 1;
    6561 2187 729 243 81 27 9 3 1;
    65536 16384 4096 1024 256 64 16 4 1;
    8 7 6 5 4 3 2 1 0;
    17496 5103 1458 405 108 27 6 1 0;
    131072 28672 6144 1280 256 48 8 1 0;
    56 42 30 20 12 6 2 0 0;
    40824 10206 2430 540 108 18 2 0 0;
    229376 43008 7680 1280 192 24 2 0 0;    
    ];

figure(1);
plot(p(:,1),p(:,2),'r*');
hold on;
set(gca
    ,'title',text('string','wielomiany interpolacyjne dla roznych wartosci parametru p','fontsize',16)
    ,'xlabel',text('string','x','fontsize',16)
    ,'ylabel',text('string','f(x)','fontsize',16)
    ,'xgrid','on'
    ,'ygrid','on'
    ,'xlim',[0.5 4.5]
    ,'ylim',[-3 7]
    ,'outerposition',[0.02 0.02 0.96 0.96]
);

par=[11 10 9 8 7 6];
color=['k','r','g','b','m','c'];
c=0;
plots_arr=[];
for i=par
    b= [0 3 1 0 0 0 i (-1)*i i]';
    x = a\b;
    if i==8
        disp(x);
    endif
    y = polyval(x,xx);
    p_tmp=plot(xx,y,color(++c));
    plots_arr = [plots_arr p_tmp];
end;

plots_labels=strsplit(num2str(par));
leg=legend(plots_arr, plots_labels);
set(leg
    ,'textposition','left'
    ,'location', 'northeast'
);

pause

