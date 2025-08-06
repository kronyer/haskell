module Main where
import Control.Concurrent (threadDelay)
import qualified Data.Set as Set
import Data.Set (Set)

type Board = [[Bool]]

initialBoard :: Board
initialBoard =
  [ [False, False, False, False, False]
  , [False, False, True,  False, False]
  , [False, False, True,  False, False]
  , [False, False, True,  False, False]
  , [False, False, False, False, False]
  ]


main :: IO ()
main = do
    putStrLn "Game of Life"
    simulate initialBoard


printBoard :: Board -> IO ()
printBoard board = mapM_ putStrLn (map renderRow board)
    where
        renderRow row = [ if cell then 'O' else '.' | cell <- row ]


getCell :: Board -> Int -> Int -> Bool
getCell board row col =
    if row < 0 || col < 0 || row >= length board || col >= length (head board)
    then False
    else (board !! row) !! col


countNeighbors :: Board -> Int -> Int -> Int
countNeighbors board row col =
    length [ () | dr <- [-1..1], dc <- [-1..1]
                , (dr, dc) /= (0, 0)
                , getCell board (row + dr) (col + dc) ]


nextCell :: Board -> Int -> Int -> Bool
nextCell board row col =
    let alive = getCell board row col
        neighbors = countNeighbors board row col
    in case (alive, neighbors) of
        (True, 2) -> True
        (True, 3) -> True
        (False, 3) -> True
        _ -> False

nextGeneration :: Board -> Board
nextGeneration board =
    [ [ nextCell board row col | col <- [0..cols-1] ]
    | row <- [0..rows-1] ]
  where
    rows = length board
    cols = length (head board)


simulate :: Board -> IO ()
simulate board = do
    printBoard board
    putStrLn ""
    threadDelay 500000 -- 0.5 second delay
    simulate (nextGeneration board)