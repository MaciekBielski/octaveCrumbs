#! /usr/bin/gnuplot -p

set terminal wxt enhanced 
unset border
unset ytics
unset xtics

# lt - linetype
# lw - linewidth
# lc - linecolor
# pt - point type
# ps - point size
# w l ls - with line linestyle
# 
set style l 1 lt 1 lw 1 pt 7 ps 1
set style l 2 lt -1 lw 1

set xlabel 'kat odchylenia [ ^{o}]'
set xtics 10 
set ytics axis 0.2,0.2,1.0
set ytics axis add ('0.7' 0.7)
set y2tics ('' 0.7)
set mxtics 2
set xzeroaxis ls 2
set yzeroaxis ls 2
# set key at 80,1.0 right samplen 3;
unset key
set label 1 "{U_{DC}}/{U_{DC max}}" at 3,1.1
#set label 2 "labela" at 20,.5
show label

set arrow 1 from 90,0 to 94,0  filled
set arrow 2 from 0,1 to 0,1.15  filled
set grid mxtics xtics noytics y2tics
set tmargin 3

set xrange [-90:90]
set yrange [0:1]
plot 'antenna_data.dat' w linespoints ls 1 t 'ch\_ka'
