# Minesweeper

This is my attempt at a minesweeper solver that uses a probabilistic approach.

## Move Selection
The approach for move selection is incredibly simple and relies on the probability distribution. If there is a cell with 100% probability of being a mine, mark it, otherwise reveal the cell with the lowest mine probability. In the event of multiple cells having probability equal to the minimum, select one arbitrarily.

## Probability Distribution
So far, my attempt relies on a number of factors that are not formally proven, but I'm sure I can rely on:
 - All unrevealed squares not adjacent to either an empty space or a number have equal probability
 - Unrevealed squares next to empty tiles are safe
 - If there is an unmarked square adjacent to a 1, and it is the only unmarked square adjacent to that 1, that square is a mine
 - If a 1 is adjacent to a mine, all other cells adjacent are definitely not mines

## Other Thoughts

When playing intuitively, I notice that I play like there's an advancing front. To start the game I pick an arbitrary tile, and then eliminate all cells that are guaranteed to be a mine (which form a front due to the way numbers are revealed). After that, safe cells, mines, safe cells, mines, etc until I have to pick randomly.

I'm pretty sure I could model this problem as a binary program. I've seen one other constraint-based approach to mineseeper, but they used constraints as an approximation with a probabilistic approach only being used when constraints failed. That being said, when all you've got is a hammer, everything looks like a nail.

# Take 2
I think using a binary variable per cell might actually be the best option. I'd need to investigate whether the linear relaxation of the variables might give me something probability-esque that I can use as a suggested cell to click. Worth investigating tonight.

I still don't really want to do this with Operations Research tools, merely because I'm familiar with them, but oh well.
