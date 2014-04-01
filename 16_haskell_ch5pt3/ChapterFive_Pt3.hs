module Chapter5_Pt3 where

-- 1
getUserName :: String -> String


-- 2
-- lambda expression
numAs :: (Num a) => a -> Int


-- 3
-- fold
totalDiscount :: (Fractional a, Num a) => a -> [a] -> a


-- 4
-- fold
totalWithDiscount :: (Fractional a, Num a) => a -> [a] -> a

-- 5
-- fold
discountedItems :: (Fractional a, Num a) => a -> [a] -> [a]


-- 6
-- fold
anyBigNumbers :: (Num a) => a -> [a] -> Bool

-- 7
-- 


-- 8
-- $
multTableRow :: (Num a) => a -> [a]


-- 9
-- function composition
-- b
