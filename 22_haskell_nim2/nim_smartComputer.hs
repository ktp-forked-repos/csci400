
{-# LANGUAGE MagicHash #-}
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

humanTurn :: Board -> IO Board
humanTurn board = do
    row <- getRow board
    sticks <- getSticks $ board !! row
    let (beginning, end) = splitAt row board
    return $ beginning ++ [board !! row - sticks] ++ drop 1 end

digitalSum :: [Int] -> Int 
digitalSum (x:xs) = foldr (xor) x xs

pickRow :: Int -> Board -> Int
pickRow sum board = (shorter) - ((intLog2 ((length board) .&. sum)) + 1)
    where intLog2 (I# i#) = I# (wordLog2# (int2Word# i#))
          shorter = min (length board - 1) (sum)

computerTurn :: Board -> Board
computerTurn = \xs -> case span (==0) xs of (x, y:ys) -> x ++ 0:ys

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
