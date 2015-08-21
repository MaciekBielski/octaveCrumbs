# acc - accuracy |x(k+1)-x(k)|
# iter - max number of iterations
# x0 - initial guess
# f(x) - converted to form x = g(x)

function [out, iter]=fixpt(g,x0,acc,max_iter)

    xx(1) = x0;
    for k=2:max_iter
        xx(k) = feval(g,xx(k-1));
        if abs(xx(k) - xx(k-1)) < acc
            break;
    end;
    out = xx;
    iter = k;
end;
