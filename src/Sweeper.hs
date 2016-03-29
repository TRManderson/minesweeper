module Minesweeper.Sweeper (step,) where
import Minesweeper.Board
import System.Random
import System.IO.Unsafe (unsafePerformIO)



stdGen = unsafePerformIO (getStdGen)

step :: Board -> BoardOp
step = undefined
