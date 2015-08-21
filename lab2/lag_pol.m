function coeffs = lag_pol(x,fx)
    coeffs = zeros(1,length(x));
    for i=[1:1:length(x)]
        yj = fx(i);
        xj = x(i);
        nmrator = [];
        dnmrator = 1;
        for j=[1:1:length(x)]
            if(j==i)
                continue
            end
            nmrator = [nmrator x(j)]; 
            dnmrator *= (xj-x(j));
        end
        coeffs += poly(nmrator).*(yj/dnmrator);
    end
end
