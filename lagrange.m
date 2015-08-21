% Construct the approximation for the given set of points:
% x=[-2 1 2 4] fx=[3 1 -3 8] by Lagrange method

% 4 points => the approximating polynomial will be of the order 3
clear all;
close all;

x_sample = [-2 1 2 4];
y_sample = [3 1 -3 8];

function coeffs = lag_pol(x,fx)
    % stem(x,fx);
    coeffs = zeros(1,length(x));
    for i=1:length(x)
        yj = fx(i);
        xj = x(i);
        nmrator = [];
        dnmrator = 1;
        for j=1:length(x)
            if(j==i)
                continue
            endif
            nmrator = [nmrator x(j)]; 
            dnmrator *= (xj-x(j));
        end
        coeffs += poly(nmrator).*(yj/dnmrator);
        %printf("===============\n");
    end
end

cfs = lag_pol(x_sample,y_sample);
stem(x_sample,y_sample);
hold all;
x = [-3:0.001:5];
fx = polyval(cfs, x);
plot(x,fx);
