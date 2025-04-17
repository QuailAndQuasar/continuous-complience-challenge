DAY 3
pt.1 scan corrupted memory for mul() functions

### PROMPT:
We are working in the 03 directory. Our ruby script is 03_corrupted_memory.rb and it's input file is in the same directory and it's called corrupted_memory.txt

the goal of the program is just to multiply some numbers. It does that with instructions like mul(X,Y), where X and Y are each 1-3 digit numbers.

For instance, mul(44,46) multiplies 44 by 46 to get a result of 2024. Similarly, mul(123,4) would multiply 123 by 4.

there are also many invalid characters that should be ignored, even if they look like part of a mul instruction. Sequences like mul(4*, mul(6,9!, ?(12,34), or mul ( 2 , 4 ) do nothing.

For example, consider the following section of corrupted memory:

xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))

Only the four highlighted sections are real mul instructions. Adding up the result of each instruction produces 161 (2*4 + 5*5 + 11*8 + 8*5).

Scan the corrupted memory for uncorrupted mul instructions. What do you get if you add up all of the results of the multiplications?


### Approach

I set up the baseline ruby script with that prompt and went through the code.   Where I ran in to the most problems wa matching mul() with sneaky special characters.  That involved a conversation with the AI about refining the regular expression it used tø identify a valid mul().

Here's an example prompt:

```It looks like in our regular expression we are defining a non-word boundry before matching mul.  That matches much of these situations but in the case you ran in to "cowdogmul(6,9)" it wouldn't match that because the mul is inbedded in word characters```

# pt. 2 Handle conditionals

This was a cool use of Cursor.  I was having trouble matching the conditionals correctly as well as applying their order correctly.

### Prompt Example:

`There are two new instructions to add:

* The do() instruction enables future mul instructions.
* The don't() instruction disables future mul instructions.
* Only the most recent do() or don't() instruction applies. At the beginning of the program, mul instructions are enabled.

For example...given this input:

`xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))`

This corrupted memory is similar to the example from before, but this time the mul(5,5) and mul(11,8) instructions are disabled because there is a don't() instruction before them. The other mul instructions function normally, including the one at the end that gets re-enabled by a do() instruction.

This time, the sum of the results is 48 (2*4 + 8*5).

Handle the new instructions; what do you get if you add up all of the results of just the enabled multiplications?`

### Challenges

Again, I ran in to large parts of adjusting the regular expression matching.  We narrowed it down quite a bit but we coulden't quite get the ordering right with the dont() and do() methods.  We tried several iterations.

That's when I changed the AI from *Claude* to *gpt4.o*.  I asked the new AI engine to reassess the rules we laid out and try to refactor our existing script.

Not only did it rewrite the whole script all over, It wrote it 4 times smaller than the Claude engine and it got the ordering right.

By trying another AI engine, It completely produced different code and different results. 