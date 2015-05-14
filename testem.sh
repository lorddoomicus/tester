#/bin/bash
#/***************************************************************************** 
# * testem.sh                                                                 *
# * (c) 2012 Derrik Walker v2.0                                               *
# *                                                                           *
# * This shell script runs tester to 4 times, for multiple choice tests, for  *
# * 2, 3, 4 and 5 possible answers per question. Each run is run for one      *
# * billion students taking each test                                         *
# *                                                                           *
# * This is the scipt used to run the simulated tests from the blog post:     *
# *                                                                           *
# * http://www.doomd.net/2013/08/can-someon-pass-sat-or-anyother-filling.html *
# *                                                                           *
# * WARNING: Running this script requires HUGE amounts of memory. It is       * 
# * recommended that your system have at 16 gigs or ram!                      *
# *                                                                           *
# * This is licensed for use under the GNU General Pulbic License v2          *
# *                                                                           *
# * 2012-11-12	DW2	Initial version                                       *
# * 2015-05-13	DW2	Initial release                                       *
# *                                                                           *
# *****************************************************************************/

qs=100		# Questions per test
tt=1000000000	# One BILLION Test takers

#
# here is a cleaver trick to get a distrabution curve for data, in txt format
# one entry per line, if you sort your data, then use uniq to count each 
# occurence, that will give you a count of each item, on per line. To make it 
# easier to graph, use awk to reverse the uniq output so its <item> <count>
#
# looks kinda like this:
#	sort | uniq -c | awk '{print $2 " " $1}'
#

./tester $qs 2 $tt | sort -n | uniq -c | awk '{print $2 " " $1}' > test2.dat
./tester $qs 3 $tt | sort -n | uniq -c | awk '{print $2 " " $1}' > test3.dat
./tester $qs 4 $tt | sort -n | uniq -c | awk '{print $2 " " $1}' > test4.dat
./tester $qs 5 $tt | sort -n | uniq -c | awk '{print $2 " " $1}' > test5.dat

gnuplot testem.plt
