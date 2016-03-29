module Board
  where

import Data.Array (Array, array, listArray)
import Data.Array.IArray (elems, bounds)

data Tile = UnknownTile
          | AdjacentTile Int
          | MarkedTile
          | EmptyTile
        deriving (Eq)

showTile :: Tile -> Char
showTile UnknownTile = '?'
showTile MarkedTile = '!'
showTile EmptyTile = ' '
showTile (AdjacentTile x) = head $ show x

readTile :: Char -> Tile
readTile '?' = UnknownTile
readTile '!' = MarkedTile
readTile ' ' = EmptyTile
readTile x = AdjacentTile (read (x:[]))

type Board = Array (Int, Int) Tile
readBoard :: String -> Board
readBoard str = listArray ((1, 1), (width, height)) (concat tiles)
  where
    tiles = map (map (readTile)) . lines $ str
    width = length . head $ tiles
    height = length tiles

showBoard :: Board -> String
showBoard b = concat . map (++ "\n") . rowsify w . elems $ charBoard
  where
    charBoard = fmap showTile b
    (_, (w, h)) = bounds b
    rowsify _ [] = []
    rowsify n xs = take n xs : (rowsify n (drop n xs))

newBoard :: Int -> Int -> Board
newBoard x y = array ((1, 1), (x, y))
         [((x, y), UnknownTile) | x <- [1..x], y <- [1..y]]


data RealTile = NoMine | Mine deriving (Eq)

showRealTile :: RealTile -> Char
showRealTile NoMine = ' '
showRealTile Mine = 'x'

readRealTile :: Char -> RealTile
readRealTile 'x' = Mine
readRealTile ' ' = NoMine

type RealBoard = Array (Int, Int) RealTile

readRealBoard :: String -> RealBoard
readRealBoard str = listArray ((1, 1), (width, height)) (concat tiles)
  where
    tiles = map (map (readRealTile)) . lines $ str
    width = length . head $ tiles
    height = length tiles


showRealBoard :: RealBoard -> String
showRealBoard b = concat . map (++ "\n") . rowsify w . elems $ charBoard
  where
    charBoard = fmap showRealTile b
    (_, (w, h)) = bounds b
    rowsify _ [] = []
    rowsify n xs = take n xs : (rowsify n (drop n xs))








data BoardOp = Mark (Int, Int) | Check (Int, Int)
