{-# LANGUAGE MagicHash #-}
{-# LANGUAGE ParallelListComp #-}
-- Haskell Nim
-- See http://www.archimedes-lab.org/game_nim/nim.html

import Data.Bits
import GHC.Integer.Logarithms
import GHC.Types
import GHC.Base

type Board = [Int]
type Player = Bool

showBoard :: Board -> String
showBoard = unlines . map (flip take (repeat 'X'))

getRow :: Board -> IO Int
getRow board = do
    putStr $ "Select the row (0-" ++ (show (length board - 1)) ++ "): "
    row <- fmap read getLine
    if row `elem` [0..(length board)-1] && board !! row /= 0
    then return row
    else getRow board

getSticks :: Int -> IO Int
getSticks row = do
    putStr $ "Select the number of sticks (1-" ++ (show row) ++ "): "
    sticks <- fmap read getLine
    if sticks `elem` [1..row] then return sticks else getSticks row

updateBoard :: Board -> Int -> Int -> Board
updateBoard board row sticks = beginning ++ [board !! row - sticks] ++ drop 1 end
    where (beginning, end) = splitAt row board

humanTurn :: Board -> IO Board
humanTurn board = do
    row <- getRow board
    sticks <- getSticks $ board !! row
    let (beginning, end) = splitAt row board
    return $ updateBoard board row sticks

digitalSum :: [Int] -> Int 
digitalSum (x:xs) = foldr (xor) x xs

pickRow :: Board -> Int
pickRow board = getIndex $ map (isCandidate sum) board
    where intLog2 (I# i#) = I# (wordLog2# (int2Word# i#))
          sum = digitalSum board
          isCandidate sum row
                | intLog2 row > intLog2 sum  = isCandidate sum $ row - 2^(intLog2 row)
                | intLog2 row == intLog2 sum = 1
                | otherwise                  = 0
          getIndex xs = minimum (filter (/=0) ([ x * y | x <- xs | y <- [1,2..] ])) - 1

takeSticks :: Int -> Int -> Int
takeSticks sum row = row - digitalSum [sum, row]

computerTurn :: Board -> Board
computerTurn board = updateBoard board (pickRow board) (takeSticks (digitalSum board) (board !! (pickRow board)))

winner :: Board -> Player -> String
winner board human
    | empty && human = "Human"
    | empty          = "Computer"
    | otherwise      = ""
    where empty = filter (/=0) board == []

play :: Board -> Player -> IO ()
play board human = do
    putStrLn ""
    putStrLn "Current board:"
    putStrLn $ showBoard board
    do board <-
            if human
            then humanTurn board
            else return $ computerTurn board
       case winner board human of
           "" -> play board $ not human
           xs -> putStrLn $ xs ++ " wins the game!\nThank you for playing!"

main :: IO ()
main = do
    putStrLn "Welcome to NIM!"
    play [4,3,7] True
