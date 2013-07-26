wot
===

What's On TV

Ruby script to process TV guide

Usage
=====

	./wot.rb -[h|C] -c Channel -a Time -l Location
	-h: Display usage
	-c: Channel [TEN,ABC1,..]
	-a: Time [8,8.00,8:30,..]
	-l: Location
	-C: List channels
	-L: List locations

Examples
========

Display Channel TEN's programming for the evening:

	$ ./wot.rb -c TEN
	The Simpsons on TEN at 6pm 
	The Project on TEN at 6.30pm 
	The Living Room on TEN at 7.30pm 
	NCIS on TEN at 8.30pm 
	This Week Live on TEN at 9.30pm 
	Ten Late News on TEN at 10.30pm 
	The Project on TEN at 11.15pm 

Display what is on TV at 6:30:

	$ ./wot.rb -a 6:30
	World News Australia on SBS ONE at 6.30pm 
	World News Australia on SBS HD at 6.30pm 
	Around The Traps on NITV at 6.30pm 
	Today Tonight on Seven at 6.30pm 
	Bargain Hunt on 7TWO at 6.30pm 
	A Current Affair on Nine at 6.30pm 
	Friends on GEM at 6.30pm 
	Get Smart on ONE at 6.30pm 
	The Project on TEN at 6.30pm 
	Neighbours on ELEVEN at 6.30pm 
	ZULTANITE Naturally Precious on TVSN at 6.30pm 
	euromaxx on TVS at 6.30pm 
	Scrap It TV Christmas Special on 4ME at 6.30pm 

List channels:

	$ ./wot.rb -C
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

	$ ./wot.rb -L
	Locations:
	Sydney
	Melbourne
	Brisbane
	Adelaide
	Darwin
	Hobart
	Perth

