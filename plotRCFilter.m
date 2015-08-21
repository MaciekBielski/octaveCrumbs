# R and C must be presetted globally before
clear R C h;
function h=respRC(freq)
    global R C;
    h=[];
    for f=freq
        r= 1/sqrt(1+1/(2*pi*f*R*C)**2);
        h=[h,r];
    endfor
endfunction

global R=1e4 C=1e-9;
f=linspace(1,1e5,1000);
h=respRC(f);
plot(f,h);
