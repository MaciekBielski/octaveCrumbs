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

set label 1 "(u_{d0},0)" at 2.3877,0.4 right
set arrow 3 from 2.2,0.3 to 2.3877,0.0 arrowstyle 2

set mxtics 5
set ytics axis

set key on at 0.5,1 left top spacing 1.6 box 

set arrow 1 from 3.0 to 3.1 arrowstyle 1 
set arrow 2 from 0,1 to 0,1.05 arrowstyle 1 

set label 2 "{u_d [V]}" at 2.8,0.15
set label 3 "{f(u_d)}" at 0.05,1.05

plotkey = '{{u_d}^3-4.5{u_d}^2+6.3{u_d}-3}'

plot [0:3] [-1:1] x**3 -4.5*x**2 + 6.3*x -3 title plotkey;
plot [0:5] x**2 notitle

