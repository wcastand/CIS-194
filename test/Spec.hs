-- test/Spec.hs
module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Lib

main :: IO ()
main = do
  defaultMain (testGroup "Our Library Tests" [toDigitsTest, toDigitsRevTest, doubleEveryOtherGroupTest, sumDigitsTest, validateGroupTest])

toDigitsTest :: TestTree
toDigitsTest = testCase "Testing toDigits"
  (assertEqual "Should return the good answer" [1,2,3,4] (toDigits 1234))

toDigitsRevTest :: TestTree
toDigitsRevTest = testCase "Testing toDigitsRev"
  (assertEqual "Should return the good answer" [4,3,2,1] (toDigitsRev 1234))

doubleEveryOtherGroupTest :: TestTree
doubleEveryOtherGroupTest = testGroup "Testing doubleEveryOther" [doubleEveryOtherTestOne, doubleEveryOtherTestTwo]

doubleEveryOtherTestOne :: TestTree
doubleEveryOtherTestOne = testCase "Testing doubleEveryOther"
  (assertEqual "Should return the good answer" [16,7,12,5] (doubleEveryOther [8,7,6,5]))

doubleEveryOtherTestTwo :: TestTree
doubleEveryOtherTestTwo = testCase "Testing doubleEveryOther"
  (assertEqual "Should return the good answer" [1,4,3] (doubleEveryOther [1,2,3]))

sumDigitsTest :: TestTree
sumDigitsTest = testCase "Testing sumDigits"
  (assertEqual "Should return the good answer" 22 (sumDigits [16,7,12,5]))


validateGroupTest :: TestTree
validateGroupTest = testGroup "Testing validate" [validateTestOne, validateTestTwo]

validateTestOne :: TestTree
validateTestOne = testCase "Testing validate"
  (assertEqual "Should return the good answer" True (validate 4012888888881881))

validateTestTwo :: TestTree
validateTestTwo = testCase "Testing validate"
  (assertEqual "Should return the good answer" False (validate 4012888888881882))
