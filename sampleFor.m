# for loop example

x = [0:0.1:pi];
y = zeros(size(x));
c=0;
for i=x
   printf('%d: %f\n',c++,i)
endfor

