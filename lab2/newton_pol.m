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
