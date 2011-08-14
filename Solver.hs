import Control.Monad
import Data.List

type Elem = (Int, Int)

-- Either Monad is not defined yet in ghc of 6.x
instance Monad (Either a) where
  Right a >>= f = f a
  Left a >>= _ = Left a
  return = Right

getEither :: Either a a -> a
getEither (Right a) = a
getEither (Left a) = a

-- Generating all the candidate array which is evaluated lazily.
allCombination = f :: [a] -> [[a]]
 where
   g = map permutations . h 
   f = concat . g
   h = filterM (\x -> [True, False]) :: [a] -> [[a]]

-- foldM :: (a->b->m a)->a->[b]->m a
detectChain :: [Elem] -> [Elem]
detectChain = getEither . foldM f [] 
  where
   f [] x = Right [x]
   f ((a,b):xs) (c,d) 
     | b == c = Right $ (c,d):(a,b):xs
     | otherwise = Left $ (a,b):xs

-- returns (the max chain, and its length)
solve :: [Elem] -> [Elem]
solve xs = getEither $ foldM f [] $ ys
  where 
    ys = sortBy g $ allCombination xs
    g = \a b -> compare (length b) (length a)
    f max input 
      | length max > length input = Left max
      | otherwise = if length chain > length max 
                    then Right chain
                    else Right max
      where chain = detectChain input
          
main = do
  content <- getContents
  let elements = read content
  print $ solve elements
