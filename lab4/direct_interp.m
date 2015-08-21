function B = direct_interp(X, Y)

n = length(X);
column=ones(n,1);
M=column;

for i=2:n
   
    column=(X').^(i-1);
    M=[M column];
end

A=inv(M)*(Y');
B=fliplr(A');
end
