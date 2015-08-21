# acc - accuracy
# iter - max nb of iterations
function [out,iter]=bisec(f,a,b,acc,iter)

    i=0;
    for i = 1:iter
        xm(i) = 0.5*(a+b);
        ym = feval(f,xm(i));
        if i>1 
            err = abs( xm(i)-xm(i-1) );
            if err <= acc
                break; 
            end;
        end;

        ya=feval(f,a);
        if ya*ym > 0
            a = xm(i);
        else
            b = xm(i);
        end;
        %disp(sprintf("%d iteration, xm= %f ym= %f",i,xm(i),ym));
        %pause();
    end;
    %disp(sprintf("finish \nxm= %f",xm));
    out=xm;
    iter=i;
end;
