wot
===

What's On TV

Ruby script to process TV guide

Usage
=====

	wot.rb -[h|C|L|n|N|r] -c Channel -a Time -l Location -s Search

	-h: Display usage
	-c: Channel [TEN,ABC1,..]
	-a: Time [8,8.00,8:30,..]
	-l: Location
	-C: List channels
	-L: List locations
	-n: What's on TV now (to the current hour)
	-N: What's on TV next (to the next hour
	-s: Search on subject (eg News)
	-r: Show only staff picksV

Examples
========

Display Channel TEN's programming for the evening:

	$ wot.rb -c TEN
	+--------------------------------+---------+---------+
	| Program                        | Channel | Time    |
	+--------------------------------+---------+---------+
	| Late Show with David Letterman | TEN     | 12am    |
	| Home Shopping                  | TEN     | 1am     |
	| Home Shopping                  | TEN     | 1.30am  |
	| Home Shopping                  | TEN     | 2am     |
	| Home Shopping                  | TEN     | 2.30am  |
	| Home Shopping                  | TEN     | 3am     |
	| Home Shopping                  | TEN     | 3.30am  |
	| Home Shopping                  | TEN     | 4am     |
	| Home Shopping                  | TEN     | 4.30am  |
	| Home Shopping                  | TEN     | 5am     |
	| Home Shopping                  | TEN     | 5.30am  |
	+--------------------------------+---------+---------+

Display what is on TV at 6:30pm:

	$ wot.rb -a 6:30pm
	+------------------------------------------+---------+---------+
	| Program                                  | Channel | Time    |
	+------------------------------------------+---------+---------+
	| Gardening Australia                      | ABC1    | 6.30pm  |
	| World News Australia                     | SBS ONE | 6.30pm  |
	| World News Australia                     | SBS HD  | 6.30pm  |
	| Bridge to Terabithia                     | Seven   | 6.30pm  |
	| Heartbeat                                | 7TWO    | 6.30pm  |
	| Happy 75th Bert! Celebrating a TV Legend | Nine    | 6.30pm  |
	| Secret Dealers                           | GEM     | 6.30pm  |
	| Batman & Robin                           | GO!     | 6.30pm  |
	| M*A*S*H                                  | ONE     | 6.30pm  |
	| David Attenborough's The Life of Mammals | TEN     | 6.30pm  |
	| Reef Doctors                             | ELEVEN  | 6.30pm  |
	| New Brother 4234D Sewing Machine         | TVSN    | 6.30pm  |
	| Grainger's World                         | TVS     | 6.30pm  |
	| Retail Therapy                           | 4ME     | 6.30pm  |
	+------------------------------------------+---------+---------+

Search for type of programming:

	$ wot.rb -s "Movie"
	+------------------------------+-----------+----------+
	| Program                      | Channel   | Time     |
	+------------------------------+-----------+----------+
	| At the Movies                | ABC1      | 1.30pm   |
	| Mama Mirabelle's Home Movies | ABC2/ABC4 | 11.45am  |
	+------------------------------+-----------+----------+

List channels:

	$ wot.rb -C
	Channels:
	ABC1
	ABC2 / ABC4
	ABC3
	ABC News 24
	SBS ONE
	SBS HD
	SBS 2
	NITV
	...

List locations:

	$ wot.rb -L
	Locations:
	Sydney
	Melbourne
	Brisbane
	Adelaide
	Darwin
	Hobart
	Perth

Show staff picks:

	$ wot.rb -r
	+------------------------------------------+-----------+----------+------------+
	| Program                                  | Channel   | Time     | Staff Pick |
	+------------------------------------------+-----------+----------+------------+
	| Junior Doctors: Your Life in Their Hands | ABC2/ABC4 | 8.30pm   | Yes        |
	| Pain, Pus and Poison                     | SBSONE    | 8.30pm   | Yes        |
	| Please Marry My Boy                      | Seven     | 9pm      | Yes        |
	| Big Brother                              | Nine      | 7pm      | Yes        |
	| The Gates                                | ELEVEN    | 10.30pm  | Yes        |
	+------------------------------------------+-----------+----------+------------+
