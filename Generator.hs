import Random
import System

randomInts :: Int -> Int -> [Int]
randomInts n seed = take n $ randomRs (0,100) $ mkStdGen seed

randomTuples :: Int -> [(Int, Int)]
randomTuples n = zip (randomInts n 111) (randomInts n 222)

main = do
  args <- getArgs
  let n = read (args !! 0) :: Int
  let xs = randomTuples $ n
  print xs
