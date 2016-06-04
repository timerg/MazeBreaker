module Main where
import Data.String

main :: IO ()
main = print()

test :: IO ()
test = do
    input <- readFile "Map/aaa.map"
    let inputmap = tail $ lines input
    let inputsize = sizefind $ words input
    print $ (inputmap !! 0)
    print $ inputsize
    print $ fillBlanks inputsize inputmap


sizefind :: [String] -> (Int, Int)
sizefind (a:as) = (read(a)::Int, read(head as)::Int)

frameLeft :: (a, a) -> String -> String
frameLeft (i1, i2) st = unlines $ map ( "w" ++) $ lines st

-- fillBlank :: (Int, Int) -> String -> String
-- fillBlank (i1, i2) st = unlines $ fillBlank' (i1, i2) $ lines st

fillBlank :: (Int, Int) -> String -> String
fillBlank (i1, i2) st = st ++ replicate diff '.'
    where diff = i2 - (length st)

fillBlank' :: (Int, Int) -> String -> String
fillBlank' (_, n) s = s ++ replicate len '.'
    where
        len = n - length s



fillBlanks :: (Int, Int) -> [String] -> [String]
fillBlanks (i1, i2) xs =  map (fillBlank (i1, i2)) $  xs



