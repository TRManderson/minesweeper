module Sweeper (step,) where
import Board
import System.Random
import System.IO.Unsafe (unsafePerformIO)



stdGen = unsafePerformIO (getStdGen)

step :: Board -> BoardOp
step = undefined