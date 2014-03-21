module ChapterFour where

-- 1
minimum' :: (Ord a) => [a] -> a
minimum' [] = error "empty list"
minimum' (x:xs) = min' x xs
    where min' m [] = m
          min' m (y:ys) = min' (min m y) ys

-- 2
calcSum :: (Num a) => [a] -> a
calcSum [] = 0
calcSum (x:xs) = sum' x xs
    where sum' s [] = s
          sum' s (y:ys) = sum' (s + y) ys 

-- 3
count :: [a] -> Int
count [] = 0
count (x:xs) = len' x xs
    where len' x [] = 1
          len' x (y:ys) = 1 + len' y ys

-- 4
makeRange :: (Enum a, Eq a) => a -> a -> [a]
makeRange x y
    | x == y    = [x]
    | otherwise = x : makeRange (succ x) y

-- 5
makeReverseRange :: (Enum a, Eq a) => a -> a -> [a]
makeReverseRange x y
    | x == y    = [x]
    | otherwise = [y] ++ makeReverseRange x (pred y)

-- 6
notInList :: (Eq a) => a -> [a] -> Bool
notInList x xs = x `nelem'` xs
    where nelem' x [] = True
          nelem' x (y:ys) = if x == y then False else x `nelem'` ys 

-- 7
square :: (Num a) => a -> a
square x = x^2

squareAll :: (Num a) => [a] -> [a]
squareAll [] = []
squareAll (x:xs) = square x : squareAll xs

-- 8
squareIfEven :: (Integral a) => [a] -> [a]
squareIfEven [] = []
squareIfEven (x:xs)
    | even x    = square x : squareIfEven xs
    | otherwise = x : squareIfEven xs

-- 9
squareOnlyEven :: (Integral a) => [a] -> [a]
squareOnlyEven [] = []
squareOnlyEven (x:xs)
    | even x    = square x : squareOnlyEven xs
    | otherwise = squareOnlyEven xs

-- 10
mergeSort :: (Ord a) => [a] -> [a] -> [a]
mergeSort [] [] = []
mergeSort (x:xs) [] = x:xs
mergeSort [] (y:ys) = y:ys
mergeSort (x:xs) (y:ys)
    | x < y     = x : mergeSort xs (y:ys)
    | x > y     = y : mergeSort (x:xs) ys
    | otherwise = x : y : mergeSort xs ys

-- 11
subList :: Int -> Int -> [b] -> [b]
subList i n [] = []
subList i n (x:xs)
    | i < 0 || n < 1 = []
    | i > 0          = subList (i-1) n xs
    | i == 0         = x : subList i (n-1) xs
