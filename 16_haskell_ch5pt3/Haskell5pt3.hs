module Haskell5pt3 where

import ChapterFive_Pt3
import Control.Exception
import Data.Int
import Test.HUnit
import Data.List


main :: IO ()
main = do
    testGetUserName
    testNumAs
    testTotalDiscount
    testTotalWithDiscount
    testDiscountedItems
    testAnyBigNumbers            
    testMultTableRow
    testTestInverses

-- assertEqual "" value ttest

testGetUserName = Control.Exception.catch (do
        putStrLn $ "\n------ Testing getUserName ------" 
        assertEqual "Failed getUserName" (getUserName'' "ldunekac@mines.edu") (getUserName "ldunekac@mines.edu")
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex


testNumAs = Control.Exception.catch (do
        putStrLn $ "\n------ Testing numAs ------" 
        assertEqual "Failed numAs" (numAs'' [88,90,91,92,89,87]) (numAs [88,90,91,92,89,87])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex



testTotalDiscount = Control.Exception.catch (do
        putStrLn $ "\n------ Testing totalDiscount ------" 
        assertEqual "Failed totalDiscount" (totalDiscount 0.1 [1,2,3]) (totalDiscount'' 0.1 [1,2,3])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testTotalWithDiscount = Control.Exception.catch (do
        putStrLn $ "\n------ Testing totalWithDiscount ------" 
        assertEqual "Failed totalWithDiscount" (totalWithDiscount 0.1 [1,2,3]) (totalWithDiscount'' 0.1 [1,2,3])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex


testDiscountedItems = Control.Exception.catch (do
        putStrLn $ "\n------ Testing discountedItems ------" 
        assertEqual "Failed discountedItems" (discountedItems'' 0.1 [4,5,6,7]) (discountedItems 0.1 [4,5,6,7])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testAnyBigNumbers  = Control.Exception.catch (do
        putStrLn $ "\n------ Testing anyBigNumbers ------" 
        assertEqual "Failed anyBigNumbers" (anyBigNumbers  51 [78,2,1,67,98,2,100,2,3,4,2,89]) (anyBigNumbers'' 51 [78,2,1,67,98,2,100,2,3,4,2,89])
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testMultTableRow   = Control.Exception.catch (do
        putStrLn $ "\n------ Testing multTableRow  ------" 
        assertEqual "Failed multTableRow " (multTableRow 71) (multTableRow'' 71)
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex

testTestInverses  = Control.Exception.catch (do
        putStrLn $ "\n------ Testing multTableRow  ------" 
        assertEqual "FailedInverse f1 f2" (testInverses f1'' f2'') (testInverses'' f1'' f2'')
        assertEqual "FailedInverse f2 f3" (testInverses f2'' f3'') (testInverses'' f2'' f3'')
        assertEqual "FailedInverse f3 f1" (testInverses f3'' f1'') (testInverses'' f3'' f1'')
        putStrLn $ "   Passed all tests"
        ) handler
            where
                handler :: SomeException -> IO ()
                handler ex = putStrLn $ "Exception: " ++ show ex



