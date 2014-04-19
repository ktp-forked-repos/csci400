-- Haskell Nim
-- See http://www.archimedes-lab.org/game_nim/nim.html
-- Note: Requires haskell-random package!

import System.Random

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
    return $ updateBoard board row sticks

computerTurn :: Board -> IO Board
computerTurn board = do
    row <- randomRIO (0, length board - 1)
    sticks <- randomRIO (1, board !! row)
    return $ updateBoard board row sticks

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
            else computerTurn board
       case winner board human of
           "" -> play board $ not human
           xs -> putStrLn $ xs ++ " wins the game!\nThank you for playing!"

main :: IO ()
main = do
    putStrLn "Welcome to NIM!"
    play [4,3,7] True
