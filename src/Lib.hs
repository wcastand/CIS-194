module Lib ( toDigits, toDigitsRev, doubleEveryOther, sumDigits, validate ) where

import Data.List

-- Exo 1
toDigits :: Integer -> [Integer]
toDigitsRev :: Integer -> [Integer]
-- Exo 2
doubleEveryOther :: [Integer] -> [Integer]
-- Exo 3
sumDigits :: [Integer] -> Integer
-- Exo 4
validate :: Integer -> Bool

-- Exo 1
toDigits x = reverse . toDigitsRev $ x
toDigitsRev x = unfoldr parse x
  where parse 0 = Nothing
        parse c
          | c < 0     = Nothing
          | otherwise = Just (r, q) where (q, r) = quotRem c 10
-- Exo 2
doubleEveryOther x =
  reverse .
  map parse .
  zip [0..] .
  reverse $
  x
  where parse (idx, c)
          | mod idx 2 == 0 = c
          | otherwise = c * 2
-- Exo 3
sumDigits x =
  foldl parse 0 x
  where parse sum c
          | c > 9 = sum + (sumDigits . toDigits $ c)
          | otherwise = sum + c
-- Exo 4
validate x = rem res 10 == 0
  where res =
          sumDigits .
          doubleEveryOther .
          toDigits $
          x
