#! /usr/bin/gnuplot -p

set terminal wxt enhanced
set tmargin 6
set bmargin 6
set lmargin 16
set rmargin 16
set sample 2000

uT = 25*10**(-3)
is = 10**(-15)
r1=100
r2=1000
r3a=100
E=5

alpha = r1/r2 + 1
rr13a = r3a*alpha + r1

set xlabel 'u_d [V]'
set ylabel 'i_d [A]'

set key on at 0, screen 0.8 left bottom Left height 1.4 box

diode='charakterystyka statyczna diody dla ud {/Symbol=10 \263}0'
ll='prawa strona wyrazenia (12)'

plot [0:1]  is*(exp(x/uT)-1) title diode, \
     x*(-alpha)/rr13a + E/rr13a title ll

