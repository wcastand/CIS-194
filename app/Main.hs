module Main where

import Lib

main :: IO ()
main = do
  print "Validating Credit Card Numbers"
  print "Exo 1"
  print (toDigits 1234)
  print (toDigitsRev 1234)
  print "Exo 2"
  print (doubleEveryOther [8,7,6,5])
  print (doubleEveryOther [1,2,3])
  print "Exo 3"
  print (sumDigits [16,7,12,5])
  print "Exo 3"
  print (validate 4012888888881881)
  print (validate 4012888888881882)

