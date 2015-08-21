#! /usr/bin/octave -qf

clear all;
close all;
format long;

ud = [0:0.00001:1];

global uT = 25*10^(-3);
global is = 10^(-15);
global r3a=100;
global r3b = 0;
global r1 = 100;
global r2=1000;
global E=5;
global alpha= r1/r2 + 1;

global r3;
global rr13;


function id = fud(x, rr13)

    global uT;
    global is;
    global r3;
    global r1;
    global r2;
    global E;
    global alpha;
    global rr13;

    id = is*(exp(x./uT)-1)+(alpha/rr13).*x - (E/rr13);
end;

f = @fud;
% a)
%r3 = r3a;
%
%rr13 = r3*alpha + r1;
%y = feval(f,ud);
%
%plot(ud,y);
%ylim([-0.005,0.005]);
%xlim([0.7,0.8]);
%xlabel("u_d[V]");
%ylabel("f(u_d)");
%set(gca,
%    'xtick',[0.7:0.01:0.8]
%);
%line([0.7,0.8],[0,0]);
% ud0_range = [0.76, 0.78];

r3 = r3b;
rr13 = r3*alpha + r1;
y = feval(f,ud);

plot(ud,y);
ylim([-0.005,0.005]);
xlim([0.75,0.8]);
xlabel("u_d[V]");
ylabel("f(u_d)");
set(gca,
    'xtick',[0.7:0.01:0.8]
);
line([0.7,0.8],[0,0]);
ud0_range = [0.78, 0.79];


[x0, y0, ii, out] = fzero(f,ud0_range);

ud0 = x0
id0 = is*(exp(x0/uT)-1)

I2 = (ud0 + id0*r3)/r2

I0 = (E - ud0 - id0*r3)/r1

pause;
