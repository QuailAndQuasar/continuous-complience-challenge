### DAY 2


#### pt.1 Calculate and print the sum of all distances

I used AI to create the boilerplate code in this challenge. The one script represents the two challenges for the day, as they built off of eachother. 

Here's a prompt example that outlines the task at hand for pt. 1:

`The input data comes from reports.txt which is in the same directory as the ruby script. It consists consists of many rows (reports), one report per line. Each report is a list of numbers called levels that are separated by spaces.

For example:

`7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9`


This example data contains six reports each containing five levels.

The task is to mark each report as "SAFE" OR "UNSAFE". Only levels that are either gradually increasing or gradually decreasing count as safe if both of the following are true:

* The levels are either all increasing or all decreasing.
* Any two adjacent levels differ by at least one and at most three.

Notes:

* The levels are either all increasing or all decreasing.
* Any two adjacent levels differ by at least one and at most three.

7 6 4 2 1: Safe because the levels are all decreasing by 1 or 2.
1 2 7 8 9: Unsafe because 2 7 is an increase of 5.
9 7 6 2 1: Unsafe because 6 2 is a decrease of 4.
1 3 2 4 5: Unsafe because 1 3 is increasing but 3 2 is decreasing.
8 6 4 4 1: Unsafe because 4 4 is neither an increase or a decrease.
1 3 6 7 9: Safe because the levels are all increasing by 1, 2, or 3.
So, in this example, 2 reports are safe.

Analyze the data and find the amount of safe reports. `


### Things I ran in to:


I realized that the script worked well on it's own but when I wanted to institute RSpec testing, it was easier to convert that plain script to a function. That way RSpec could call it as a function.  Here's a prompt for doing that:

`I want to write some RSpec tests for this ruby script.  Can you please set it up with a baseline RSpec structure that will test the ruby script? Also I'd like that RSpec test to use input from a seperate reports_txt.txt file that has sample content robust enough to test aginst the rules we followed in the script`

It created the test file, put the script in a function and drew from the test input.

### pt. 2 tolerate a single bad level

**I DID NOT GET A STAR FOR THIS SECTION.** (More on that below)
The same rules apply as before, except if removing a single level from an unsafe report would make it safe, the report instead counts as safe.

More of the above example's reports are now safe:

7 6 4 2 1: Safe without removing any level.
1 2 7 8 9: Unsafe regardless of which level is removed.
9 7 6 2 1: Unsafe regardless of which level is removed.
1 3 2 4 5: Safe by removing the second level, 3.
8 6 4 4 1: Safe by removing the third level, 4.
1 3 6 7 9: Safe without removing any level.

Outcome: 4 reports are safe

Please update your analysis by handling situations where the we can remove a single level from unsafe reports. How many reports are now safe?

### Difficulties:

I was having a very hard time getting the script to identify "safe" or "unsafe" reports after removing one bad level.  I was debugging with AI much like I would If I was pair programming. Here are some sample prompts from our conversation while we debugged:

* `on line 40 we delete a bad level.  then on line 47 we iterate it with a range to new_levels.length-1 . Do we need to add the -1 since we already performed a delete_at on line 40?`


* `Please re-evaluate against the rules of the challenge and see if you can find where we are either including or excluding reports. make adjustments as necessary.`

* `The third problem in your evaluation should be safe because if you remove the 8 it is monotonic`

I went over every line of code in this file.  It was just like debugging but AI had great opinions and scanned the code quicker than me.  That saved lots of time. 