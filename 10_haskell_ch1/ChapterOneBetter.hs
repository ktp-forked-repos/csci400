module ChapterOne where

-- Helper functions.
negative x = x < 0
caps x = x `elem` ['A'..'Z']

-- Assignment functions.
negsInList xs = length (filter negative xs)
oddsInList xs = length (filter odd xs)
capsInList xs = length (filter caps xs)
sumOdd xs = sum (filter odd xs)
