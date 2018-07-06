# The Bowling Game Kata

This is a ruby implementation of [Uncle Bob’s bowling game kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata).

## The Game

A bowling game consists of 10 frames. In each frame the player is allowed up to two rolls to knock down 10 pins. Depending on the number of pins knocked down and the number of rolls required there are three different outcomes:

- An open frame is a frame where the player knocked down less than ten pins. The score is equal to the number of pins knocked down.
- A spare is a frame where the player finishes the second roll with all pins knocked down. The score of the spare is 10 plus the pins knocked down with the player’s next throw.
- A strike is a frame where the player knocks down all 10 pins with the first roll. The score is 10 plus the player’s next two rolls.

Due to the spare and strike rules the 10th frame is a special case where the player is allowed to make the additional rolls required to determine the final score. In case of a spare or strike the player has 3 rolls in this frame.

## Requirements

Write some code that keeps track of the score of a bowling game. It should support two operations:

- roll(pins) is called each time a player rolls the ball; Pins is the number of pins knocked down.
- score() is called at the end of the game and returns the score of the game

## Examples

```
 ---- ----
| X  | Y  |
 ---- ---- 
     | Z  |
      ----
X - Roll 1
Y - Roll 2
Z - Score so far
```
### Example 1 - Rolling a spare

Rolling: 5, 5, 5, 4

Total Score: 24

```
 ---- ----    ---- ----
| 5  | /  |  | 5  | 4  |
 ---- ----    ---- ----
     | 15 |       | 24 |
      ----         ----
```

### Example 2 - Rolling a strike

Rolling: 10, 5, 4

Total Score: 28

```
 ---- ----    ---- ----
| X  |    |  | 5  | 4  |
 ---- ----    ---- ----
     | 19 |       | 28 |
      ----         ----
```

### Example 3 - Rolling two stikes

Rolling: 10, 10, 5, 4

Total Score: 53

```
 ---- ----    ---- ----    ---- ---- 
| X  |    |  | X  |    |  | 5  | 4  |
 ---- ----    ---- ----    ---- ---- 
     | 25 |       | 44 |       | 53 |
      ----         ----         ---- 
```

## The final frame (frame 10)

The final frame acts differently to any other frame in the occurence of either a strike or a spare. 

If < 10 pins are knocked down in the two turns of the frame, everything is as usual. 

If the player gets a spare, they get an extra roll. This roll, however, is not added onto the overall score by itself but used to calculate the full value of the spare. 

If the player gets a strike, they get two extra rolls. As with the spare these are only used to calculate the full value of the strike. 

### Example 1 - A spare

Starting score: 100 

Rolling: 5, 5, 5

Total Score: 115
```
 ---- ----   ---- ---- ----
| .. | .. | | 5  | /  | 5  |
 ---- ----   ---- ---- ----
     | 100|           | 115|
      ----             ----
```

Note: **Not** 120 (15 from the spare + 5 from the extra roll)

### Example 2 - A strike

Starting score: 100

Rolling: 10, 5, 5

Total Score 120

```
 ---- ----   ---- ---- ----
| .. | .. | | X  | 5  | 5  |
 ---- ----   ---- ---- ----
     | 100|           | 120|
      ----             ----
```

Note: **Not** 130 (20 from the strike + (2x5) from the extra rolls)

