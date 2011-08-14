# Welcom to Siritori 
Siritori Solver in Haskell language.

## Haskell
Haskell is a purely functional programming language.

## Siritori
Siritori is a Japanese game.
A player must say a word that begins from the last charactor of the previous player's word

For example,
The previous player said the work "apple" then you must say a word start from 'e', eye for example.

Out job is to find the longest siritori chain within given list of word.
The word can be represented by a pair (start, end) and the output can be also a list of [(start, end)].
Therefore, the function we have to develop is

'''haskell
solve :: [Word] -> [Word]
'''

Very simple. Now, let's get going!
