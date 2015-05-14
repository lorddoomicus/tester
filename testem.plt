#/***************************************************************************** 
# * testem.plt                                                                *
# * (c) 2012 Derrik Walker v2.0                                               *
# *                                                                           *
# * This is the gnuplot file that is used in testem.sh                        *
# *                                                                           *
# * This is licensed for use under the GNU General Pulbic License v2          *
# *                                                                           *
# * 2012-11-12	DW2	Initial version                                       *
# * 2015-05-13	DW2	Initial release                                       *
# *                                                                           *
# *****************************************************************************/

set terminal jpeg
set output "test.jpg"

set title "Random Test Distrabution Curves"
set xrange[0:100]
set xtics 0,10,100
set xlabel "Scores ( Percentage Correct )"

set yrange[0:1e+8]
set ylabel "Number of Occurrences"

set grid xtics ytics

plot \
"test3.dat" using 1:2 title "3 answer" with lines, \
"test4.dat" using 1:2 title "4 answer" with lines, \
"test5.dat" using 1:2 title "5 answer"  with lines
