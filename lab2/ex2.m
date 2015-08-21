#! /usr/bin/octave -qf

clear all;
close all;

U = 0:0.5:4;
I = [1.017 0.8788 0.4925 0.4883 0.3281 0.3452 0.1613 0.2575 0.1747];

Ui = min(U) + [0:1:100]/100*abs(max(U)-min(U));

%n - order of approximating polynomial
%str - structure with additional data
n = [3 8];
%plot parameters
params = struct(
    'title', {
        'aproksymacja wielomianem 3-go stopnia'
        ,'aproksymacja wielomianem 8-go stopnia'
        ,'aproksymacja wielomianem 5-go stopnia'
        }
    ,'outerpos',{
        [0.02 0.52 0.96 0.46]
        ,[0.02 0.02 0.96 0.46]
        ,[0.02 0.02 0.96 0.96]
    }
);

for i=1:2
    [coeffs str]=polyfit(U,I,n(i));
    err = (sum((I-str.yf).^2))/length(I);
    disp(err);
    Ii = polyval(coeffs,Ui);
    spl=subplot(210+i);
    pl=plot(U,I,'r*',Ui,Ii,'b-');
    set(spl
        ,'title', text('string', params(i).title, 'fontsize',16)
        ,'xlabel',text('string','U [V]','fontsize',16)
        ,'ylabel',text('string','I(U) [mA]','fontsize',16)
        ,'outerposition',params(i).outerpos
        ,'xgrid','on'
    );
    %punkty dokladne
end

fig2=figure(2);
[coeffs str]=polyfit(U,I,5);
Ii = polyval(coeffs,Ui);
err = (sum((I-str.yf).^2))/length(I);
disp(err);
plot(U,I,'r*',U,str.yf,'b+',Ui,Ii,'b-');
set(gca
    ,'title', text('string', params(3).title, 'fontsize',16)
    ,'xlabel',text('string','U [V]','fontsize',16)
    ,'ylabel',text('string','I(U) [mA]','fontsize',16)
    ,'outerposition',params(3).outerpos
    ,'xgrid','on'
);

pause;

