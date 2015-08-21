# acc - accuracy
# iter - max nb of iterations
function [out,iter]=secant(f,a,b,acc,max_iter)

    x(1)=a;
    fx(1) = feval(f,a);
    x(2)=b;
    fx(2) = feval(f,b);
% disp(sprintf('it: %d\t x=%f\tfxx=%f',0,x(1),fx(1)));
% disp(sprintf('it: %d\t x=%f\tfxx=%f',0,x(2),fx(2)));

    for k=1:max_iter
        fx_diff = fx(k+1)-fx(k);
        if isequal(fx_diff,0)
            disp(' secant-dividing by zero detected');
            break;
        end;
        dfdx = (x(k+1)-x(k))/fx_diff;
        x(k+2) = x(k+1) - fx(k+1)*dfdx;
        fx(k+2) = feval(f,x(k+2));
% disp(sprintf('it: %d\t x=%f\tfxx=%f',k,x(k+2),fx(k+2)));
        if k>1
            err = abs(x(k)-x(k-1));
            if err <= acc
                break;
            end;
        end;
    end;
    out = x(3:end);
    iter = k;
end;
