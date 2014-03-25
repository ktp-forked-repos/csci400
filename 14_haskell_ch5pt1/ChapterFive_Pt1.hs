module ChapterFive_Pt1 where

-- 1
-- currying
-- a
convert :: (Num a) => a -> a -> a
convert = (*)

-- b
doMetersToFeet :: Float -> Float
doMetersToFeet = convert 3.28084

doMilesToKM :: Float -> Float
doMilesToKM = convert 1.60934

-- 2
-- currying
calcSalesTax :: Double -> Double -> Double
calcSalesTax = (*)

doGolden :: Double -> Double
doGolden = calcSalesTax 0.03

doBoulder :: Double -> Double
doBoulder = calcSalesTax 0.0341

-- 3
-- map
swap :: (a,a) -> (a,a)
swap (x, y) = (y, x)

swapAll :: [(a,a)] -> [(a,a)]
swapAll = map swap

-- 4
-- The requirements say "just return 0 (or the orginal value, your
-- choice)." but the unit tests check for a 0.
applyIfTrue' :: (a -> a) -> a -> Bool -> a
applyIfTrue' f x true
    | true      = f x
    | otherwise = x

applyIfTrue :: (Num a) => (a -> a) -> a -> Bool -> a
applyIfTrue f x true
    | true      = f x
    | otherwise = 0

-- 5
-- zipWith
calcArea :: (Num a) => a -> a -> a
calcArea x y = x*y

calcAreas :: (Num a) => [a] -> [a] -> [a]
calcAreas = zipWith calcArea
