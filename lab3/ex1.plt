#! /usr/bin/gnuplot -p

set title "Blad wzgledny rozwiazania"
set xlabel "Ilosc iteracji"
set ylabel "err [%]" 

set style line 1 lw 2 lc 1 pt 7 
set style line 2 lw 2 lc 2 pt 7 
set style line 3 lw 2 lc 3 pt 7 
set style arrow 1 head filled

set key top right
set arrow 1 from 3.0 to 3.1 arrowstyle 1

plot 'method_comparision.dat' index 0 title 'BISEKCJI' with linespoints ls 1 ,\
    '' index 1 title 'NEWTONA' with linespoints ls 2,\
    '' index 2 title 'SIECZNYCH' with linespoints ls 3,


