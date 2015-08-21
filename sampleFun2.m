# function that returns a variable has an unusual syntax
# function retVal = funName(args)
# or
# function [out1,out2]=funName(args)
# retVal and funName can also be the same 

# WARNING: notice how to take care of list of arguments

function f=f(x)
    if(!x)
        f=1;
    else
        f=x--*f(x);
    endif
endfunction

function out=myFactorial(args)
    rows=[1:rows(args)];
    out=[];
    for r=rows
        outRow=[];
        inRow=args(r,1:length(args));
        for e=inRow
            outRow=[outRow,f(e)];
        endfor;
        out=[out;outRow];
    endfor;
endfunction
