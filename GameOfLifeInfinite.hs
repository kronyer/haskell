module Main where
import Control.Concurrent (threadDelay)
import qualified Data.Set as Set
import Data.Set (Set)

type Board = Set (Int, Int)
type Cell = (Int, Int)


neighbors :: Cell -> [Cell]
neighbors (x, y) =
    [ (x + dx, y + dy) | dx <- [-1..1], dy <- [-1..1], (dx, dy) /= (0, 0) ]



-- Padrão inicial: Glider
initialBoard :: Board
initialBoard = Set.fromList
  [ (0,1), (1,0), (1,1), (1,2), (2,0) ]



main :: IO ()
main = do
    putStrLn "Game of Life"
    simulate initialBoard


-- Função para imprimir o tabuleiro baseado no menor retângulo que contém as vivas
printBoard :: Board -> IO ()
printBoard board
  | Set.null board = putStrLn "(nenhuma célula viva)"
  | otherwise = mapM_ putStrLn
      [ [ if (x,y) `Set.member` board then 'O' else '.'
        | x <- [minX..maxX] ]
      | y <- [minY..maxY] ]
  where
    xs = map fst (Set.toList board)
    ys = map snd (Set.toList board)
    minX = minimum xs - 1
    maxX = maximum xs + 1
    minY = minimum ys - 1
    maxY = maximum ys + 1

clearScreen :: IO ()
clearScreen = putStr "\ESC[2J\ESC[H"

-- getCell :: Board -> Int -> Int -> Bool
-- getCell board row col =
--     if row < 0 || col < 0 || row >= length board || col >= length (head board)
--     then False
--     else (board !! row) !! col


-- countNeighbors :: Board -> Int -> Int -> Int
-- countNeighbors board row col =
--     length [ () | dr <- [-1..1], dc <- [-1..1]
--                 , (dr, dc) /= (0, 0)
--                 , getCell board (row + dr) (col + dc) ]


-- nextCell :: Board -> Int -> Int -> Bool
-- nextCell board row col =
--     let alive = getCell board row col
--         neighbors = countNeighbors board row col
--     in case (alive, neighbors) of
--         (True, 2) -> True
--         (True, 3) -> True
--         (False, 3) -> True
--         _ -> False

-- Calcula a próxima geração do tabuleiro
nextGeneration :: Board -> Board
nextGeneration board =
  Set.fromList
    [ cell
    | cell <- Set.toList candidates
    , let n = liveNeighbors cell
    , (cell `Set.member` board && n `elem` [2,3]) || (not (cell `Set.member` board) && n == 3)
    ]
  where
    -- Candidatos são todas as vivas + seus vizinhos
    candidates =
      Set.unions (map (Set.fromList . neighbors) (Set.toList board) ++ [board])
    -- Conta vizinhos vivos de uma célula
    liveNeighbors cell =
      length [ n | n <- neighbors cell, n `Set.member` board ]


simulate :: Board -> IO ()
simulate board = do
  clearScreen
  printBoard board
  threadDelay 500000  -- meio segundo
  simulate (nextGeneration board)