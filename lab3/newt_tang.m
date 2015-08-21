# acc - accuracy
# iter - max nb of iterations
function [out,iter]=newt_tang(f,a,b,acc,max_iter)

    assert(a != b);
    if a>b
        pom = a;
        a = b;
        b = pom;
    end;
% a is for sure smaller than b
% xc - zero of control secant from a to b
% dq_ab - differential quotient of a and b
% fxc - value of the function in xc
    fb = feval(f,b);
    fa = feval(f,a);
    dq_ab = (fb-fa)/(b-a);
    xc = a - fa/dq_ab;
    fxc = feval(f,xc);
% is the function convex (fxc<0) or concave (fxc>0)?
% convm - convexity marker
    if fxc<0
        convm = 1;
    elseif fxc>0
        convm = -1;
    end;
% selecting starting point according to convexity
    if convm*fa>0
        x(1) = a;
    elseif convm*fb>0
        x(1) = b;
    else
        error("bad starting points");
    end;
% h - arbitrary selected interval for derivative computation
% fxu - f(x+h/2)
% fxl - f(x-h/2)
    h = (b-a)/10000;
    fx(1) = feval(f,x(1));
    fxu = feval(f,x(1)+h/2);
    fxl = feval(f,x(1)-h/2);
    dfdx(1) = (fxu-fxl)/h;
% disp(sprintf("%d iteration, xm= %f ym= %f",0,x(1),fx(1)));

    for k=2:max_iter
        x(k) = x(k-1) - fx(k-1)/dfdx(k-1);
        fx(k) = feval(f,x(k));
% disp(sprintf("%d iteration, xm= %f ym= %f",k-1,x(k),fx(k)));
        if k>2 
            err = abs( x(k)-x(k-1) );
            if err <= acc
                break;
            end;
        end;
        fxu = feval(f,x(k)+h/2);
        fxl = feval(f,x(k)-h/2);
        dfdx(k) = (fxu-fxl)/h;
        
        #elimination non-convergent oscilation
        buff_cnt = mod((k-2),5);
        if k>2 && buff_cnt==0
            dl = diff(latest);
            if abs(sum(dl))<=acc
                disp('NON-CONVERGENT - cutted');
                x = x(2: k-5);
                break;
            end
        end
        latest(1 + buff_cnt ) = x(k);
    end;
    out = x(2:end);
    iter = k-1;
end;
