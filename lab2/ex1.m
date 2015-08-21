#! /usr/bin/octave -qf

clear all;
close all;

xx = -3:0.01:3;
y = abs(sin(xx));

x1 = -3:0.5:3;
y1_s = abs(sin(x1));

l1 = lag_pol(x1,y1_s);
n1 = newton_pol(x1,y1_s);
y1_l = polyval(l1,xx);
y1_n = polyval(n1,xx);

x2 = -3:1:3;
y2_s = abs(sin(x2));

l2 = lag_pol(x2,y2_s);
n2 = newton_pol(x2,y2_s);
y2_l = polyval(l2,xx);
y2_n = polyval(n2,xx);

x_opt = [];
b = -3;
a = 3;
n = 12;
m = 0:1:n;
xm = 0.5*( (b-a).*cos((2*m+1)*pi./(2*n+2))+(b+a) );
ym_s = abs(sin(xm));

nm = lag_pol(xm,ym_s);
ym_n = polyval(nm,xx);

figure(3);
ph_m = plot(xm, ym_s,xx,y,'g-',xx,ym_n,'b-');

set(gca
    ,"title",text('string','interpolacja wielomianem 12-tego stopnia przy optymalnym doborze wezlow','fontsize',12)
    ,'xlim',[-3.1 3.1]
    ,'ylim',[0 1.5]
    ,'xlabel',text('string','x','fontsize',20)
    ,'ylabel',text('string','f(x)','fontsize',20)
    ,'outerposition',[0.02 0.02 0.96 0.96]
    ,'xgrid','on'
    ,'xtick',round(xm(2:length(xm)-1).*10)/10
);

leg_m=legend();
set(leg_m,
    "string", {"wezly","|sin(x)|","aproksymacja"},
    "textposition", "left",
    "location", "north",
    "orientation", "horizontal"
);

set(ph_m(1)
    ,"marker", 'o'
    ,"linestyle", "none"
    ,"markeredgecolor","red"
    ,"markerfacecolor","red"
    ,"markersize",4
    ,"linewidth",0.5
    ,"color","red"
);

%figure(1);
%sb1 = subplot(2,1,1);
%    ph_l = plot(x1, y1_s,xx,y,'g-', xx,y1_l,'b-');
%    set(sb1 
%        ,"title", text(
%            "string","interpolacja wielomianem Lagrange'a 12-tego stopnia",
%            "fontsize",12
%            )
%        ,"xlim", [-3.1 3.1] 
%        ,"ylim", [-0 1.5] 
%        ,"linewidth",1
%        ,"xlabel",text("string","x","fontsize",20)
%        ,"ylabel",text("string","f(x)","fontsize",20)
%        ,"outerposition", [0.02 0.52 0.96 0.46]
%        ,"xgrid","on"
%        ,"xtick",x1
%    );
%
%    leg_l=legend();
%    set(leg_l,
%        "string", {"wezly","|sin(x)|","aproksymacja"},
%        "textposition", "left",
%        "location", "north",
%        "orientation", "horizontal"
%    );
%
%    set(ph_l(1)
%        ,"marker", 'o'
%        ,"linestyle", "none"
%        ,"markeredgecolor","red"
%        ,"markerfacecolor","red"
%        ,"markersize",4
%        ,"linewidth",0.5
%        ,"color","red"
%    );
%
%sb2 = subplot(2,1,2);
%    ph_n = plot(x1, y1_s,xx,y,'g-', xx,y1_n,'b-');
%    set(sb2
%        ,"title", text(
%            "string","interpolacja wielomianem Newtona 12-tego stopnia",
%            "fontsize",12
%            )
%        ,"xlim", [-3.1 3.1] 
%        ,"ylim", [-0 1.5] 
%        ,"linewidth",1
%        ,"xlabel",text("string","x","fontsize",20)
%        ,"ylabel",text("string","f(x)","fontsize",20)
%        ,"outerposition", [0.02 0.02 0.96 0.46]
%        ,"xgrid","on"
%        ,"xtick",x1
%    );
%
%    leg_n=legend();
%    set(leg_n,
%        "string", {"wezly","|sin(x)|","aproksymacja"},
%        "textposition", "left",
%        "location", "north",
%        "orientation", "horizontal"
%    );
%
%    set(ph_n(1)
%        ,"marker", 'o'
%        ,"linestyle", "none"
%        ,"markeredgecolor","red"
%        ,"markerfacecolor","red"
%        ,"markersize",4
%        ,"linewidth",0.5
%        ,"color","red"
%    );
%
%figure(2);
%sb1 = subplot(2,1,1);
%    ph_l = plot(x2, y2_s,xx,y,'g-', xx,y2_l,'b-');
%    set(sb1 
%        ,"title", text(
%            "string","interpolacja wielomianem Lagrange'a 6-tego stopnia",
%            "fontsize",12
%            )
%        ,"xlim", [-3.1 3.1] 
%        ,"ylim", [-0.5 1.5] 
%        ,"linewidth",1
%        ,"xlabel",text("string","x","fontsize",20)
%        ,"ylabel",text("string","f(x)","fontsize",20)
%        ,"outerposition", [0.02 0.52 0.96 0.46]
%        ,"xgrid","on"
%        ,"xtick",x1
%    );
%
%    leg_l=legend();
%    set(leg_l,
%        "string", {"wezly","|sin(x)|","aproksymacja"},
%        "textposition", "left",
%        "location", "north",
%        "orientation", "horizontal"
%    );
%
%    set(ph_l(1)
%        ,"marker", 'o'
%        ,"linestyle", "none"
%        ,"markeredgecolor","red"
%        ,"markerfacecolor","red"
%        ,"markersize",4
%        ,"linewidth",0.5
%        ,"color","red"
%    );
%
%sb2 = subplot(2,1,2);
%    ph_n = plot(x2, y2_s,xx,y,'g-', xx,y2_n,'b-');
%    set(sb2
%        ,"title", text(
%            "string","interpolacja wielomianem Newtona 6-tego stopnia",
%            "fontsize",12
%            )
%        ,"xlim", [-3.1 3.1] 
%        ,"ylim", [-0.5 1.5] 
%        ,"linewidth",1
%        ,"xlabel",text("string","x","fontsize",20)
%        ,"ylabel",text("string","f(x)","fontsize",20)
%        ,"outerposition", [0.02 0.02 0.96 0.46]
%        ,"xgrid","on"
%        ,"xtick",x1
%    );
%
%    leg_n=legend();
%    set(leg_n,
%        "string", {"wezly","|sin(x)|","aproksymacja"},
%        "textposition", "left",
%        "location", "north",
%        "orientation", "horizontal"
%    );
%
%    set(ph_n(1)
%        ,"marker", 'o'
%        ,"linestyle", "none"
%        ,"markeredgecolor","red"
%        ,"markerfacecolor","red"
%        ,"markersize",4
%        ,"linewidth",0.5
%        ,"color","red"
%    );

pause;
