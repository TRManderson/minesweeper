# Minesweeper

This is my attempt at a minesweeper solver that uses a probabalistic approach.

## Move Selection
The approach for move selection is incredibly simple and relies on the probability distribution. If there is a cell with 100% probability of being a mine, mark it, otherwise reveal the cell with the lowest mine probability. In the event of multiple cells having probability equal to the minimum, select one arbitrarily.

## Probability Distribution
So far, my attempt relies on a number of factors that are not formally proven, but I'm sure I can rely on:
 - All unrevealed squares not adjacent to either an empty space or a number have equal probability
 - Unrevealed squares next to empty tiles are safe, unless they are adjacent to a number