{-# LANGUAGE ScopedTypeVariables #-}
module Minesweeper.Sweeper (step, getAdjacent) where
import Minesweeper.Board
import Data.Array.IArray ((!), bounds,)
import Data.Maybe (isJust, fromJust)



step :: Board -> BoardOp
step = undefined

getAdjacent :: Board -> (Int, Int) -> [((Int, Int), Tile)]
getAdjacent b (x,y) = map fromJust . filter isJust $ [
        tl, l, bl, bo, br, r, tr, t
      ]
  where
    (_, (w, h)) = bounds b
    thingy ix = Just (ix, b ! ix)
    tl = if x == 1 || y == 1 then Nothing else thingy (x-1, y-1)
    l  = if x == 1 then Nothing else thingy (x-1, y)
    bl = if y == h || x == 1 then Nothing else thingy (x-1, y+1)
    bo  = if y == h then Nothing else thingy (x, y+1)
    br = if y == h || x == w then Nothing else thingy (x+1, y+1)
    r  = if x == w then Nothing else thingy (x+1, y)
    tr = if y == 1 || x == w then Nothing else thingy (x+1, y-1)
    t  = if y == 1 then Nothing else thingy (x, y-1)
