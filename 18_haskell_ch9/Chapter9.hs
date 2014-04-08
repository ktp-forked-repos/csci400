import System.IO
import Data.Char

-- 1
pigLatin :: String -> String
pigLatin xs = if head xs `elem` "aeiou"
                 then xs ++ "way"
                 else tail xs ++ [head xs] ++ "ay"

-- 2
piggly :: IO ()
piggly = do
    hSetBuffering stdout LineBuffering  -- This is only needed by GHCI
    interact $ unlines . map (unwords . map pigLatin . words) . lines

-- 3
caesar :: Int -> Char -> Char
caesar x y
    | not $ y `elem` range = y
    | adj `elem` range     = adj
    | y `elem` range       = chr $ ord adj - 26
    | otherwise            = y
    where adj   = chr $ x + ord y
          i     = ord y
          range = ['a'..'z'] ++ ['A'..'Z']

-- 4
encrypt :: Int -> IO ()
encrypt x = do
    hSetBuffering stdout LineBuffering  -- This is only needed by GHCI
    interact $ map $ caesar x

-- 5
encryptFile :: Int -> IO ()
encryptFile x = do
    handle <- openFile "encryptMe.txt" ReadMode
    contents <- hGetContents handle
    putStr $ map (caesar x) contents
    hClose handle
