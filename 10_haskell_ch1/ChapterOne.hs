module ChapterOne where

-- 1: List comprehensions.
negsInList xs = sum [ if x < 0 then 1 else 0 | x <- xs ]
oddsInList xs = sum [ if odd x then 1 else 0 | x <- xs ]
capsInList xs = sum [ if x `elem` ['A'..'Z'] then 1 else 0 | x <- xs ]
sumOdd xs =  sum [ if odd x then x else 0 | x <- xs ]

-- 2: List of pairs.
getQuantities xs = [ fst x | x <- xs ]
getPrices xs = [ snd x | x <- xs ]
getTotal xs = sum [ (fst x)*(snd x) | x <- xs ]

-- 3: Nested list comprehension.
doubleAll xs = [[ y*2 | y <- x ] | x <- xs ]
doubleFirstList xs = head [[ y*2 | y <- x ] | x <- [xs !! 0]]
doubleSecondList xs = head [[ y*2 | y <- x ] | x <- [xs !! 1] ]
sumListItems xs = [ sum x  | x <- xs ]

-- Definition of receipt.
receipt = [(3,4),(5,6)]
