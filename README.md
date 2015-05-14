# Random Test Taking 

This is the program, support scripts used, and output files for the blog post:
 
http://www.doomd.net/2013/08/can-someon-pass-sat-or-anyother-filling.html

## Notes

This simulation, as noted in the blog post, runs for one billion sample tests 
( or test takers ), and uses a 100 question test. It runs 4 times: 2 answer (
True/False ), 3 answer, 4 answer and 5 answer multiple choice questions.  

**WARNING:** Running this simulation as is, requires a LOT of memory and CPU time!  _16 Gigs_ is is highly recommended. 

## Files 

- tester.c
	- This is the main 'c' program that does the actual simulation 
          It should compile with any ansi-c compiler. 

- testem.sh
	- This is a shell script that runs the simulation and creates the graph

- testem.plt
	- This is the GNU Plot file that is used to create the graph in test.jpg

- graphit
	- This is a shell script that uses plotutils to plot the data in a X11
	graphical window

- test?.dat & test.jpg
	- These are the output files for the run that was used for the blog post

## License 

All files are covered under the GNU General Public License v2.

(c) 2015 Derrik Walker v2.0, dwalker@doomd.net 
