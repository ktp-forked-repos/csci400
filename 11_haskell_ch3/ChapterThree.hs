module ChapterThree where

-- 1
inList :: (Eq a) => a -> [a] -> [a]
inList x xs = [ y | y <- xs, x == y ]

-- 2
square :: (Num a) => a -> a
square x = x^2

squareEvenNumbers :: (Integral a) => [a] -> [a]
squareEvenNumbers xs = [ square x | x <- xs, even x ]

-- 3
-- as-patterns
courseMajor :: String -> String
courseMajor course@(x:y:xs) = course ++ " is a " ++ [x] ++ [y] ++ " course"

-- 3
-- simple where clause


-- 4
-- constants in where clause


-- 5
-- function definition in the where clause


-- 6
-- function definition in the where clause


-- 7
-- guards


-- 8
-- two different ways


-- 9
-- 
