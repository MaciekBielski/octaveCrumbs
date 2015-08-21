#! /usr/bin/octave -qf
clear all;
close all;
format long;
setenv("GNUTERM", "wxt");

function out = curry(q)
    s = "x.^2-%f";
    funtxt=sprintf(s,q);
    out = inline(funtxt);
end;

qq = [0.007 0.2 9 12 90 200 1000];
%qq = [12];
ii=[];
cord = get(gca,'colororder');
colcnt=1;
ph=0;
max_length=0;

for q=qq
    %reset
    d=[];
    disp('-------\n');

    if q<1
        a = sqrt(q)-q;
        b = sqrt(q)+q;
    else
        a = sqrt(q)-0.9;
        b = sqrt(q)+0.9;
    end

    fx = curry(q);
    [x0, it]=newt_tang(fx,a,b,eps,20);
    err_nmtor = diff(x0);
    err_dnmtor = x0(2:end);
    err = abs(err_nmtor./err_dnmtor).*100;
    # avoid dividing by 0 during log10 computation
    if(err(end) == 0)
        err(end) += eps;
    end
    kk = log10(50./err);
    for j= 1:(length(kk)-1)
        if kk(j)>=1
            d(j) = kk(j+1)-kk(j);
        else
            d(j) = 0;
        end
    end
    ii = 3:length(x0);
    #max value on xlabel
    if length(x0) > max_length
        max_length = length(x0);
    end;
    ph=plot(ii,floor(d),'o-');
    hold on;
    set(ph,'color',cord(colcnt,:));
    colcnt++;
end 

set(gca
    ,'xtick',[1:max_length]
    ,'xlabel','i'
    ,'ylabel','d[i]'
);

leg = legend();
set(leg
    ,'string',strsplit(num2str(qq))
    ,'textposition','left'
);
pause;
