clear all;
close all;
% input x=[x0, ... , xN]
%       y=[y0, ... , yN]
% output: vector of Newton polynominal coefficients
% of degree N

x = [-2 -1 1 2 4];
xx = -3:0.001:5;
y = [-6 0 0 6 60];

function coeffs=newton_pol(x,fx)
    n = length(x)-1;
    %dd - divided difference table
    dd = zeros(n+1, n+1);
    dd(1:n+1,1) = fx';
    % filling dd with values
    for j=2:n+1
        for i=1:n+2-j
           % j is also a step
           dd(i,j) = (dd(i+1,j-1) - dd(i,j-1))/(x(i+j-1)-x(i)); 
        end
    end
    %building interpolation polynominal
    df = dd(1,:);
    m = df(n+1);
    for k=n:-1:1
        m = [m df(k)]-[0 m*x(k)];
    end
    coeffs = m;
end

coeffs = newton_pol(x,y);
yy = polyval(coeffs,xx);
figure(1);
stem(x,y);
hold on;
plot(xx,yy);
