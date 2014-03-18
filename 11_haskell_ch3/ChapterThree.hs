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
threshold :: (Num a, Ord a) => a -> a -> a -> String
threshold price qty size
    | total < size   = "Total is low"
    | total < medium = "Total is medium"
    | total < high   = "Total is high"
    | otherwise      = "Total is extrodinary"
    where total = price * qty
          medium = size + (size - 1)
          high = medium + (size - 1)

-- 4
-- constants in where clause
lactate :: (Fractional a, Ord a) => a -> a -> String
lactate rate max
    | rate <= easy*max        = "warmup"
    | rate <= aerobic*max     = "aerobic"
    | rate <= steadyState*max = "steadyState"
    | rate <= anaerobic*max   = "anaerobic"
    | otherwise               = "wow, don't do this for long!"
    where easy = 0.6
          aerobic = 0.7
          steadyState = 0.8
          anaerobic = 0.9
          competitive = 1

-- 5
-- function definition in the where clause
calcAreas :: (Num a) => [(a, a)] -> [a]
calcAreas xs =
    [ area x | x <- xs ]
    where area pair = fst pair * snd pair

-- 6
-- function definition in the where clause
calcTriangleAreas :: (Fractional a) => [(a, a)] -> [a]
calcTriangleAreas xs =
    [ triangleArea x | x <- xs ]
    where triangleArea pair = fst pair * snd pair * 0.5

-- 7
-- guards
orderTwo :: (Ord a) => [a] -> [a]
orderTwo (x:y)
    | x < y     = [x, y]
    | otherwise = [y, x]

-- 8
-- two different ways
orderThree :: (Ord a) => [a] -> [a]
--orderThree (x:y:z:_)
--    | 

-- 9
-- 
