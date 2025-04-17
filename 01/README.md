# DAY 1
Code Challenge for Continuous Complience LLC

### Calculate and print the sum of all distances

I used AI to create the boilerplate code in this challenge. 

Some problems I ran in to here was getting the AI to point to the `locations.txt` file.  I solved that by prompting:

` I'm working with the 01_locations.rb. The loctions.txt file is in the same directory as that ruby script `

I realized that the script worked well on it's own but when I wanted to institute RSpec testing, it was easier to convert that plain script to a function. That way RSpec could call it as a function.  Here's a prompt for doing that:

`I want to write some RSpec tests for this ruby script.  Can you please set it up with a baseline RSpec structure that will test the ruby script? Also I'd like that RSpec test to use input from a seperate locations_test.txt file that has sample content robust enough to test aginst the rules we followed in the script`

It created the test file, put the script in a function and drew from the test input. 