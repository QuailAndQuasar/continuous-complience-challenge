### Continous Complient Challenge
**Code By: Danny McAlerney**



***
## Overview

I chose to tackle the first three days of 2025.  I much prefer this platform to Leetcode and Hackerrank. 

I ultimately ended up doing 6 total sections of the challenges but I only got 5 stars. I couldn't find a bug in the second part of Day2 Section 2. 

There's a python script in the 01 directory.  It does the same thing as the ruby script. I wrote it and then remembered this is a Ruby position so I rewrote it with Ruby for then on out. I left the Python script there because...why not?


**About how I used AI:**

I use Cursor.  I started this leg of the project by rewording the instructions in my own words.  This is a tactic that programmers use in what some call the [rubber ducky](https://en.wikipedia.org/wiki/Rubber_duck_debugging) method. I read the directions of the challenge and then I create a general baseline prompt by writing the challenge as I understand it.  It's in this manner that AI prompting makes me understand and have opinions about the challenge in it's entirety. 

#### For Example:

```
we are working with 03_corrupted_memory.rb.  We are getting our input from corrupted_memory.txt.  The input will come from corrupted_data.txt.  
Please write a ruby script for 03_corrupted_memory.rb and solve this problem: 
Our goal is just to multiply some numbers. It does that with instructions like mul(X,Y), where X and Y are each 1-3 digit numbers. For instance, mul(44,46) multiplies 44 by 46 to get a result of 2024. Similarly, mul(123,4) would multiply 123 by 4.

There are also many invalid characters that should be ignored, even if they look like part of a mul instruction. Sequences like mul(4*, mul(6,9!, ?(12,34), or mul ( 2 , 4 ) do nothing.

For example, consider the following input row of corrupted memory:

xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
Only the four highlighted sections are real mul instructions. Adding up the result of each instruction produces 161 (2*4 + 5*5 + 11*8 + 8*5).

Scan the corrupted memory ros for uncorrupted mul instructions. What do you get if you add up all of the results of the multiplications?
```

This will write a considerable amount of code but It is far from correct.  I repeat, this in no ways writes my code for me willy-nilly.  It saves time by eliminating the need to do synax searching on google, plain ol' typing, and more. 

**After Every prompt it:**

**Explains what it is doing:**  It repeats the problem it's trying to solve so I know we both understand that part of the code refinement. 

**Shows what it is changing:** It shows the code it changes in a diff-like visual and I can accept the changes by whole file or by changed sections separately. 

**Reiterates what It changed and Why:** It summarizes what and why It changed the code and also let's you know what the AI's projected outcome should be. 


I'll get more specific about AI in the challenge directories. 