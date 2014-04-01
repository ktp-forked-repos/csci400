module ChapterFive_Pt3 where

-- 1
getUserName :: String -> String
getUserName xs = fst $ break ('@' ==) xs

-- 2
-- lambda expression
numAs :: (Num a, Ord a) => [a] -> Int
numAs xs = foldl (\acc x -> acc + 1) 0 $ filter (90<=) xs

-- 3
-- fold
totalDiscount :: (Fractional a, Num a) => a -> [a] -> a
totalDiscount x xs = foldl (\acc y -> acc + y*x) 0 xs

-- 4
-- fold
totalWithDiscount :: (Fractional a, Num a) => a -> [a] -> a
totalWithDiscount x xs = foldl (\acc y -> acc + y - y*x) 0 xs

-- 5
discountedItems :: (Fractional a) => a -> [a] -> [a]
discountedItems x = map (x*)

-- 6
-- fold
--anyBigNumbers :: (Num a) => a -> [a] -> Bool


-- 7
-- and_1 (repeat False) will immediately return False
-- and_2 (repeat False) will run forever
-- This is because foldr will only look at the first element before
-- returning False, while foldl will try to start at the end of an
-- infinite list.

-- 8
-- $
--multTableRow :: (Num a) => a -> [a]
--multTableRow x :: 

-- 9
-- function composition
-- b
