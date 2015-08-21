#! /usr/bin/gnuplot -p

unset ytics
unset border
#legend
unset key 
# number of points at which to evaluate the function when only 
# y equation is specified (3rd function plotted)
set samples 100

#linestyle definition
set style line 1 linetype -1 linewidth 1
set style line 2 linecolor rgb '#0060ad' linetype 1 linewidth 1
set style line 3 linetype -1 linewidth 1
set style arrow 1 nohead linetype 1 linewidth 1

#ls - linestyle
set xzeroaxis ls 1
set yzeroaxis ls 1
set xtics axis ('' 1.965)

#setting label position
set label 'F' at 2.8, -0.08;
set label 'dF' at 3, 0.19;

# make an arrow
set arrow from 1.965,0 to 1.965, -0.136 arrowstyle 1

#set terminal postscript eps rounded
#set output '2dplot.eps'

# w l ls stands for: with line linestyle
plot [-0.5:5] [-0.2: 0.2] \
    '2dplot.dat' w l ls 1, \
    'd2dplot.dat' w l ls 2, \
    x**2*(1-x) w l ls 3
