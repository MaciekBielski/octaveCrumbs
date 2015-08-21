#! /usr/bin/gnuplot -p

set terminal wxt enhanced

unset ytics
unset xtics
unset border
set tmargin 3
set bmargin 3
set lmargin 6
set rmargin 6

set style line 1 lt -1 lw 1 
set style line 2 lt 3 lw 1 
set style arrow 1 head filled
set style arrow 2 head 

set xzeroaxis ls 1
set yzeroaxis ls 1
set xtics axis 0.0,0.5,3 
set xtics add ('' 0 )

set mxtics 5
set ytics axis

set key on at 0.5,1.6 left top spacing 1.6 box 

set arrow 1 from 3.0 to 3.1 arrowstyle 1 
set arrow 2 from 0,1.6 to 0,1.65 arrowstyle 1 

set label 2 "{u_d [V]}" at 2.8,0.15
set label 3 "{i [mA] }" at 0.05,1.65

set label 4 "(2.39, 0.76)" at 2.35,0.45
set arrow 3 from 2.45,0.55 to 2.38,0.76 arrowstyle 2

llabel = '-{u_d/R_1} + j_g'
rlabel = 'ch-ka diody tunelowej'

jg = 1;
r1= 10;
k = 1;

plot [0:3]  -0.1*x+jg title llabel,\
    k*x*((x**2)/3 - 1.5*x + 2 ) title rlabel




