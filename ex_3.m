clear all;
format long;

function comp_err=comp_err(order)
    x = [0:1/(1000*pi):1/pi];
    pi_approx = truncate(pi,(-1)*order)
    y_approx = 1./(2+pi_approx.*x);
    y_accurate = 1./(2+pi.*x);
    assert(isequal(length(y_approx), length(y_accurate)));
    err = 0.0;
    for i=[1:length(y_approx)]
        err = max ( (abs(y_accurate(i)-y_approx(i)))/y_accurate(i), err ) ;
    end
    comp_err = err*100;
endfunction

    

    
