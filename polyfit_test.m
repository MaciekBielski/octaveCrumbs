#! /usr/bin/octave -qf

x = -3:1:3;
y = [-0.2774 0.8958 -1.5651 3.4565 3.0601 4.8568 3.8982];
xi = min(x) + [0:1:100]/100*( abs( max(x)-min(x) ));
%p - approximating polynomial
%n - order of p
%s - additonal structure
n = [3 8];
for i=[1 2]
    [p s] = polyfit(x,y,n(i));
    yi = polyval(p,xi);
    subplot(120+i);
    plot(x,y,'k*',xi,yi,'b-');
end
pause;
