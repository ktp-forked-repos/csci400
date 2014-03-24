module Haskell5pt1 where

import ChapterFive_Pt1
import Control.Exception
import Data.Int
import Test.HUnit
import Data.List
import Text.Printf

main :: IO ()
main = do
    testConvert
    testMetersToFeet
    testMilesToKM
    testTax
    testSwap
    testApplyIfTrue
    testCalcAreas

testConvert = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        assertEqual "Failed to convert" (20) (convert 4 5)
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex


testMetersToFeet = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        -- printf "%.4f\n" $ (doMetersToFeet 1.0)
        -- printf "%.4f\n" $ (doMetersToFeet 3.0) 
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testMilesToKM = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        -- printf "%.4f\n" $ (doMilesToKM 1.0)
        -- printf "%.4f\n" $ (doMilesToKM 5.0)
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testTax = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        assertEqual "Failed goden" (0.3) (doGolden 10)
        -- printf "%.4f\n" $ (doBoulder 10)
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testSwap = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        assertEqual "Failed swap" (7,6) (swap (6,7))
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testApplyIfTrue = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        assertEqual "Failed apply if true" (6) (applyIfTrue (*3) 2 True)
        assertEqual "Failed apply if false" (0) (applyIfTrue (*3) 2 False)
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testCalcAreas = Control.Exception.catch (do
        putStrLn $ "\n------ Testing function ------" 
        assertEqual "Failed calcAreas" [6,24,16] (calcAreas [3,6,8] [2,4,2])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

