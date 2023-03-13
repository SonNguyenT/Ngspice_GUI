set encoding utf8
set termoption noenhanced
set title "* mos characteristic curves"
set xlabel "V"
set ylabel "A"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e+00]
unset logscale y 
set yrange [-2.010189e-05:4.221392e-04]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'blah.data' using 1:2 with lines lw 2 title "(-dc1.i(vds))",\
'blah.data' using 3:4 with lines lw 2 title "(-dc2.i(vds))",\
'blah.data' using 5:6 with lines lw 2 title "(-dc3.i(vds))",\
'blah.data' using 7:8 with lines lw 2 title "(-dc4.i(vds))",\
'blah.data' using 9:10 with lines lw 2 title "(-dc5.i(vds))"
