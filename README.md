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
	-l: Location (Default Melbourne)
	-C: List channels
	-L: List locations
	-n: What's on TV now (to the current hour)
	-N: What's on TV next (to the next hour
	-s: Search on subject (eg News)
	-r: Show only staff picks

Examples
========

Display Channel TEN's programming for the rest of the day:

	$ wot.rb -c TEN
	+----------------------------+-------------+-------------+-------------+
	|        TV Programme: TEN Melbourne (Tuesday 22 October 2013)         |
	+----------------------------+-------------+-------------+-------------+
	| Program                    | Channel     | Time        | Staff Pick  |
	+----------------------------+-------------+-------------+-------------+
	| Dr. Phil                   | TEN         | 12pm        |             |
	| The Doctors                | TEN         | 1pm         |             |
	| Ready Steady Cook          | TEN         | 2pm         |             |
	| Judge Judy                 | TEN         | 3pm         |             |
	| Huey's Kitchen             | TEN         | 3.30pm      |             |
	| Totally Wild               | TEN         | 4pm         |             |
	| The Bold and the Beautiful | TEN         | 4.30pm      |             |
	| TEN Eyewitness News        | TEN         | 5pm         |             |
	| The Simpsons               | TEN         | 6pm         |             |
	| The Project                | TEN         | 6.30pm      |             |
	| Recipe to Riches           | TEN         | 7.30pm      |             |
	| NCIS                       | TEN         | 8.30pm      | Yes         |
	| NCIS: Los Angeles          | TEN         | 9.30pm      |             |
	| TEN Eyewitness News Late   | TEN         | 10.30pm     |             |
	| The Project                | TEN         | 11.15pm     |             |
	+----------------------------+-------------+-------------+-------------+

Display what is on TV at 6:30pm:

	$ wot.rb -a 6:30pm
	+------------------------------+---------------+---------------+---------------+
	|        TV Programme:  Melbourne at 6.30 pm (Tuesday 22 October 2013)         |
	+------------------------------+---------------+---------------+---------------+
	| Program                      | Channel       | Time          | Staff Pick    |
	+------------------------------+---------------+---------------+---------------+
	| World News Australia         | SBSONE        | 6.30pm        |               |
	| World News Australia         | SBSHD         | 6.30pm        |               |
	| Desperate Measures           | NITV          | 6.30pm        |               |
	| Today Tonight                | Seven         | 6.30pm        |               |
	| How I Met Your Mother        | 7mate         | 6.30pm        |               |
	| A Current Affair             | Nine          | 6.30pm        |               |
	| Friends                      | GEM           | 6.30pm        |               |
	| The Middle                   | GO!           | 6.30pm        |               |
	| Get Smart                    | ONE           | 6.30pm        |               |
	| The Project                  | TEN           | 6.30pm        |               |
	| Neighbours                   | ELEVEN        | 6.30pm        |               |
	| Total Gym XLS                | SpreeTV       | 6.30pm        |               |
	| PURMinerals Makeup GOES WILD | TVSN          | 6.30pm        |               |
	| euromaxx                     | TVS           | 6.30pm        |               |
	| No More Practice             | 4ME           | 6.30pm        |               |
	+------------------------------+---------------+---------------+---------------+

Search for type of programming:

	$ wot.rb -s "Movie"
	+---------------+--------------+--------------+--------------+
	|  TV Programme:  Melbourne Movie (Tuesday 22 October 2013)  |
	+---------------+--------------+--------------+--------------+
	| Program       | Channel      | Time         | Staff Pick   |
	+---------------+--------------+--------------+--------------+
	| At the Movies | ABC1         | 9.31pm       |              |
	+---------------+--------------+--------------+--------------+

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
	+------------------------+-------------+-------------+-------------+
	|        TV Programme:  Melbourne (Tuesday 22 October 2013)        |
	+------------------------+-------------+-------------+-------------+
	| Program                | Channel     | Time        | Staff Pick  |
	+------------------------+-------------+-------------+-------------+
	| The Art of Australia   | ABC1        | 8.32pm      | Yes         |
	| Lost Girl              | SBS2        | 8.40pm      | Yes         |
	| Dancing with the Stars | Seven       | 7.30pm      | Yes         |
	| Super Fun Night        | Nine        | 8pm         | Yes         |
	| NCIS                   | TEN         | 8.30pm      | Yes         |
	+------------------------+-------------+-------------+-------------+
