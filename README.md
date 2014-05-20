wot
===

What's On TV

Ruby script to process Australian TV guide

Usage
=====

```
wot.rb -[h|C|L|n|N|r] -c Channel -a Time -l Location -s Search

-h: Display usage
-c: Channel [TEN,ABC1,..]
-a: Time [8,8.00,8:30,..]
-l: Location (Default Melbourne)
-C: List channels
-L: List locations
-n: What's on TV now (the current hour)
-N: What's on TV next (the next hour)
-R: Want's on TV (the rest of the day)
-s: Search on subject (eg News)
-r: Show only staff picks
```

Examples
========

Display Channel TEN's programming for the rest of the day:

```
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
```

Display what is on TV at 6:30pm:

```
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
```

Search for type of programming:

```
$ wot.rb -s "Movie"
+---------------+--------------+--------------+--------------+
|  TV Programme:  Melbourne Movie (Tuesday 22 October 2013)  |
+---------------+--------------+--------------+--------------+
| Program       | Channel      | Time         | Staff Pick   |
+---------------+--------------+--------------+--------------+
| At the Movies | ABC1         | 9.31pm       |              |
+---------------+--------------+--------------+--------------+
```

List channels:

```
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
```

List locations:

```
$ wot.rb -L
Locations:
Sydney
Melbourne
Brisbane
Adelaide
Darwin
Hobart
Perth
```

Show staff picks:

```
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
```

Show what's on for the rest of the day:

