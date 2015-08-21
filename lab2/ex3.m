#! /usr/bin/octave -qf

clear all;
close all;
format long;

v = [15 20 25 30 40 50 60];
d = [5 6.8 11.3 13.2 20 30 40];

vi = v(1) + [0:1:45]/45*(v(end)-v(1));

% a) splices

di = spline(v,d,vi);
k = find(vi==45);

f1=figure(1);
xtick = sort([v 45]);
plot(v,d,'r*',vi,di,'b-',vi(k),di(k),'r+');
set(gca
    ,'title',text('string','interpolacja funkcjami sklejanymi','fontsize',12)
    ,'xlabel',text('string','V [km/h]','fontsize',20)
    ,'ylabel',text('string','D [m]','fontsize',20)
    ,'outerposition',[0.02 0.02 0.96 0.96]
    ,'xlim',[14 61]
    ,'xtick',xtick
);
l=line(
    [45 45],[0 di(k)]
    ,'linewidth',1
);
line([45 14],[di(k) di(k)],'linewidth',1);
text(45.5,24,sprintf('(%d,%.3f)',45,di(k)),'fontsize',18);
    
% b) least-squares regression
close(f1);

vi2 = v(1) + [0:1:90]/90*(v(end)-v(1));
k2 = find(vi2==45);
disp(k2);
disp(vi2(k2));
[coeffs str]=polyfit(v,d,1);
di2=polyval(coeffs,vi2); 
disp(di2(k2));
figure(2); 
plot(v,d,'r*',vi3,di2,'b-');

set(gca
    ,'title',text('string','regresja najmniejszych kwadratow','fontsize',12)
    ,'xlabel',text('string','V [km/h]','fontsize',20)
    ,'ylabel',text('string','D [m]','fontsize',20)
    ,'outerposition',[0.02 0.02 0.96 0.96]
    ,'xlim',[14 61]
    ,'xtick',xtick
);
l=line(
    [45 45],[0 di2(k2)]
    ,'linewidth',1
);
line([45 14],[di2(k2) di2(k2)],'linewidth',1);
text(45.5,24,sprintf('(%d,%.3f)',45,di2(k2)),'fontsize',18);


pause;

