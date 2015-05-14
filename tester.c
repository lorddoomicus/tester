/* tester.c
 * (c)2012 Derrik Walker v2.0
 *
 * This will create a random multiple choice test key, then run 
 * a specified number of tests and grade them against that key. Then
 * it will print out the score ( as a percentage of correct answers )
 * for each test.
 *
 * This is the program used to simulate the tests in the blog post:
 *
 * http://www.doomd.net/2013/08/can-someon-pass-sat-or-anyother-filling.html
 *
 * Usage:
 *	tester <questions> <answers> <tests>
 * 
 * Where:
 *	<questions> is the number of questions per tests
 *	<answers> is the number of multiple choice answers per quesiton
 *	<tests> is the number of tests to be graded
 *	
 * Compile with:
 *		gcc -o tester tester.c
 *
 * It is lisenced under the GNU GPL v2. Use of this constitutes your *
 * acceptance of the terms of the GPL. *
 *
 * 2012-11-12	DW2	Initial version
 * 2015-05-13	DW2	Initial release
 *
 */

#include <stdio.h>
#include <stdlib.h>

int main ( int argc, char *argv[] ) {

	int questions, answers, tests, correct, *key;
	int i, j;

	unsigned int seeder;
	FILE *rnd_file;

	if ( argc != 4 ) {
		printf ( "usage: %s <questions> <answers> <tests>\n", argv[0] );
		exit( 1 );
	}

	questions	= atoi( argv[1] );
	answers		= atoi( argv[2] );
	tests		= atoi( argv[3] );

	/* 	Seed the random number generator */

	rnd_file = fopen( "/dev/urandom", "r" );
	fread(&seeder, 1, 8, rnd_file);
	srandom( seeder );
	fclose( rnd_file );

	/* 	
		Create the random answer key that all tests will be 
		graded with.
	*/ 

	key = (int *)malloc( questions * sizeof ( *key ));

	for( i = 0; i < questions; i++ )
		key[i] = random() % answers + 1; 

	/* 	
		For each test taken, randomly select answers for every question
	   	then compare it to the key.  For each match, a point is added to
	   	the number of correct.

		Then print the percentage of correct answers for each test
		taken.
	*/

	for( i = 0; i < tests; i++ ){ 

		correct = 0 ;

		for( j = 0; j < questions; j++ )

			if(( random() % answers +1 ) == key[j] ) 
				correct++; 

		printf( "%0.0f\n", ( (float)correct / questions ) * 100 );
	}

	return 0;
} 