```
$ wor.rb -R
+----------------------------------------+------------+------------+------------+
|                TV Programme:  Melbourne (Tuesday 20 May 2014)                 |
+----------------------------------------+------------+------------+------------+
| Program                                | Channel    | Time       | Staff Pick |
+----------------------------------------+------------+------------+------------+
| The Writers' Room                      | ABC1       | 10pm       |            |
| Lateline                               | ABC1       | 10.23pm    |            |
| The Business                           | ABC1       | 10.58pm    |            |
| Four Corners                           | ABC1       | 11.25pm    |            |
| Outside Chance                         | ABC2/ABC4  | 9.36pm     |            |
| Archer                                 | ABC2/ABC4  | 10.05pm    |            |
| Gruen Planet                           | ABC2/ABC4  | 10.28pm    |            |
| The Roast                              | ABC2/ABC4  | 11.06pm    |            |
| Ross Kemp: Extreme World               | ABC2/ABC4  | 11.18pm    |            |
| Station Close                          | ABC3       | 9.02pm     |            |
| The World                              | ABCNews24  | 10pm       |            |
| ABC News                               | ABCNews24  | 11pm       |            |
| 7.30                                   | ABCNews24  | 11.30pm    |            |
| Dateline                               | SBSONE     | 9.30pm     |            |
| SBS World News                         | SBSONE     | 10.30pm    |            |
| Giro d'Italia                          | SBSONE     | 11pm       |            |
| Dateline                               | SBSHD      | 9.30pm     |            |
| SBS World News                         | SBSHD      | 10.30pm    |            |
| Giro d'Italia                          | SBSHD      | 11pm       |            |
| The Walking Dead                       | SBS2       | 9.20pm     |            |
| The Feed                               | SBS2       | 10.10pm    |            |
| Russell Howard's Good News             | SBS2       | 10.40pm    |            |
| Ichi                                   | SBS2       | 11.15pm    |            |
| ANZ Netball Championship 2014          | NITV       | 10pm       |            |
| Coldplay: Ghost Stories                | Seven      | 9.45pm     |            |
| Ghost                                  | Seven      | 11pm       |            |
| Air Crash Investigation                | 7TWO       | 9.30pm     |            |
| Seconds From Disaster                  | 7TWO       | 10.40pm    |            |
| When Weather Changed History           | 7TWO       | 11.45pm    |            |
| Family Guy                             | 7mate      | 10pm       |            |
| Family Guy                             | 7mate      | 10.30pm    |            |
| American Dad!                          | 7mate      | 11pm       |            |
| American Dad!                          | 7mate      | 11.30pm    |            |
| Mike's Extreme Training                | 4Me        | 10pm       |            |
| Pilates in Your Home!                  | 4Me        | 10.30pm    |            |
| Life Changers                          | 4Me        | 11pm       |            |
| Secret to Six Packs!                   | 4Me        | 11.30pm    |            |
| When Love Comes to Town                | Nine       | 8.48pm     |            |
| The Big Bang Theory                    | Nine       | 10.20pm    |            |
| The Big Bang Theory                    | Nine       | 10.48pm    |            |
| Two and a Half Men                     | Nine       | 11.14pm    |            |
| Two and a Half Men                     | Nine       | 11.42pm    |            |
| The Enforcer                           | GEM        | 9.30pm     |            |
| Longmire                               | GEM        | 11.30pm    |            |
| The Town                               | GO!        | 9.30pm     |            |
| Ross Kemp On Gangs                     | ONE        | 9.30pm     |            |
| Super Rugby Extra Time                 | ONE        | 10.30pm    |            |
| The Project                            | ONE        | 11.30pm    |            |
| NCIS: Los Angeles                      | TEN        | 9.30pm     |            |
| TEN Eyewitness News Late               | TEN        | 10.30pm    |            |
| Under the Dome                         | TEN        | 11pm       |            |
| Snog, Marry, Avoid?                    | ELEVEN     | 9.30pm     |            |
| Snog, Marry, Avoid?                    | ELEVEN     | 10.05pm    |            |
| Offspring                              | ELEVEN     | 10.40pm    |            |
| The Late Late Show with Craig Ferguson | ELEVEN     | 11.40pm    |            |
| NEW Destination Gold Launch            | TVSN       | 9.30pm     |            |
| Koalabi Uggs Season Collection         | TVSN       | 10.30pm    |            |
| Cordelia St New Fashion                | TVSN       | 11.30pm    |            |
| Dr Ho's Muscle Therapy                 | SpreeTV    | 10pm       |            |
| Shark 5-in-1 LiftAway Steam Cleaner    | SpreeTV    | 10.30pm    |            |
| Ninja Mega Kitchen System - BL770NZ    | SpreeTV    | 11pm       |            |
| iRobot Roomba                          | SpreeTV    | 11.30pm    |            |
| NEW Destination Gold Launch            | TVSN       | 9.30pm     |            |
| Koalabi Uggs Season Collection         | TVSN       | 10.30pm    |            |
| Cordelia St New Fashion                | TVSN       | 11.30pm    |            |
| Al Jazeera English                     | TVS        | 10pm       |            |
| In Good Shape                          | TVS        | 10.30pm    |            |
| Vasili's Garden to Kitchen             | TVS        | 11pm       |            |
| InStyler - Cool Touch Multi Styler     | FreshIdeas | 9.55pm     |            |
| Derma Wand                             | FreshIdeas | 10.23pm    |            |
| Ninja Mega Kitchen System - BL770NZ    | FreshIdeas | 10.52pm    |            |
| Thin Lizzy 6 in 1 Professional Powder  | FreshIdeas | 11.20pm    |            |
| Pearl Hair Remover                     | FreshIdeas | 11.22pm    |            |
| Aeropilates                            | FreshIdeas | 11.51pm    |            |
| Hot Shapers                            | Extra      | 10pm       |            |
| Jump Start Soup Mate Pro               | Extra      | 10.30pm    |            |
| Bowflex                                | Extra      | 11pm       |            |
| Dr Ho's Pain Therapy System            | Extra      | 11.30pm    |            |
| Dr Ho's Pain Therapy System            | Extra2     | 10pm       |            |
| Ninja Mega Kitchen System              | Extra2     | 10.30pm    |            |
| Total Gym XLS                          | Extra2     | 11pm       |            |
| Focus T25                              | Extra2     | 11.30pm    |            |
+----------------------------------------+------------+------------+------------+
```
